//
//  ViewController.m
//  TowerBuild
//
//  Created by Douwe Knook on 06-10-14.
//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "TowerBuildScene.h"

@implementation ViewController {
    // Set global variables
    TowerBuildScene *scene;
    UIButton *pauseButton;
    UIButton *menuButton;
    UILabel *scoreLabel;
    UILabel *gameOverLabel;
    UIButton *playAgainButton;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Configure the view.
    SKView * skView = (SKView *)self.view;
    
    // Create and configure the scene.
    scene = [TowerBuildScene sceneWithSize:skView.bounds.size];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    scene.interfaceDelegate = self;
    [skView presentScene:scene];
    
    InterfaceElements *interface = [[InterfaceElements alloc] init];
    UIFont *font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:18.0f];
    
    pauseButton = [interface createPauseButtonWithFont:font];
    [pauseButton addTarget:self action:@selector(pauseButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pauseButton];
    
    menuButton = [interface createMenuButtonWithFont:font];
    [menuButton addTarget:self action:@selector(menuButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:menuButton];
    
    scoreLabel = [interface createScoreLabelWithFont:font];
    [self.view addSubview:scoreLabel];

    gameOverLabel = [interface createGameOverLabelWithFont:font];
    [self.view addSubview:gameOverLabel];
    
    playAgainButton = [interface createPlayAgainButtonWithFont:font];
    [playAgainButton addTarget:self action:@selector(playAgainButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:playAgainButton];
    
}

-(void)pauseButtonTapped {
    if(scene.view.paused == YES) {
        [scene resume];
        [pauseButton setTitle:@"Pause" forState:UIControlStateNormal];
    }
    else {
        scene.view.paused = YES;
        [pauseButton setTitle:@"Resume" forState:UIControlStateNormal];
    }
}

-(void)menuButtonTapped {
    NSLog(@"Menu Button Tapped!");
}

-(void)playAgainButtonTapped {
    
}

-(void)updateScore:(int)score {
    [scoreLabel setText:[NSString stringWithFormat:@"Score: %d", score]];
}

-(void)showGameOver {
    [pauseButton setEnabled:NO];
    [gameOverLabel setHidden:NO];
    [playAgainButton setHidden:NO];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}



@end
