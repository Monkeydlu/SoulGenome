//
//  PhysicalRoom.m
//  Tower Of Heros
//
//  Created by MingYang Lu on 1/29/13.
//  Copyright 2013 Vanderbilt University. All rights reserved.
//

#import "PhysicalRoom.h"


@implementation PhysicalRoom

- (void)setUpHelperWithWithType:(NSNumber *)type andRoomNumber:(int)number{
	if ([type intValue] >= 0) {
		[self setNormalImage:[CCSprite spriteWithFile:@"RoomHidden.png"]];
		[self setSelectedImage:[CCSprite spriteWithFile:@"RoomHidden.png"]];
	}
	roomType = [type intValue];
	roomState = 1;
	roomNumber = number;
}

-(void)updateStatus{
	
	if (roomState == 1 && roomType != -1) {
		roomState = 2;
		[self setNormalImage:[CCSprite spriteWithFile:@"RoomReady.png"]];
	}
	
}

-(void)revealRoom{
	roomState = 3;
	[self setNormalImage:[CCSprite spriteWithFile:@"RoomRevealed.png"]];
}

-(int)getRoomType{
	return roomType;
}

-(int)getRoomState{
	return roomState;
}

-(int)getRoomNumber{
	return roomNumber;
}

@end
