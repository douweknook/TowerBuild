//
//  Base.m
//  TowerBuild
//
//  Created by Douwe Knook on 08-10-14.
//
//

#import "Base.h"
#import <SpriteKit/SpriteKit.h>

@implementation Base

- (id)init {
    if (self = [super init]) {
        self.size = CGSizeMake(120, 50);
        self.color = [SKColor redColor];
    }
    return self;
}

@end
