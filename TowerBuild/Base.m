//
//  Base.m
//  TowerBuild
//
//  Created by Douwe Knook on 08-10-14.
//
//

#import <SpriteKit/SpriteKit.h>
#import "Base.h"

@implementation Base

- (id)init {
    // Set size and color for base sprite
    if (self = [super init]) {
        self.size = CGSizeMake(120, 50);
        self.color = [SKColor redColor];
    }
    return self;
}

@end
