//
//  ViewController.m
//  TowerBuild
//
//  Created by Douwe Knook.
//  Copyright (c) October 2014. All rights reserved.
//
//  University of Amsterdam
//  Minor Programming
//  Student's Choice Project - Tower Build Game
//

#import "ViewController.h"

@implementation ViewController {
    // Set global variables
    TowerBuildScene *scene;
    UIButton *pauseButton;
    UIButton *menuButton;
    UILabel *scoreLabel;
    UILabel *gameOverLabel;
    UIButton *playAgainButton;
    UILabel *bestScoreLabel;
    UILabel *newHighscoreLabel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNewGameScene];
    
    InterfaceElements *interface = [[InterfaceElements alloc] init];
    
    pauseButton = [interface createPauseButton];
    [pauseButton addTarget:self action:@selector(pauseButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pauseButton];
    
    menuButton = [interface createMenuButton];
    [menuButton addTarget:self action:@selector(menuButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:menuButton];
    
    scoreLabel = [interface createScoreLabel];
    [self.view addSubview:scoreLabel];

    gameOverLabel = [interface createGameOverLabel];
    [self.view addSubview:gameOverLabel];
    
    playAgainButton = [interface createPlayAgainButton];
    [playAgainButton addTarget:self action:@selector(playAgainButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:playAgainButton];
    
    bestScoreLabel = [interface createBestScoreLabel];
    [self.view addSubview:bestScoreLabel];
    
    newHighscoreLabel = [interface createNewHighscoreLabel];
    [self.view addSubview:newHighscoreLabel];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Button methods

-(void)pauseButtonTapped {
    if(scene.view.paused == YES) {
        [scene resume];
        [pauseButton setTitle:@"Pause" forState:UIControlStateNormal];
    }
    else {
        [scene pause];
        [pauseButton setTitle:@"Resume" forState:UIControlStateNormal];
    }
}

-(void)menuButtonTapped {
    MenuViewController *controller = [[MenuViewController alloc] init];
    [self presentViewController:controller animated:YES completion:NULL];
}

-(void)playAgainButtonTapped {
    [gameOverLabel setHidden:YES];
    [playAgainButton setHidden:YES];
    [bestScoreLabel setHidden:YES];
    [newHighscoreLabel setHidden:YES];
    [scoreLabel setText:[NSString stringWithFormat:@"Score: 0"]];
    [self setupNewGameScene];
}

#pragma mark - Update interface elements

-(void)updateScore:(NSUInteger)score {
    [scoreLabel setText:[NSString stringWithFormat:@"Score: %lu", (unsigned long)score]];
}

-(void)showGameOver {
    [pauseButton setEnabled:NO];
    [gameOverLabel setHidden:NO];
    [playAgainButton setHidden:NO];
}

-(void)showNewBestHighscoreLabel {
    [newHighscoreLabel setHidden:NO];
}

-(void)showBestScore:(NSUInteger)highscore {
    [bestScoreLabel setText:[NSString stringWithFormat:@"Best Score: %lu", (unsigned long)highscore]];
    [bestScoreLabel setHidden:NO];
}

#pragma mark - Restart gameplay

-(void)setupNewGameScene {
    // Add function to notification center so it can be called from MenuViewController
    [[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(setupNewGameScene) name:@"newGame" object: nil];
    
    // Configure the view.
    SKView *skView = (SKView *)self.view;
    
    // Create and configure the scene.
    scene = [TowerBuildScene sceneWithSize:skView.bounds.size];
    SKTransition *reveal = [SKTransition pushWithDirection:SKTransitionDirectionDown duration:0.5];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    scene.interfaceDelegate = self;
    [skView presentScene:scene transition:reveal];
    
    [pauseButton setEnabled:YES];
}

@end
