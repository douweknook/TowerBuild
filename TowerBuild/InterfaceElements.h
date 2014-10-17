//
//  InterfaceElements.h
//  TowerBuild
//
//  Created by Douwe Knook on 17-10-14.
//
//

#import <Foundation/Foundation.h>
#import "ViewController.h"

@interface InterfaceElements : NSObject

-(UIButton *)createPauseButtonWithFont:(UIFont *)font;
-(UIButton *)createMenuButtonWithFont:(UIFont *)font;
-(UILabel *)createScoreLabelWithFont:(UIFont *)font;
-(UILabel *)createGameOverLabelWithFont:(UIFont *)font;
-(UIButton *)createPlayAgainButtonWithFont:(UIFont *)font;

@end
