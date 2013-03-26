//
//  CutSceneEventsScene.m
//  Tower Of Heros
//
//  Created by MingYang Lu on 1/14/13.
//  Copyright (c) 2013 Vanderbilt University. All rights reserved.
//

#import "Intro.h"

@implementation IntroEventScene

- (id) init {
    self = [super init];
    if (self != nil) {
        CCSprite * bg = [CCSprite spriteWithFile:@"BlackBg.png"];
        [bg setPosition:ccp(240, 160)];
        [self addChild:bg z:0];
        [self addChild:[IntroEventLayer node] z:1];
    }
    return self;
}
@end


@implementation IntroEventLayer
- (id) init {
    if (self != nil) {
		pageCounter = 1;
		tapToContinue = true;
		
		textWindowLabel = [CCLabelTTF labelWithString:@"" dimensions:CGSizeMake(340, 100) alignment:UITextAlignmentCenter lineBreakMode:UILineBreakModeWordWrap fontName:@"Arial" fontSize:20];
		textWindowLabel.color = ccc3(0, 0, 0);
		[textWindowLabel setPosition: ccp(240, 50)];
		[self addChild:textWindowLabel];
    }
    return self;
}

- (void)tapDownAt:(CGPoint)location {
	return;
}

- (void) dealloc
{
	[super dealloc];
}

@end