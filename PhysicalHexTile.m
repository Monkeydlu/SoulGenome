//
//  PhysicalHexTile.m
//  Tower Of Heros
//
//  Created by MingYang Lu on 2/27/13.
//  Copyright 2013 Vanderbilt University. All rights reserved.
//

#import "PhysicalHexTile.h"


@implementation HexTileCCMenuItemImage
@synthesize myPosition;
@synthesize myColor;
@synthesize isHighlighted;

-(void)setUpHelperWithPosition:(int)posValue andColor:(int)colorValue{
	myColor = colorValue;
	switch (myColor) {
		case 0:
			[self setNormalImage:[CCSprite spriteWithFile:@"Hex1.png"]];
			break;
		case 1:
			[self setNormalImage:[CCSprite spriteWithFile:@"Hex2.png"]];
			break;
		case 2:
			[self setNormalImage:[CCSprite spriteWithFile:@"Hex3.png"]];
			break;
		case 3:
			[self setNormalImage:[CCSprite spriteWithFile:@"Hex4.png"]];
			break;
		case 4:
			[self setNormalImage:[CCSprite spriteWithFile:@"Hex5.png"]];
			break;
		default:
			NSLog(@"hex color out of range");
			break;
	}
	isHighlighted = false;
	myPosition = posValue;
}

-(void)highLightTile{
	isHighlighted = true;
	switch (myColor) {
		case 0:
			[self setNormalImage:[CCSprite spriteWithFile:@"Hex1H.png"]];
			break;
		case 1:
			[self setNormalImage:[CCSprite spriteWithFile:@"Hex2H.png"]];
			break;
		case 2:
			[self setNormalImage:[CCSprite spriteWithFile:@"Hex3H.png"]];
			break;
		case 3:
			[self setNormalImage:[CCSprite spriteWithFile:@"Hex4H.png"]];
			break;
		case 4:
			[self setNormalImage:[CCSprite spriteWithFile:@"Hex5H.png"]];
			break;
		default:
			NSLog(@"hex color out of range");
			break;
	}
}

-(void)unHighLightTile{
	isHighlighted = false;
	switch (myColor) {
		case 0:
			[self setNormalImage:[CCSprite spriteWithFile:@"Hex1.png"]];
			break;
		case 1:
			[self setNormalImage:[CCSprite spriteWithFile:@"Hex2.png"]];
			break;
		case 2:
			[self setNormalImage:[CCSprite spriteWithFile:@"Hex3.png"]];
			break;
		case 3:
			[self setNormalImage:[CCSprite spriteWithFile:@"Hex4.png"]];
			break;
		case 4:
			[self setNormalImage:[CCSprite spriteWithFile:@"Hex5.png"]];
			break;
		default:
			NSLog(@"hex color out of range");
			break;
	}
}

-(bool)isTileHighlighted{
	return isHighlighted;
}

-(int)getPosition{
	return myPosition;
}

@end
