Design Document
===============
This document contains the technical implementation of my Student's Choice project: a game of Tower Build.

Classes & Public Methods:
===============
The <code>ViewController</code> class will contain only the buttons used to access the game menu (<code>menuButton</code>) and to pause the game (<code>pauseButton</code>). The menu, consisting of the highscores and a new game option, will also be implemented in the <code>ViewController</code> class. 

The <code>TowerBuildScene</code> class will be displaying the actual gameplay. It will set the game scene the user sees and registers the user's interaction with the application. It imports the sprite classes <code>block</code> and <code>base</code>.

The <code>base</code> class is the sprite that forms the base of the tower. It will contain a method to check for collisions with the <code>block</code> sprite upon a user tapping the screen.

The <code>block</code> class contains the spite for the building blocks. This will implement a method that makes it move across the screen, but still remains in the <code>TowerBuildScene</code> so it won't go off screen. Also it will implement a method to listen for a tap from the user to be released and fall down towards the base.

Sketches:
=========


Frameworks:
==========
The only frameworks used will be the frameworks standard included in the Sprite Kit Application upon which this application is build. These are the follwing: Foundation framework, CoreGraphics framework, UIKIT framework, SpriteKit framework and XCTest framework. No additional APIs will be used.
