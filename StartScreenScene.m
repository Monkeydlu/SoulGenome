//
//  StartScreenSceen.m
//  LOLERS
//
//  Created by MingYang Lu on 11/25/12.
//  Copyright (c) 2012 Vanderbilt University. All rights reserved.
//

#import "StartScreenScene.h"
#import "CharacterSelectionScreen.h"
#import "PolygonNode.h"

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
		
		/*
		// Create an array of CGPoints
		CGPoint points[] = {ccp(0,0), ccp(100,0), ccp(100,100), ccp(50, 150), ccp(0,100)};
		// Create a new mutable array
        NSMutableArray * result = [[NSMutableArray alloc] initWithObjects: nil];
		
        // Add the points to the mutable array using a NSValue wrapper
		for(int i=0; i<(sizeof(points)/sizeof(CGPoint)); i++) {
			NSValue* point = [NSValue valueWithCGPoint:points[i]];
			[result addObject:point];
		}
		
        // Create the polygon
		PolygonNode* poly = [PolygonNode newPolygonNode: result];
		
        // Set the fill color
        poly.fillColor = ccc4(0, 255, 100, 255);
		
        // Add the polygon to the scene
		[self addChild:poly];
		*/
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