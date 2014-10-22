//
//  ViewController.h
//  TowerBuild
//
//  Created by Douwe Knook.
//  Copyright (c) October 2014. All rights reserved.
//
//  University of Amsterdam
//  Minor Programming
//  Student's Choice Project - Tower Build Game
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>
#import <Social/Social.h>
#import "TowerBuildScene.h"
#import "InterfaceElements.h"
#import "MenuViewController.h"


@interface ViewController : UIViewController <TowerBuildSceneInterfaceDelegate, UIActionSheetDelegate>

-(void)setupNewGameScene;

@end
