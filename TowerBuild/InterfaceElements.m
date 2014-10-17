//
//  InterfaceElements.m
//  TowerBuild
//
//  Created by Douwe Knook on 17-10-14.
//
//

#import "InterfaceElements.h"
#import "ViewController.h"

@implementation InterfaceElements

-(UIButton *)createPauseButtonWithFont:(UIFont *)font {
    CGRect screenSize = [[UIScreen mainScreen] bounds];
    // Pause Button
    UIButton *pauseButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 150, 50)];
    [pauseButton setTitle:@"Pause" forState:UIControlStateNormal];
    [[pauseButton titleLabel] setFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:18.0f]];
    [pauseButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [pauseButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [pauseButton setCenter:CGPointMake(screenSize.size.width -50, 50)];
    return pauseButton;
}

-(UIButton *)createMenuButtonWithFont:(UIFont *)font {
    UIButton *menuButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 150, 50)];
    [menuButton setTitle:@"Menu" forState:UIControlStateNormal];
    [[menuButton titleLabel] setFont:font];
    [menuButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [menuButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [menuButton setCenter:CGPointMake(50, 50)];
    return menuButton;
}

-(UILabel *)createScoreLabelWithFont:(UIFont *)font {
    CGRect screenSize = [[UIScreen mainScreen] bounds];
    
    UILabel *scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 50)];
    [scoreLabel setTextAlignment:NSTextAlignmentCenter];
    [scoreLabel setFont:font];
    [scoreLabel setTextColor:[UIColor blackColor]];
    [scoreLabel setCenter:CGPointMake(screenSize.size.width/2, 50)];
    [scoreLabel setText:@"Score: 0"];
    return scoreLabel;
}

-(UILabel *)createGameOverLabelWithFont:(UIFont *)font {
    CGRect screenSize = [[UIScreen mainScreen] bounds];
    
    UILabel *gameOverLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 25)];
    [gameOverLabel setTextAlignment:NSTextAlignmentCenter];
    [gameOverLabel setFont:font];
    [gameOverLabel setTextColor:[UIColor blackColor]];
    [gameOverLabel setCenter:CGPointMake(screenSize.size.width/2, screenSize.size.height/2 - 25)];
    [gameOverLabel setBackgroundColor:[UIColor whiteColor]];
    [gameOverLabel setText:@"Game Over!"];
    [gameOverLabel setHidden:YES];
    return gameOverLabel;
}

-(UIButton *)createPlayAgainButtonWithFont:(UIFont *)font {
    CGRect screenSize = [[UIScreen mainScreen] bounds];
    
    UIButton *playAgainButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 200, 25)];
    [playAgainButton setTitle:@"Play Again" forState:UIControlStateNormal];
    [playAgainButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [playAgainButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [playAgainButton setBackgroundColor:[UIColor whiteColor]];
    [[playAgainButton titleLabel] setFont:font];
    [playAgainButton setCenter:CGPointMake(screenSize.size.width/2, screenSize.size.height/2 + 25)];
    [playAgainButton setHidden:YES];
    return playAgainButton;
}


@end
