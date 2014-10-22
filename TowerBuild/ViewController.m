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
    TowerBuildScene *scene;
    UIButton *pauseButton;
    UIButton *menuButton;
    UILabel *scoreLabel;
    UILabel *gameOverLabel;
    UIButton *playAgainButton;
    UILabel *bestScoreLabel;
    UILabel *newHighscoreLabel;
    UIButton *shareScoreButton;
    NSUInteger endScore;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNewGameScene];
    
    // Add function to notification center so it can be called from MenuViewController
    [[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(playAgainButtonTapped) name:@"newGame" object: nil];
    
    // Set up all the interface elements
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
    
    shareScoreButton = [interface createShareScoreButton];
    [shareScoreButton addTarget:self action:@selector(shareScoreButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:shareScoreButton];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Button methods

/* method called when pause button tapped */
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

/* Method called when menu button tapped. Switch to menu viewcontroller */
-(void)menuButtonTapped {
    MenuViewController *controller = [[MenuViewController alloc] init];
    [self presentViewController:controller animated:YES completion:NULL];
}

/*Called when play again button is tapped. Changes the interface and resets the game */
-(void)playAgainButtonTapped {
    [gameOverLabel setHidden:YES];
    [playAgainButton setHidden:YES];
    [shareScoreButton setHidden:YES];
    [bestScoreLabel setHidden:YES];
    [newHighscoreLabel setHidden:YES];
    [scoreLabel setText:[NSString stringWithFormat:@"Score: 0"]];
    [self setupNewGameScene];    
}

#pragma mark - Update interface elements
/* Keeps the current score label updated */
-(void)updateScore:(NSUInteger)score {
    [scoreLabel setText:[NSString stringWithFormat:@"Score: %lu", (unsigned long)score]];
    endScore = score;
}

/* Change the interface to show the Game Over screen elements */
-(void)showGameOver {
    [pauseButton setEnabled:NO];
    [gameOverLabel setHidden:NO];
    [playAgainButton setHidden:NO];
    [shareScoreButton setHidden:NO];
}

/* Shows a message to tell the user he/she set a new highscore */
-(void)showNewBestHighscoreLabel {
    [newHighscoreLabel setHidden:NO];
}

/* Shows a label to display the highscore */
-(void)showBestScore:(NSUInteger)highscore {
    [bestScoreLabel setText:[NSString stringWithFormat:@"Best Score: %lu", (unsigned long)highscore]];
    [bestScoreLabel setHidden:NO];
}

/* Method called when the 'share your score' button is tapped. Shows an actionsheet */
-(void)shareScoreButtonTapped {
    UIActionSheet *sharingSheet = [[UIActionSheet alloc] initWithTitle:@"Share"
                                                              delegate:self
                                                     cancelButtonTitle:@"Cancel"
                                                destructiveButtonTitle:nil
                                                     otherButtonTitles:@"Share on Twitter", @"Share on Facebook", nil];
    [sharingSheet showInView:self.view];
}

#pragma mark - UIActionSheetDelegate Methods

/* Method called when the user choses an option from the 'share your score' actionsheet */
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
        // Twitter button pressed
        if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
        {
            // Create, compose and post tweet
            SLComposeViewController *tweet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
            [tweet setInitialText:[NSString stringWithFormat:@"I just scored %lu points in #TowerBuild!", endScore]];
            [self presentViewController:tweet animated:YES completion:nil];
        }
        else
        {
            // If unable to post, show alert message
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Twitter"
                                                            message:@"Twitter integration is not available. A Twitter account must be set up on your device."
                                                           delegate:self
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
        }
    }
    else if (buttonIndex == 1)
    {
        // Facebook button pressed
        if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook])
        {
            // Create compose and post Facebook message
            SLComposeViewController *facebook = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
            [facebook setInitialText:[NSString stringWithFormat:@"I just score %lu points in #TowerBuild!", endScore]];
            [self presentViewController:facebook animated:YES completion:nil];
        }
        else
        {
            // If unable to post, show alert message
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Facebook"
                                                            message:@"Facebook integration is not available. A Facebook account must be set up on your device."
                                                           delegate:self
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
        }
    }
}

#pragma mark - Restart gameplay

/* Sets up a new game by creating a new TowerBuildScene */
-(void)setupNewGameScene {
    // Configure the view.
    SKView *skView = (SKView *)self.view;
    
    // Create and configure the scene.
    scene = [TowerBuildScene sceneWithSize:skView.bounds.size];
    SKTransition *reveal = [SKTransition pushWithDirection:SKTransitionDirectionDown duration:0.5];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    scene.interfaceDelegate = self;
    [skView presentScene:scene transition:reveal];
    
    [pauseButton setEnabled:YES];
    if (scene.view.paused == YES) {
        [scene resume];
    }
}

@end
