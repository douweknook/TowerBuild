Design Document
===============
This document contains the technical implementation of my Student's Choice project: a game called Tower Build.

Flow
===============
The application will be build using the Game template and SpriteKit framework. It will contain several sprites, a gameplay scene and two viewcontrollers (gameplay viewcontroller and menu viewcontroller). The Interface elements will also be put into a seperate class. This devision constitutes the flow of the application as depicted below.

![alt img](https://github.com/douweknook/TowerBuild/blob/master/doc/TowerBuildDesignFlow.jpg)

Classes & Public Methods:
===============
The <code>ViewController</code> class contains the interface elements used to communicate between the application and the user. It imports the design of the interface elements from the <code>InterfaceElements</code> class. This class also handles communication with the <code>TowerBuildScene</code> and <code>MenuViewController</code> class. In order to do this it requires both a <code>TowerBuildSceneInterfaceDelegate</code> and a <code>UIActionSheetDelegate</code> protocol. It's only public method is <code>setupNewGameScene</code>, which is used by the <code>MenuViewController</code> to start a new game.

The <code>TowerBuildScene</code> implements and displays the actual gameplay. It's public methods consists of the implementation of the <code>TowerBuildSceneInterfaceDelegate</code> protocol and a <code>pause</code> and <code>resume</code> method which pauses and resumes the gameplay. This class also imports the sprite classes <code>block</code> and <code>base</code>.

The <code>base</code> class is the sprite class that returns the base of the tower. It does not implement any public methods.

The <code>block</code> class is the sprite class the returns the building blocks for the tower. It implements the public method <code>initWithSize:</code> which creates a block sprite of the size sent with the method.

In the <code>MenuViewController</code> class the menu interface is implemented. This class does not contain any public methods. It does however import the <code>UIActionSheetDelegate</code> protocol.

The <code>InterfaceElements</code> class contains the specifications for all the interface elements (UIButtons and UILabels). It contains the following public methods: <code>createPauseButton, createMenuButton, createScoreLabel, createGameOverLabel, createPlayAgainButton, createBestScoreLabel, createNewHighscoreLabel, createShareScoreButton, createResumeButton, createNewGameButton, createSettingsButton, createShareButton, createEasyButton, createMediumButton, createHardButton</code>

Sketches:
=========
Below are the sketches of the design with some function descriptions.
![alt img](https://github.com/douweknook/TowerBuild/blob/master/doc/TowerBuildDesign.jpg)

Frameworks:
==========
This project will only use standard frameworks containe in XCode. First of all it will use the frameworks standard included in the Sprite Kit Application upon which this application is build. These are the following: Foundation framework, CoreGraphics framework, UIKIT framework, SpriteKit framework and XCTest framework. On top of this the Social framework will be included to allow users to share information about the game on Twitter and Facebook. No additional APIs will be used.
