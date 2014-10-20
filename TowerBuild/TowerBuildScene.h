//
//  TowerBuildScene.h
//  TowerBuild
//
//  Created by Douwe Knook.
//  Copyright (c) October 2014. All rights reserved.
//
//  University of Amsterdam
//  Minor Programming
//  Student's Choice Project - Tower Build Game
//

#import <SpriteKit/SpriteKit.h>
#import "Base.h"
#import "Block.h"

@protocol TowerBuildSceneInterfaceDelegate <NSObject>
// Protocol for communicating with ViewController
-(void)updateScore:(NSUInteger)score;
-(void)showGameOver;
-(void)showNewBestHighscoreLabel;
-(void)showBestScore:(NSUInteger)highscore;
@end


@interface TowerBuildScene : SKScene

@property (weak, nonatomic) id <TowerBuildSceneInterfaceDelegate> interfaceDelegate;
-(void)pause;
-(void)resume;

@end
