//
//  someToolsClass.m
//  Tower Of Heros
//
//  Created by MingYang Lu on 1/28/13.
//  Copyright 2013 Vanderbilt University. All rights reserved.
//

#import "someToolsClass.h"


@implementation someToolsClass

+(CCRenderTexture*) createStroke: (CCLabelTTF*) label   size:(float)size   color:(ccColor3B)cor
{
	CCRenderTexture* rt = [CCRenderTexture renderTextureWithWidth:label.texture.contentSize.width+size*2  height:label.texture.contentSize.height+size*2];
	CGPoint originalPos = [label position];
	ccColor3B originalColor = [label color];
	BOOL originalVisibility = [label visible];
	[label setColor:cor];
	[label setVisible:YES];
	ccBlendFunc originalBlend = [label blendFunc];
	[label setBlendFunc:(ccBlendFunc) { GL_SRC_ALPHA, GL_ONE }];
	CGPoint bottomLeft = ccp(label.texture.contentSize.width * label.anchorPoint.x + size, label.texture.contentSize.height * label.anchorPoint.y + size);
	CGPoint positionOffset = ccp(label.texture.contentSize.width * label.anchorPoint.x - label.texture.contentSize.width/2,label.texture.contentSize.height * label.anchorPoint.y - label.texture.contentSize.height/2);
	CGPoint position = ccpSub(originalPos, positionOffset);
	
	[rt begin];
	for (int i=0; i<360; i+=30) // you should optimize that for your needs
	{
		[label setPosition:ccp(bottomLeft.x + sin(CC_DEGREES_TO_RADIANS(i))*size, bottomLeft.y + cos(CC_DEGREES_TO_RADIANS(i))*size)];
		[label visit];
	}
	[rt end];
	[label setPosition:originalPos];
	[label setColor:originalColor];
	[label setBlendFunc:originalBlend];
	[label setVisible:originalVisibility];
	[rt setPosition:position];
	return rt;
}

+(void) learnedABasicSkill:(int)skillTag onCharacter:(PhysicalCharacter *)character{
	switch (skillTag) {
		case 1: //  HP UP I (0/10)
			
			break;
		case 2: //  HP UP II (0/10)
			
			break;
		case 3: //  HP UP III (0/10)
			
			break;
		case 10:  // TP•1 UP I (0/5)
			[character techPointsAdjustOfTeir:1 modifier:1];
			break;
		case 11:  // TP•1 UP II (0/3)
			[character techPointsAdjustOfTeir:1 modifier:2];
			break;
		case 20:  // TP•2 UP I (0/5)
			[character techPointsAdjustOfTeir:2 modifier:1];
			break;
		case 21:  // TP•2 UP II (0/4)
			[character techPointsAdjustOfTeir:2 modifier:2];
			break;
		case 30:  // TP•3 UP I (0/5)
			[character techPointsAdjustOfTeir:3 modifier:1];
			break;
		case 31:  // TP•3 UP II (0/3)
			[character techPointsAdjustOfTeir:3 modifier:2];
			break;
		case 40: // TP•4 UP I (0/5)
			[character techPointsAdjustOfTeir:4 modifier:1];
			break;
		default:
			NSLog(@"learned invalid basic skill");
			break;
	}
}

+(void) learnedAPassiveSkill:(int)skillTag onCharacter:(PhysicalCharacter *)character{
	switch (skillTag) {
		case 3:
			[character increaseMaxHp:20];
			break;
		default:
			break;
	}
}

+(void) learnedAActiveSkill:(int)skillTag onCharacter:(PhysicalCharacter *)character{
	switch (skillTag) {
		
		default:
			break;
	}
}

@end
