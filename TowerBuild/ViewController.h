//
//  ViewController.h
//  TowerBuild
//

//  Copyright (c) 2014 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SpriteKit/SpriteKit.h>
#import "TowerBuildScene.h"
#import "InterfaceElements.h"

@interface ViewController : UIViewController <TowerBuildSceneInterfaceDelegate>

-(void)pauseButtonTapped;

@end
