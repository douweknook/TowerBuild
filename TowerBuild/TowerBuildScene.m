//
//  TowerBuildScene.m
//  TowerBuild
//
//  Created by Douwe Knook on 06-10-14.
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "TowerBuildScene.h"
#import "Base.h"
#import "Block.h"

@interface TowerBuildScene () {
    // Set global variables
    SKNode *worldNode;
    SKSpriteNode *_block;
    SKSpriteNode *_base;
    CGSize newSize;
    float blockStartPosition;
    int amountOfBlocks;
    int score;
    int boundLeft;
    int boundRight;
    int nodesChecked;
    NSUInteger nodesLeft;
    
}

@end

@implementation TowerBuildScene

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        // Set background color
        self.backgroundColor = [SKColor whiteColor];
        
        // Create world node to hold all sprites
        worldNode = [SKNode node];
        worldNode.position = self.position;
        [self addChild:worldNode];
        
        // Set variables to 0 to make sure they are never nil
        amountOfBlocks = 0;
        score = 0;
        blockStartPosition = 0;
        
        // Place base sprite
        _base = [Base new];
        _base.position = CGPointMake(self.frame.size.width/2, _base.size.height/2);
        [worldNode addChild:_base];
        
        // Set bounds for placing block
        boundLeft = _base.position.x - _base.size.width/2;
        boundRight = _base.position.x + _base.size.width/2;
        
        // Set up block sprite
        [self createNewBlock];
        [self move:_block];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    // Upon touch, place block
    [self placeBlock];
    // If game over, remove block and show game over screen
    if ([self checkGameOver] == TRUE) {
        [_block removeFromParent];
        [self.interfaceDelegate showGameOver];
        
    }
    // Else, update score, move up (if necessary) and create next block
    else {
        [self.interfaceDelegate updateScore:score]; // Update score
        [self moveSceneUp];
        [self createNewBlock];
        [self move:_block];
    }
}

-(void)moveSceneUp {
    // After reaching middle of screen, keep currently moving block in middle by moving all sprites down
    if (_block.position.y >= self.view.center.y) {
        worldNode.position = CGPointMake(worldNode.position.x, worldNode.position.y - _block.size.height);
    }
}

-(void)move:(SKSpriteNode*)sprite {
    // Create actions for sprite to move along across screen (smaller duration is faster)
    CGRect screenSize = [[UIScreen mainScreen] bounds];
    SKAction *moveRight = [SKAction moveTo:CGPointMake(screenSize.size.width - _block.size.width, sprite.position.y) duration:1.6];
    SKAction *moveLeft = [SKAction moveTo:CGPointMake(0, sprite.position.y) duration:1.6];
    
    // Start left or right depending on blockStartPosition
    if (blockStartPosition == 0) {
        SKAction *moveBlockRightToLeft = [SKAction repeatActionForever:[SKAction sequence:@[moveRight, moveLeft]]];
        [sprite runAction:moveBlockRightToLeft withKey:@"moveBlock"];
    }
    else {
        SKAction *moveBlockLeftToRight = [SKAction repeatActionForever:[SKAction sequence:@[moveLeft, moveRight]]];
        [sprite runAction:moveBlockLeftToRight withKey:@"moveBlock"];
    }
}

-(void)placeBlock {
    // Keep count of nodes left in block and of nodes checked
    nodesLeft = _block.children.count;
    nodesChecked = 0;
    // Stop moving
    [_block removeActionForKey:@"moveBlock"];
    // Go over all nodes in block sprite (each node is 1 pixel)
    for (SKSpriteNode *node in _block.children) {
        nodesChecked++;
        // If node is outside bounds, remove node from parent (block)
        if (_block.position.x + node.position.x < boundLeft || _block.position.x + node.position.x > boundRight) {
            [node removeFromParent];
            nodesLeft--;
        }
        
        // Set new right side bound
        if ((int)_block.position.x + (int)node.position.x == boundLeft) {
            boundRight = boundLeft + (int)nodesLeft;
        }
        
        // Set new left side bound
        if ((int)_block.position.x + (int)node.position.x == boundRight) {
            boundLeft = boundRight - nodesChecked;
        }
    }
    // Set size for next block
    newSize = CGSizeMake((float)nodesLeft, _block.size.height);
}

-(SKSpriteNode *)createNewBlock {
    // Create a new block with right size
    if (amountOfBlocks == 0) {
        _block = [[Block alloc] initWithSize:CGSizeMake(_base.size.width, _base.size.height/2)];
    }
    else {
        _block = [[Block alloc] initWithSize:newSize];
    }
    
    // Switch to pick random beginning position of block (left or right side of screen)
    switch (arc4random_uniform(2)) {
        case 0:
            blockStartPosition = 0;
            break;
        case 1:
            blockStartPosition = self.frame.size.width - _block.size.width;
            break;
        default:
            break;
    }
    
    // Set position right above last block, count blocks created and add block to world node
    _block.position = CGPointMake(blockStartPosition, (_base.size.height + _block.size.height/2) + amountOfBlocks * _block.size.height);
    amountOfBlocks = amountOfBlocks+1;
    [worldNode addChild:_block];
    return _block;
}

-(BOOL)checkGameOver {
    // If block has 0 nodes, block missed target. Game over
    if (_block.children.count == 0) {
        return YES;
    }
    // If not game over, block was placed atop base. Increase score
    score++;
    return NO;
}

-(void)pause {
    // Pause the game scene
    self.view.paused = YES;
}

-(void)resume {
    // Resume game scene
    self.view.paused = NO;
}

@end
