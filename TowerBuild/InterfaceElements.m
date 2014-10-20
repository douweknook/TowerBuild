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
    UIFont *font;
}

-(CGRect)getScreenSize {
    screenSize = [[UIScreen mainScreen] bounds];
    return screenSize;
}

-(UIFont *)getFont {
    font = [UIFont fontWithName:@"HelveticaNeue" size:18.0f];
    return font;
}

#pragma mark - Top screen elements

-(UIButton *)createPauseButton {
    [self getScreenSize];
    // Pause Button
    UIButton *pauseButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 150, 50)];
    [pauseButton setTitle:@"Pause" forState:UIControlStateNormal];
    [[pauseButton titleLabel] setFont:[self getFont]];
    [pauseButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [pauseButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [pauseButton setCenter:CGPointMake(screenSize.size.width -50, 50)];
    return pauseButton;
}

-(UIButton *)createMenuButton {
    UIButton *menuButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 150, 50)];
    [menuButton setTitle:@"Menu" forState:UIControlStateNormal];
    [[menuButton titleLabel] setFont:[self getFont]];
    [menuButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [menuButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [menuButton setCenter:CGPointMake(50, 50)];
    return menuButton;
}

-(UILabel *)createScoreLabel {
    [self getScreenSize];
    
    UILabel *scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 50)];
    [scoreLabel setTextAlignment:NSTextAlignmentCenter];
    [scoreLabel setFont:[self getFont]];
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
    [gameOverLabel setFont:[self getFont]];
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
    [[playAgainButton titleLabel] setFont:[self getFont]];
    [playAgainButton setCenter:CGPointMake(screenSize.size.width/2, screenSize.size.height/2 + 25)];
    [playAgainButton setHidden:YES];
    return playAgainButton;
}

-(UILabel *)createBestScoreLabel {
    [self getScreenSize];
    
    UILabel *bestScoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 25)];
    [bestScoreLabel setTextAlignment:NSTextAlignmentCenter];
    [bestScoreLabel setFont:[self getFont]];
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
    [newHighscoreLabel setFont:[self getFont]];
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
    [[resumeButton titleLabel] setFont:[self getFont]];
    [resumeButton setCenter:CGPointMake(screenSize.size.width/2, screenSize.size.height/2 - 100)];
    return resumeButton;
}

-(UIButton *)createNewGameButton {
    [self getScreenSize];
    
    // new game button
    UIButton *newGameButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 50)];
    [newGameButton setTitle:@"New Game" forState:UIControlStateNormal];
    [newGameButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [newGameButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [[newGameButton titleLabel] setFont:[self getFont]];
    [newGameButton setCenter:CGPointMake(screenSize.size.width/2, screenSize.size.height/2 - 50)];
    return newGameButton;
}

-(UIButton *)createHighscoresButton {
    [self getScreenSize];
    
    // highscores button
    UIButton *highscoresButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 50)];
    [highscoresButton setTitle:@"Highscores" forState:UIControlStateNormal];
    [highscoresButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [highscoresButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [[highscoresButton titleLabel] setFont:[self getFont]];
    [highscoresButton setCenter:CGPointMake(screenSize.size.width/2, screenSize.size.height/2)];
    return highscoresButton;
}

-(UIButton *)createShareButton {
    [self getScreenSize];
    
    // share button
    UIButton *shareButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 50)];
    [shareButton setTitle:@"Tell your friends" forState:UIControlStateNormal];
    [shareButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [shareButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [[shareButton titleLabel] setFont:[self getFont]];
    [shareButton setCenter:CGPointMake(screenSize.size.width/2, screenSize.size.height/2 + 50)];
    return shareButton;
}

@end
