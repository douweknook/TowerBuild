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
    // global variables
    SKNode *worldNode;
    SKSpriteNode *_block;
    SKSpriteNode *_base;
    int amountOfBlocks;
    CGSize newSize;
    int boundLeft;
    int boundRight;
    NSUInteger nodesLeft;
    int nodesChecked;
    int score;
}

@end

@implementation TowerBuildScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        
        self.backgroundColor = [SKColor whiteColor];
        
        worldNode = [SKNode node];
        worldNode.position = self.position;
        [self addChild:worldNode];

        amountOfBlocks = 0;
        score = 0;
        
        // Place base sprite
        _base = [Base new];
        _base.position = CGPointMake(self.frame.size.width/2, _base.size.height/2);
        boundLeft = _base.position.x - _base.size.width/2;
        boundRight = _base.position.x + _base.size.width/2;
        NSLog(@"left: %d, right: %d",boundLeft, boundRight);
        [worldNode addChild:_base];
        
        // Set up block sprite
        [self createNewBlock];
        [self move:_block];
    }
    return self;
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    //[self move:_block];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self placeBlock];
    if ([self checkGameOver] == TRUE) {
        NSLog(@"GAME OVER!");
    }
    else {
        [self moveSceneUp];
        [self createNewBlock];
        [self move:_block];
    }
}

-(void)moveSceneUp{
    if (_block.position.y >= self.view.center.y) {
        worldNode.position = CGPointMake(worldNode.position.x, worldNode.position.y - _block.size.height);
    }
}

-(void)update:(CFTimeInterval)currentTime {

}

-(void)move:(SKSpriteNode*)sprite {
    CGRect screenSize = [[UIScreen mainScreen] bounds];
    // Create path to follow from left to right
    SKAction *moveRight = [SKAction moveTo:CGPointMake(screenSize.size.width - _base.size.width/2, sprite.position.y) duration:2.5];
    SKAction *moveLeft = [SKAction moveTo:CGPointMake(-_base.size.width/2, sprite.position.y) duration:2.5];
    // Repeat this action forever
    SKAction *moveBlock = [SKAction repeatActionForever:[SKAction sequence:@[moveRight, moveLeft]]];
    [sprite runAction:moveBlock withKey:@"moveBlock"];
}

-(void)placeBlock {
    nodesLeft = _block.children.count;
    nodesChecked = 0;
    [_block removeActionForKey:@"moveBlock"];
    for (SKSpriteNode *node in _block.children) {
        nodesChecked++;
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
    newSize = CGSizeMake((float)nodesLeft, _block.size.height);
}

-(SKSpriteNode *)createNewBlock {
    if (amountOfBlocks == 0) {
        _block = [[Block alloc] initWithSize:CGSizeMake(_base.size.width, _base.size.height/2)];
    }
    else {
        _block = [[Block alloc] initWithSize:newSize];
    }
    _block.position = CGPointMake(0, (_base.size.height + _block.size.height/2) + amountOfBlocks * _block.size.height);
    amountOfBlocks = amountOfBlocks+1;
    [worldNode addChild:_block];
    return _block;
}

-(BOOL)checkGameOver {
    if (_block.children.count == 0) {
        return YES;
    }
    return NO;
}


@end
