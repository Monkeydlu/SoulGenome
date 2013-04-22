//
//  PhysicalEnemyDummy.m
//  Tower Of Heros
//
//  Created by MingYang Lu on 2/26/13.
//  Copyright 2013 Vanderbilt University. All rights reserved.
//

#import "PhysicalEnemyDummy.h"

@implementation PhysicalEnemyDummy

-(void)defineImageFile:(int)foo{
	
	switch (foo) {
		case 1:
			imageFileName = @"Enemy.png";
			imageFileNamePressed = @"EnemyPressed.png";
			break;
		default:
			break;
	}
}

-(void)setUpEnemy:(int)monsterTag{
	switch (monsterTag) {
		case 1: //temorary monster frog
			timerMax = 5.5;
			timerCur = 0;
			isAlive = true;
			HpMax = 30;
			HpCur = 30;
			
			Atk = 20;
			Def = 5;
			
			for (int i = 0; i < 10; i++) {
				behavior[i] = 1;
			}
			behavior[0] = 0;
			behavior[4] = 0;
			break;
		case 2:
			
			break;
		default:
			break;
	}
}

- (id)initWithTag:(int)foo andName:(NSString*)nameTag andPosition:(int)positonTag{
	[self defineImageFile:foo];
	
	if((self = [super initWithFile:imageFileName])) {
		[self setUpEnemy:foo];
		
		name = nameTag;
		
		ActionCounter = 0;
		position = positonTag;
		
		state = kButtonStateNotPressed;
	}
	return self;
}


//==============================================//

- (CGRect)rect
{
	CGSize s = [self.texture contentSize];
	return CGRectMake(-s.width / 2, -s.height / 2, s.width, s.height);
}

+ (id)spuButtonWithTexture:(CCTexture2D *)normalTexture
{
	return [[[self alloc] initWithTexture:normalTexture] autorelease];
}

- (BOOL)isPressed {
	if (state == kButtonStateNotPressed) return NO;
	if (state == kButtonStatePressed) return YES;
	return NO;
}

- (BOOL)isNotPressed {
	if (state == kButtonStateNotPressed) return YES;
	if (state == kButtonStatePressed) return NO;
	return YES;
}


- (void)onEnter
{
	[[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
	[super onEnter];
}

- (void)onExit
{
	[[CCTouchDispatcher sharedDispatcher] removeDelegate:self];
	[super onExit];
}   

- (BOOL)containsTouchLocation:(UITouch *)touch
{
	return CGRectContainsPoint(self.rect, [self convertTouchToNodeSpaceAR:touch]);
}

- (BOOL)ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
	if (state == kButtonStatePressed) return NO;
	if ( ![self containsTouchLocation:touch] ) return NO;
	if (buttonStatus == kButtonStatusDisabled) return NO;
	
	state = kButtonStatePressed;
	[self setTexture:[[CCSprite spriteWithFile:imageFileNamePressed]texture]];
	
	BattleLayer * myParent = (BattleLayer *)[self parent];
	switch (position) {
		case 1:
			[myParent Enemy1Selected];
			break;
		case 2:
			[myParent Enemy2Selected];
			break;
		case 3:
			[myParent Enemy3Selected];
			break;
		case 4:
			[myParent Enemy4Selected];
			break;
		default:
			break;
	}
	return YES;
}

- (void)ccTouchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
	// If it weren't for the TouchDispatcher, you would need to keep a reference
	// to the touch from touchBegan and check that the current touch is the same
	// as that one.
	// Actually, it would be even more complicated since in the Cocos dispatcher
	// you get NSSets instead of 1 UITouch, so you'd need to loop through the set
	// in each touchXXX method.
	
	if ([self containsTouchLocation:touch]) return;
	//if (buttonStatus == kButtonStatusDisabled) return NO;
	
	state = kButtonStateNotPressed;
	[self setTexture:[[CCSprite spriteWithFile:imageFileName]texture]];
	
}

- (void)ccTouchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{
	
	state = kButtonStateNotPressed;
	[self setTexture:[[CCSprite spriteWithFile:imageFileName]texture]];

}

//==============================================//


-(void)updateTimer{
	if (timerCur < timerMax && isAlive) {
		timerCur = timerCur + 0.1;
	}
}

-(bool)enemyIsReady{
	return (timerCur >= timerMax);
}

-(float)getTimerProgress{
	float temp = timerCur / timerMax;
	return (temp);
}

-(void)resetTimer{
	timerCur = 0;
}

-(int)getAction{
	return behavior[ActionCounter];
}

-(void)progressActionCounter{
	ActionCounter++;
}

-(NSString*)getName{
	return name;
}

-(int)getATK{
	return Atk;
}

-(int)getDEF{
	return Def;
}

-(void)takeDamage:(int)damage{
	HpCur = HpCur - damage;
	if (HpCur <= 0) {
		isAlive = false;
	}
}

-(bool)isDead{
	return !isAlive;
}


@end
