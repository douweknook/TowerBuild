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

#import "MenuViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController {
    InterfaceElements *interface;
    UIButton *resumeButton;
    UIButton *newGameButton;
    UIButton *settingsButton;
    UIButton *aboutButton;
    UILabel *aboutLabel;
    UIButton *shareButton;
    UIButton *easyButton;
    UIButton *mediumButton;
    UIButton *hardButton;
    NSString *difficulty;
    CGRect screenSize;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    screenSize = [[UIScreen mainScreen] bounds];
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
    settingsButton = [interface createSettingsButton];
    [settingsButton addTarget:self action:@selector(settingsButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:settingsButton];
    
    // About button
    aboutButton = [interface createAboutButton];
    [aboutButton addTarget:self action:@selector(aboutButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:aboutButton];
    
    // About label
    aboutLabel = [interface createAboutLabel];
    [self.view addSubview:aboutLabel];
    
    // Share button
    shareButton = [interface createShareButton];
    [shareButton addTarget:self action:@selector(shareButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:shareButton];
    
    // Settings buttons
    easyButton = [interface createEasyButton];
    [easyButton addTarget:self action:@selector(difficultyButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:easyButton];
    
    mediumButton = [interface createMediumButton];
    [mediumButton addTarget:self action:@selector(difficultyButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:mediumButton];
    
    hardButton = [interface createHardButton];
    [hardButton addTarget:self action:@selector(difficultyButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:hardButton];
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
    // Connect to newGame function in ViewController class
    [[NSNotificationCenter defaultCenter] postNotificationName:@"newGame" object:nil];
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)settingsButtonTapped {
    // If settings folded out, fold back in
    if (easyButton.hidden == NO || mediumButton.hidden == NO || hardButton.hidden == NO) {
        [aboutButton setCenter:CGPointMake(screenSize.size.width/2, screenSize.size.height/2 + 75)];
        [shareButton setCenter:CGPointMake(screenSize.size.width/2, screenSize.size.height/2 + 150)];
        [easyButton setHidden:YES];
        [mediumButton setHidden:YES];
        [hardButton setHidden:YES];
    }
    // If about is folded out, fold about in and fold settings out
    else if (aboutLabel.hidden == NO) {
        [aboutLabel setHidden:YES];
        [aboutButton setCenter:CGPointMake(screenSize.size.width/2, screenSize.size.height/2 + 150)];
        [easyButton setHidden:NO];
        [mediumButton setHidden:NO];
        [hardButton setHidden:NO];
    }
    // Else fold out and show difficulty levels
    else {
    [aboutButton setCenter:CGPointMake(screenSize.size.width/2, screenSize.size.height/2 + 150)];
    [shareButton setCenter:CGPointMake(screenSize.size.width/2, screenSize.size.height/2 + 225)];
    [easyButton setHidden:NO];
    [mediumButton setHidden:NO];
    [hardButton setHidden:NO];
    }
}

-(void)difficultyButtonTapped:(UIButton *)button {
    // Save the chosen difficulty to NSUserDefaults
    if (button == easyButton) {
        difficulty = @"easy";
        [[NSUserDefaults standardUserDefaults] setObject:difficulty forKey:@"difficulty"];
    }
    else if (button == mediumButton) {
        difficulty = @"medium";
        [[NSUserDefaults standardUserDefaults] setObject:difficulty forKey:@"difficulty"];
    }
    else if (button == hardButton) {
        difficulty = @"hard";
        [[NSUserDefaults standardUserDefaults] setObject:difficulty forKey:@"difficulty"];
    }
    [self newGameButtonTapped];
}

-(void)aboutButtonTapped {
    // If settings folded out, fold settings in and fold about out
    if (easyButton.hidden == NO || mediumButton.hidden == NO || hardButton.hidden == NO) {
        [easyButton setHidden:YES];
        [mediumButton setHidden:YES];
        [hardButton setHidden:YES];
        [aboutButton setCenter:CGPointMake(screenSize.size.width/2, screenSize.size.height/2 + 75)];
        [aboutLabel setHidden:NO];
    }
    // If about is folded out, fold about in
    else if (aboutLabel.hidden == NO) {
        [aboutLabel setHidden:YES];
        [shareButton setCenter:CGPointMake(screenSize.size.width/2, screenSize.size.height/2 + 150)];
    }
    // If about is folded in, fold out
    else {
        [shareButton setCenter:CGPointMake(screenSize.size.width/2, screenSize.size.height/2 + 225)];
        [aboutLabel setHidden:NO];
    }
}

-(void)shareButtonTapped {
    // Create actionsheet with different sharing options
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
            // Create, compose and post tweet
            SLComposeViewController *tweet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
            [tweet setInitialText:@"Check out this Tower Build game for endless fun!"];
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
            [facebook setInitialText:@"Check out this Tower Build game for endless fun!"];
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

@end
