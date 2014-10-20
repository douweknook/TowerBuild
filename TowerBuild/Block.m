//
//  Block.m
//  TowerBuild
//
//  Created by Douwe Knook on 08-10-14.
//
//

#import <SpriteKit/SpriteKit.h>
#import "Block.h"

@implementation Block

int colorPicker = 0;

- (id)initWithSize:(CGSize)size {
    // Create block sprite with given size
    if (self = [super init]) {
        self.size = size;
        CGSize blockPartSize = CGSizeMake(1, self.size.height);
        UIColor *blockColor = [self pickColor];
        // Block sprite consists of smaller sprite nodes of i pixel width each
        for (int i = 0; i < self.size.width; i++) {
            SKSpriteNode *blockPart = [SKSpriteNode spriteNodeWithColor:blockColor size:blockPartSize];
            blockPart.position = CGPointMake(i, 0);
            [self addChild:blockPart];
        }
    }
    return self;
}

-(UIColor *)pickColor {
    // Changes the color of the block in repeated pattern
    UIColor *color;
    switch (colorPicker) {
        case 0:
            color = [UIColor greenColor];
            break;
        case 1:
            color = [UIColor yellowColor];
            break;
        case 2:
            color = [UIColor blueColor];
            break;
        case 3:
            color = [UIColor redColor];
            break;
        default:
            break;
    }
    if (colorPicker == 3) {
        colorPicker = 0;
    }
    else {
        colorPicker++;
    }
    return color;
}

@end
