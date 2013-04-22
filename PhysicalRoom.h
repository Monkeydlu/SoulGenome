//
//  PhysicalRoom.h
//  Tower Of Heros
//
//  Created by MingYang Lu on 1/29/13.
//  Copyright 2013 Vanderbilt University. All rights reserved.
//

#import "cocos2d.h"

@interface PhysicalRoom : CCMenuItemImage {
    int roomType; 
	int roomState;
	int roomNumber;
}
- (void)setUpHelperWithWithType:(NSNumber *)type andRoomNumber:(int)number;
- (void)updateStatus;
- (void)revealRoom;
- (int)getRoomType;
- (int)getRoomState;
- (int)getRoomNumber;
@end
