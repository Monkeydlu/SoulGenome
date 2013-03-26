//
//  PhysicalHeroDummy.h
//  Tower Of Heros
//
//  Created by MingYang Lu on 2/21/13.
//  Copyright 2013 Vanderbilt University. All rights reserved.
//

#import "cocos2d.h"
#import "PhysicalCharacter.h"

@interface PhysicalHeroDummy : CCSprite {
    PhysicalCharacter* myCharacter;
	int myPosition;
	float timerMax;
	float timerCur;
	bool isAlive;
}
-(id)initWithCharacter:(PhysicalCharacter*)foo andPos:(int)position;
-(void)updateTimer;
-(void)updatePosition:(int)position;
-(bool)heroIsReady;
-(int)getPosition;
-(float)getTimerProgress;
-(void)resetTimer;
@end
