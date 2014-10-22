//
//  InterfaceElements.h
//  TowerBuild
//
//  Created by Douwe Knook.
//  Copyright (c) October 2014. All rights reserved.
//
//  University of Amsterdam
//  Minor Programming
//  Student's Choice Project - Tower Build Game
//

#import <Foundation/Foundation.h>
#import "ViewController.h"

@interface InterfaceElements : NSObject
// Top screen elements
-(UIButton *)createPauseButton;
-(UIButton *)createMenuButton;
-(UILabel *)createScoreLabel;

// Game Over elements
-(UILabel *)createGameOverLabel;
-(UIButton *)createPlayAgainButton;
-(UILabel *)createBestScoreLabel;
-(UILabel *)createNewHighscoreLabel;
-(UIButton *)createShareScoreButton;

// Menu elements
-(UIButton *)createResumeButton;
-(UIButton *)createNewGameButton;
-(UIButton *)createSettingsButton;
-(UIButton *)createShareButton;

// Settings buttons
-(UIButton *)createEasyButton;
-(UIButton *)createMediumButton;
-(UIButton *)createHardButton;

@end
