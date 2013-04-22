//
//  PhysicalEnemyDummy.h
//  Tower Of Heros
//
//  Created by MingYang Lu on 2/26/13.
//  Copyright 2013 Vanderbilt University. All rights reserved.
//

#import "cocos2d.h"
#import "BattleSceneLayer.h"

typedef enum tagButtonState {
	kButtonStatePressed,
	kButtonStateNotPressed
} ButtonState;

typedef enum tagButtonStatus {
	kButtonStatusEnabled,
	kButtonStatusDisabled
} ButtonStatus;

@interface PhysicalEnemyDummy : CCSprite <CCTargetedTouchDelegate>{
	float timerMax;
	float timerCur;
	bool isAlive;
	int position;
	NSString* name;
	NSString* imageFileName;
	NSString* imageFileNamePressed;
	
	int HpMax;
	int HpCur;
	
	int Atk;
	int Def;
	
	int behavior[10];
	
	int ActionCounter;
	
	ButtonState state;
	ButtonStatus buttonStatus;
	
}
-(id)initWithTag:(int)foo andName:(NSString*)nameTag andPosition:(int)positonTag;
-(void)setUpEnemy:(int)monsterTag;
-(void)updateTimer;
-(bool)enemyIsReady;
-(float)getTimerProgress;
-(void)resetTimer;
-(int)getAction;
-(void)progressActionCounter;
-(NSString*)getName;
-(int)getATK;
-(int)getDEF;
-(void)takeDamage:(int)damage;
-(bool)isDead;


@end