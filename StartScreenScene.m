//
//  StartScreenSceen.m
//  LOLERS
//
//  Created by MingYang Lu on 11/25/12.
//  Copyright (c) 2012 Vanderbilt University. All rights reserved.
//

#import "StartScreenScene.h"
#import "CharacterSelectionScreen.h"

@interface StartMenuLayer()

@end

@implementation StartMenuLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	StartMenuLayer *layer = [StartMenuLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

- (id) init {
	if( (self=[super initWithColor:ccc4(255, 255,0,255)] )) {
		
		CCSprite * bg = [CCSprite spriteWithFile:@"StartScreenBg.png"];
        [bg setPosition:ccp(240, 160)];
        [self addChild:bg z:0];
		
        CCMenuItemImage *startButton = [CCMenuItemImage itemFromNormalImage:@"ButtonNewGame.png" 
														selectedImage:@"ButtonNewGame.png" //replace with selected image.  
															   target:self 
															 selector:@selector(startGame)];
		CCMenuItemImage *contButton = [CCMenuItemImage itemFromNormalImage:@"ButtonContinue.png" 
														selectedImage:@"ButtonContinue.png" //replace with selected image.  
															   target:self 
															 selector:@selector(continueGame)];
		CCMenu *menu = [CCMenu menuWithItems:startButton, contButton, nil];
		[menu alignItemsVerticallyWithPadding:10];
		[menu setPosition:ccp(80, 130)];
		[self addChild:menu z:1];
    }
	self.isTouchEnabled = YES;
    return self;
}

-(void)startGame{
	CharacterSelectionScreenSceen * newScene = [CharacterSelectionScreenSceen node];
	[[CCDirector sharedDirector] replaceScene:newScene];
}
-(void)continueGame{
}
@end