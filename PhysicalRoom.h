//
//  PhysicalRoom.h
//  Tower Of Heros
//
//  Created by MingYang Lu on 1/29/13.
//  Copyright 2013 Vanderbilt University. All rights reserved.
//

#import "cocos2d.h"

@interface PhysicalRoom : CCSprite {
    int roomType; 
	int roomState;
}
- (id)initWithPosition:(int)pos andType:(int)type;
- (void)setRoomPosition:(int)pos;
- (void)updateStatus;
- (void)revealRoom;
- (int)getRoomType;
- (int)getRoomState;
@end
