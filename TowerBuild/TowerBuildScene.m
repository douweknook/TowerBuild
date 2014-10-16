//
//  MyScene.m
//  TowerBuild
//
//  Created by Douwe Knook on 06-10-14.
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "TowerBuildScene.h"

@interface MyScene () {
    // global variables
    SKSpriteNode *block;
    SKSpriteNode *base;
    SKLabelNode *scoreLabel;
    int score;
}

@end

@implementation MyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        [self setup];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

-(void)setup {
    // Place base sprite
    base = [SKSpriteNode spriteNodeWithImageNamed:@"base"];
    base.position = CGPointMake(CGRectGetMidX(self.frame), 25);
    [self addChild:base];
    
    // Set up block sprite
    block = [SKSpriteNode spriteNodeWithImageNamed:@"block"];
    int x = arc4random_uniform(200);
    block.position = CGPointMake(x , 65);
    [self addChild:block];
    [self move];

    // Set background color
    self.backgroundColor = [SKColor whiteColor];
    // Set score to 0
    score = 0;
    // Set score label to 0
    scoreLabel = [SKLabelNode labelNodeWithFontNamed:@"Arial"];
    scoreLabel.text = @"Score: 0";
    scoreLabel.fontColor = [SKColor blackColor];
    scoreLabel.fontSize = 30;
    scoreLabel.position = CGPointMake(CGRectGetMidX(self.frame), 510);
    [self addChild:scoreLabel];

}

-(void)move {
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path, NULL, 50, 100);
    SKAction *followLine = [SKAction followPath:path asOffset:YES orientToPath:NO duration:3.0];
    [block runAction: followLine];
}

@end
