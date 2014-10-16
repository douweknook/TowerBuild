//
//  Sprite.m
//  TowerBuild
//
//  Created by Douwe Knook on 13-10-14.
//
//

#import "Sprite.h"
#import <SpriteKit/SpriteKit.h>

@implementation Sprite

-(id)initWithSpriteImageName:(NSString*)name {
    if(self = [super init]) {
        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:name];
        sprite.size = CGSizeMake(60,60);
        
        self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:sprite.size];
        self.physicsBody.usesPreciseCollisionDetection = YES;
        [self addChild:sprite];
    }
    return self;
}

-(void)removeFromParent {
    [super removeFromParent];
}

@end
