//
//  InterfaceElements.m
//  TowerBuild
//
//  Created by Douwe Knook.
//  Copyright (c) October 2014. All rights reserved.
//
//  University of Amsterdam
//  Minor Programming
//  Student's Choice Project - Tower Build Game
//

#import "InterfaceElements.h"

@implementation InterfaceElements{
    CGRect screenSize;
    UIFont *fontTopScreen;
    UIFont *fontGameOver;
    UIFont *fontMenu;
}

-(CGRect)getScreenSize {
    screenSize = [[UIScreen mainScreen] bounds];
    return screenSize;
}

-(UIFont *)getFontTopScreen {
    fontTopScreen = [UIFont fontWithName:@"HelveticaNeue" size:18.0f];
    return fontTopScreen;
}

-(UIFont *)getFontGameOverScreen {
    fontGameOver = [UIFont fontWithName:@"HelveticaNeue" size:20.0f];
    return fontGameOver;
}

-(UIFont *)getFontMenu {
    fontMenu = [UIFont fontWithName:@"HelveticaNeue" size:25.0f];
    return fontMenu;
}


#pragma mark - Top screen elements

-(UIButton *)createPauseButton {
    [self getScreenSize];
    // Pause Button
    UIButton *pauseButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 150, 50)];
    [pauseButton setTitle:@"Pause" forState:UIControlStateNormal];
    [[pauseButton titleLabel] setFont:[self getFontTopScreen]];
    [pauseButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [pauseButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [pauseButton setCenter:CGPointMake(screenSize.size.width -50, 50)];
    return pauseButton;
}

-(UIButton *)createMenuButton {
    UIButton *menuButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 150, 50)];
    [menuButton setTitle:@"Menu" forState:UIControlStateNormal];
    [[menuButton titleLabel] setFont:[self getFontTopScreen]];
    [menuButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [menuButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [menuButton setCenter:CGPointMake(50, 50)];
    return menuButton;
}

-(UILabel *)createScoreLabel {
    [self getScreenSize];
    
    UILabel *scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 50)];
    [scoreLabel setTextAlignment:NSTextAlignmentCenter];
    [scoreLabel setFont:[self getFontTopScreen]];
    [scoreLabel setTextColor:[UIColor blackColor]];
    [scoreLabel setCenter:CGPointMake(screenSize.size.width/2, 50)];
    [scoreLabel setText:@"Score: 0"];
    return scoreLabel;
}

#pragma mark - Game Over elements

-(UILabel *)createGameOverLabel {
    [self getScreenSize];
    
    UILabel *gameOverLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 25)];
    [gameOverLabel setTextAlignment:NSTextAlignmentCenter];
    [gameOverLabel setFont:[self getFontGameOverScreen]];
    [gameOverLabel setTextColor:[UIColor blackColor]];
    [gameOverLabel setCenter:CGPointMake(screenSize.size.width/2, screenSize.size.height/2 - 25)];
    [gameOverLabel setBackgroundColor:[UIColor whiteColor]];
    [gameOverLabel setText:@"Game Over!"];
    [gameOverLabel setHidden:YES];
    return gameOverLabel;
}

-(UIButton *)createPlayAgainButton {
    [self getScreenSize];
    
    UIButton *playAgainButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 25)];
    [playAgainButton setTitle:@"Play Again" forState:UIControlStateNormal];
    [playAgainButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [playAgainButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [playAgainButton setBackgroundColor:[UIColor whiteColor]];
    [[playAgainButton titleLabel] setFont:[self getFontGameOverScreen]];
    [playAgainButton setCenter:CGPointMake(screenSize.size.width/2, screenSize.size.height/2 + 25)];
    [playAgainButton setHidden:YES];
    return playAgainButton;
}

-(UIButton *)createShareScoreButton {
    [self getScreenSize];
    
    UIButton *shareScoreButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 25)];
    [shareScoreButton setTitle:@"Share you score" forState:UIControlStateNormal];
    [shareScoreButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [shareScoreButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [shareScoreButton setBackgroundColor:[UIColor whiteColor]];
    [[shareScoreButton titleLabel] setFont:[self getFontGameOverScreen]];
    [shareScoreButton setCenter:CGPointMake(screenSize.size.width/2, screenSize.size.height/2 + 75)];
    [shareScoreButton setHidden:YES];
    return shareScoreButton;
}

-(UILabel *)createBestScoreLabel {
    [self getScreenSize];
    
    UILabel *bestScoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 25)];
    [bestScoreLabel setTextAlignment:NSTextAlignmentCenter];
    [bestScoreLabel setFont:[self getFontGameOverScreen]];
    [bestScoreLabel setTextColor:[UIColor blackColor]];
    [bestScoreLabel setCenter:CGPointMake(screenSize.size.width/2, 100)];
    [bestScoreLabel setBackgroundColor:[UIColor whiteColor]];
    [bestScoreLabel setHidden:YES];
    return bestScoreLabel;
}

-(UILabel *)createNewHighscoreLabel {
    [self getScreenSize];
    
    UILabel *newHighscoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 25)];
    [newHighscoreLabel setTextAlignment:NSTextAlignmentCenter];
    [newHighscoreLabel setFont:[self getFontGameOverScreen]];
    [newHighscoreLabel setTextColor:[UIColor greenColor]];
    [newHighscoreLabel setCenter:CGPointMake(screenSize.size.width/2, 150)];
    [newHighscoreLabel setBackgroundColor:[UIColor whiteColor]];
    [newHighscoreLabel setText:@"New Personal Highscore!"];
    [newHighscoreLabel setHidden:YES];
    return newHighscoreLabel;
}

#pragma mark - Menu

-(UIButton *)createResumeButton {
    [self getScreenSize];
    
    // resume button
    UIButton *resumeButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 50)];
    [resumeButton setTitle:@"Resume" forState:UIControlStateNormal];
    [resumeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [resumeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [[resumeButton titleLabel] setFont:[self getFontMenu]];
    [resumeButton setCenter:CGPointMake(screenSize.size.width/2, screenSize.size.height/2 - 150)];
    return resumeButton;
}

-(UIButton *)createNewGameButton {
    [self getScreenSize];
    
    // new game button
    UIButton *newGameButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 50)];
    [newGameButton setTitle:@"New Game" forState:UIControlStateNormal];
    [newGameButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [newGameButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [[newGameButton titleLabel] setFont:[self getFontMenu]];
    [newGameButton setCenter:CGPointMake(screenSize.size.width/2, screenSize.size.height/2 - 75)];
    return newGameButton;
}

-(UIButton *)createSettingsButton {
    [self getScreenSize];
    
    // highscores button
    UIButton *settingsButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 50)];
    [settingsButton setTitle:@"Settings" forState:UIControlStateNormal];
    [settingsButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [settingsButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [[settingsButton titleLabel] setFont:[self getFontMenu]];
    [settingsButton setCenter:CGPointMake(screenSize.size.width/2, screenSize.size.height/2)];
    return settingsButton;
}

-(UIButton *)createAboutButton {
    UIButton *aboutButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 50)];
    [aboutButton setTitle:@"About" forState:UIControlStateNormal];
    [aboutButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [aboutButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [[aboutButton titleLabel] setFont:[self getFontMenu]];
    [aboutButton setCenter:CGPointMake(screenSize.size.width/2, screenSize.size.height/2 + 75)];
    return aboutButton;
}

-(UIButton *)createShareButton {
    [self getScreenSize];
    
    // share button
    UIButton *shareButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 50)];
    [shareButton setTitle:@"Tell your friends" forState:UIControlStateNormal];
    [shareButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [shareButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [[shareButton titleLabel] setFont:[self getFontMenu]];
    [shareButton setCenter:CGPointMake(screenSize.size.width/2, screenSize.size.height/2 + 150)];
    return shareButton;
}

#pragma mark - Settings buttons

-(UIButton *)createEasyButton {
    [self getScreenSize];
    
    UIButton *easyButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    [easyButton setTitle:@"Easy" forState:UIControlStateNormal];
    [easyButton setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [easyButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [[easyButton titleLabel] setFont:[self getFontGameOverScreen]];
    [easyButton setCenter:CGPointMake(screenSize.size.width/2 - 100, screenSize.size.height/2 + 75)];
    [easyButton setHidden:YES];
    return easyButton;
}

-(UIButton *)createMediumButton {
    [self getScreenSize];
    
    UIButton *mediumButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    [mediumButton setTitle:@"Medium" forState:UIControlStateNormal];
    [mediumButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [mediumButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [[mediumButton titleLabel] setFont:[self getFontGameOverScreen]];
    [mediumButton setCenter:CGPointMake(screenSize.size.width/2, screenSize.size.height/2 + 75)];
    [mediumButton setHidden:YES];
    return mediumButton;
}

-(UIButton *)createHardButton {
    [self getScreenSize];
    
    UIButton *hardButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    [hardButton setTitle:@"Hard" forState:UIControlStateNormal];
    [hardButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [hardButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [[hardButton titleLabel] setFont:[self getFontGameOverScreen]];
    [hardButton setCenter:CGPointMake(screenSize.size.width/2 + 100, screenSize.size.height/2 + 75)
     ];
    [hardButton setHidden:YES];
    return hardButton;
}

#pragma mark - About label

-(UILabel *)createAboutLabel {
    UILabel *aboutLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 250, 120)];
    [aboutLabel setTextAlignment:NSTextAlignmentCenter];
    [aboutLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:14.0f]];
    [aboutLabel setTextColor:[UIColor blackColor]];
    [aboutLabel setCenter:CGPointMake(screenSize.size.width/2, screenSize.size.height/2 + 150)];
    [aboutLabel setLineBreakMode:NSLineBreakByWordWrapping];
    aboutLabel.numberOfLines = 0;
    [aboutLabel setText:@"Tower Build is created by Douwe Knook as a Student's Choice Project for the App Studio course. This course is part of the Minor Programming at the University of Amsterdam."];
    [aboutLabel setHidden:YES];
    return aboutLabel;
}

@end
