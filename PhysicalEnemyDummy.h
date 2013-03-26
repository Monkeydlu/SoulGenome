//
//  PhysicalEnemyDummy.h
//  Tower Of Heros
//
//  Created by MingYang Lu on 2/26/13.
//  Copyright 2013 Vanderbilt University. All rights reserved.
//

#import "cocos2d.h"

@interface PhysicalEnemyDummy : CCSprite {
	int myPosition;
	float timerMax;
	float timerCur;
	bool isAlive;
	
	int behaviorCounter;
	
	int HpMax;
	int HpCur;
	
	int Atk;
	int Def;
	int Res;
	
	NSMutableArray * behaviorPattern;
	
	int ActionCounter;
	
}
-(id)initWithTag:(int)foo andPos:(int)position;
-(void)setUpEnemy:(int)monsterTag;
-(void)updateTimer;
-(void)updatePosition:(int)position;
-(bool)enemyIsReady;
-(int)getPosition;
-(float)getTimerProgress;
-(void)resetTimer;
-(NSString*)performAction;
@end