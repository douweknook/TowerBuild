//
//  MenuViewController.m
//  TowerBuild
//
//  Created by Douwe Knook.
//  Copyright (c) October 2014. All rights reserved.
//
//  University of Amsterdam
//  Minor Programming
//  Student's Choice Project - Tower Build Game
//

#import<Social/Social.h>
#import "MenuViewController.h"
#import "ViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController {
    InterfaceElements *interface;
    UIButton *resumeButton;
    UIButton *newGameButton;
    UIButton *highscoresButton;
    UIButton *shareButton;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)loadView {
    [super loadView];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self createButtons];
}

-(void)createButtons {
    interface = [[InterfaceElements alloc] init];
    
    // Resume button
    resumeButton = [interface createResumeButton];
    [resumeButton addTarget:self action:@selector(resumeButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:resumeButton];
    
    // New game button
    newGameButton = [interface createNewGameButton];
    [newGameButton addTarget:self action:@selector(newGameButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:newGameButton];
    
    // Highscore button
    highscoresButton = [interface createHighscoresButton];
    [highscoresButton addTarget:self action:@selector(highscoresButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:highscoresButton];
    
    // Share button
    shareButton = [interface createShareButton];
    [shareButton addTarget:self action:@selector(shareButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:shareButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Button actions

-(void)resumeButtonTapped {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)newGameButtonTapped {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"newGame" object: nil];
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)highscoresButtonTapped {
    // Show the user's best score.
    // Could implement game center here..
}

-(void)shareButtonTapped {
    UIActionSheet *sharingSheet = [[UIActionSheet alloc] initWithTitle:@"Share"
                                                              delegate:self
                                                     cancelButtonTitle:@"Cancel"
                                                destructiveButtonTitle:nil
                                                     otherButtonTitles:@"Share on Twitter", @"Share on Facebook", nil];
    [sharingSheet showInView:self.view];
}

#pragma mark - UIActionSheetDelegate Methods

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
        // Twitter button pressed
        if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter])
        {
            SLComposeViewController *tweet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
            [tweet setInitialText:@"Check out this Tower Build game for endless fun!"];
            [self presentViewController:tweet animated:YES completion:nil];
        }
        else
        {
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
            SLComposeViewController *tweet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
            [tweet setInitialText:@"Check out this Tower Build game for endless fun!"];
            [self presentViewController:tweet animated:YES completion:nil];
        }
        else
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Facebook"
                                                            message:@"Facebook integration is not available. A Facebook account must be set up on your device."
                                                           delegate:self
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
        }
    }
}

@end
