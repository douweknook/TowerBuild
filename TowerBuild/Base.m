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
        NSString *difficulty = [[NSUserDefaults standardUserDefaults] objectForKey:@"difficulty"];
        if ([difficulty  isEqualToString:@"easy"]) {
            self.size = CGSizeMake(150, 60);
            self.color = [SKColor greenColor];
        }
        else if ([difficulty isEqualToString:@"medium"]) {
            self.size = CGSizeMake(125, 60);
            self.color = [SKColor orangeColor];
        }
        else if ([difficulty isEqualToString:@"hard"]) {
            self.size = CGSizeMake(100, 60);
            self.color = [SKColor redColor];
        }
        else {
            self.size = CGSizeMake(125, 60);
            self.color = [SKColor yellowColor];
        }
    }
    return self;
}

@end
