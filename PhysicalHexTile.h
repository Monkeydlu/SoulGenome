//
//  PhysicalHexTile.h
//  Tower Of Heros
//
//  Created by MingYang Lu on 2/27/13.
//  Copyright 2013 Vanderbilt University. All rights reserved.
//

#import "cocos2d.h"

@interface HexTileCCMenuItemImage : CCMenuItemImage{
    int myPosition;
	int myColor;
	bool isHighlighted;
}
@property(readwrite,assign) int myPosition;
@property(readwrite,assign) int myColor;
@property(readwrite,assign) bool isHighlighted;
-(void)setUpHelperWithPosition:(int)posValue andColor:(int)colorValue;
-(void)highLightTile;
-(void)unHighLightTile;
-(bool)isTileHighlighted;
-(int)getPosition;
@end
