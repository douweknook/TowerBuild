//
//  Block.m
//  TowerBuild
//
//  Created by Douwe Knook on 08-10-14.
//
//

#import "Block.h"
#import <SpriteKit/SpriteKit.h>

@implementation Block

- (id)initWithSize:(CGSize)size {
    if (self = [super init]) {
        // Create block sprite
        self.size = size;
        CGSize blockPartSize = CGSizeMake(1, self.size.height);
        for (int i = 0; i < self.size.width; i++) {
            SKSpriteNode *blockPart = [SKSpriteNode spriteNodeWithColor:[SKColor greenColor] size:blockPartSize];
            blockPart.position = CGPointMake(i, 0);
            [self addChild:blockPart];
        }
    }
    return self;
}

@end
