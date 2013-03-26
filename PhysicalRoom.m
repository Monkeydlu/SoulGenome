//
//  PhysicalRoom.m
//  Tower Of Heros
//
//  Created by MingYang Lu on 1/29/13.
//  Copyright 2013 Vanderbilt University. All rights reserved.
//

#import "PhysicalRoom.h"


@implementation PhysicalRoom

- (id)initWithPosition:(int)pos andType:(int)type{
	if((self = [super initWithFile:@"RoomHidden.png"])) {
		roomType =  type;
		roomState = 1;
		[self setRoomPosition:pos];
	}
	return self;
}

- (void)setRoomPosition:(int)pos{
	switch (pos) {
		case 10:
			self.position = ccp(155,250);
			break;
		case 11:
			self.position = ccp(215,250);
			break;
		case 12:
			self.position = ccp(275,250);
			break;
		case 13:
			self.position = ccp(335,250);
			break;
		case 20:
			self.position = ccp(155,190);
			break;
		case 21:
			self.position = ccp(215,190);
			break;
		case 22:
			self.position = ccp(275,190);
			break;
		case 23:
			self.position = ccp(335,190);
			break;
		case 30:
			self.position = ccp(155,130);
			break;
		case 31:
			self.position = ccp(215,130);
			break;
		case 32:
			self.position = ccp(275,130);
			break;
		case 33:
			self.position = ccp(335,130);
			break;
		case 40:
			self.position = ccp(155,70);
			break;
		case 41:
			self.position = ccp(215,70);
			break;
		case 42:
			self.position = ccp(275,70);
			break;
		case 43:
			self.position = ccp(335,70);
			break;
		default:
			break;
	}
}

-(void)updateStatus{
	
	if (roomState ==1) {
		roomState = 2;
		[self setTexture:[[CCSprite spriteWithFile:@"RoomReady.png"]texture]];
	}
	
}

-(void)revealRoom{
	roomState = 3;
	[self setTexture:[[CCSprite spriteWithFile:@"RoomRevealed.png"]texture]];
}

-(int)getRoomType{
	return roomType;
}

-(int)getRoomState{
	return roomState;
}

@end
