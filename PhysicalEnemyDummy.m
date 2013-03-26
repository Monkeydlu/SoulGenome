//
//  PhysicalEnemyDummy.m
//  Tower Of Heros
//
//  Created by MingYang Lu on 2/26/13.
//  Copyright 2013 Vanderbilt University. All rights reserved.
//

#import "PhysicalEnemyDummy.h"

@implementation PhysicalEnemyDummy

- (id)initWithTag:(int)foo andPos:(int)position{
	if((self = [super initWithFile:@"Enemy.png"])) {
		[self setUpEnemy:foo];
		
		myPosition = position;
		[self updatePosition:position];
		
		behaviorCounter = 0;
	}
	return self;
}

-(void)setUpEnemy:(int)monsterTag{
	switch (monsterTag) {
		case 1: //temorary monster chocobo
			timerMax = 7;
			timerCur = 0;
			isAlive = true;
			HpMax = 40;
			HpCur = 40;
			
			Atk = 8;
			Def = 5;
			Res = 3;
			
			behaviorPattern = [NSMutableArray arrayWithObjects:@"move", @"attack" nil];
			break;
		case 2:
			
			break;
		default:
			break;
	}
}

-(void)updatePosition:(int)position{
	myPosition = position;
	switch (myPosition) {
		case 11:
			self.position = ccp(150,160 + 52 + 5);
			break;
		case 12:
			self.position = ccp(150,160 + 5);
			break;
		case 13:
			self.position = ccp(150,160 - 52 + 5);
			break;
		case 21:
			self.position = ccp(196,160 + 26 + 52 + 5);
			break;
		case 22:
			self.position = ccp(196,160 + 26 + 5);
			break;
		case 23:
			self.position = ccp(196,160 - 26 + 5);
			break;
		case 24:
			self.position = ccp(196,160 - 26 - 52 + 5);
			break;
		case 31:
			self.position = ccp(242,160 + 52 + 52 + 5);
			break;
		case 32:
			self.position = ccp(242,160 + 52 + 5);
			break;
		case 33:
			self.position = ccp(242,160 + 5);
			break;
		case 34:
			self.position = ccp(242,160 - 52 + 5);
			break;
		case 35:
			self.position = ccp(242,160 - 52 - 52 + 5);
			break;
		case 42:
			self.position = ccp(288,160 + 26 + 52 + 5);
			break;
		case 43:
			self.position = ccp(288,160 + 26 + 5);
			break;
		case 44:
			self.position = ccp(288,160 - 26 + 5);
			break;
		case 45:
			self.position = ccp(288,160 - 26 - 52 + 5);
			break;
		case 53:
			self.position = ccp(334,160 + 52 + 5);
			break;
		case 54:
			self.position = ccp(334,160 + 5);
			break;
		case 55:
			self.position = ccp(334,160 - 52 + 5);
			break;
		default:
			NSLog(@"position out of range");
			break;

	}
}

-(void)updateTimer{
	if (timerCur < timerMax && isAlive) {
		timerCur = timerCur + 0.1;
	}
}

-(bool)enemyIsReady{
	return (timerCur == 0);
}

-(int)getPosition{
	return myPosition;
}

-(float)getTimerProgress{
	float temp = timerCur / timerMax;
	return (temp);
}

-(void)resetTimer{
	timerCur = 0;
}

-(NSString*)performAction{
	return [behaviorPattern objectAtIndex:behaviorCounter];
	behaviorCounter++;
}

@end
