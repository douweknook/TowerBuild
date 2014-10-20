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

-(UIButton *)createPauseButton;
-(UIButton *)createMenuButton;
-(UILabel *)createScoreLabel;
-(UILabel *)createGameOverLabel;
-(UIButton *)createPlayAgainButton;
-(UILabel *)createBestScoreLabel;
-(UILabel *)createNewHighscoreLabel;

-(UIButton *)createResumeButton;
-(UIButton *)createNewGameButton;
-(UIButton *)createHighscoresButton;
-(UIButton *)createShareButton;

@end
