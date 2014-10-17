//
//  TowerBuildScene.h
//  TowerBuild
//

//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "Block.h"

@protocol TowerBuildSceneInterfaceDelegate <NSObject>
// Protocol for communicating with ViewController
-(void)updateScore:(int)score;
-(void)showGameOver;
@end


@interface TowerBuildScene : SKScene

@property (weak, nonatomic) id <TowerBuildSceneInterfaceDelegate> interfaceDelegate;

-(void)pause;
-(void)resume;

@end
