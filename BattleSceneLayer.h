//
//  BattleSystemScene.h
//  Tower Of Heros
//
//  Created by MingYang Lu on 3/26/13.
//  Copyright 2013 Vanderbilt University. All rights reserved.
//

@class PhysicalHeroDummy;
@class PhysicalEnemyDummy;
@class CCMenuItemImage;

#import "cocos2d.h"
#import "PhysicalCharacter.h"
#import "GameScene.h"
#import "PhysicalEnemyDummy.h"

@interface BattleLayer : CCLayerColor {
	int currentGameState;
	
	PhysicalCharacter* member1;
	PhysicalCharacter* member2;
	PhysicalCharacter* member3;
	
	PhysicalCharacter* currentlySelectedHero;
	PhysicalEnemyDummy* enemyTemp;
	
	int numOfEnemies;
	
	PhysicalEnemyDummy* enemy1;
	PhysicalEnemyDummy* enemy2;
	PhysicalEnemyDummy* enemy3;
	PhysicalEnemyDummy* enemy4;
	
	CCProgressTimer * enemy1Timer;
	CCProgressTimer * enemy2Timer;
	CCProgressTimer * enemy3Timer;
	CCProgressTimer * enemy4Timer;
	
	CCProgressTimer * hero1Timer;
	CCProgressTimer * hero2Timer;
	CCProgressTimer * hero3Timer;
	
	CCMenu* battleCommands; 
	
	CCMenu* unitsInBattle;
	
	CCSprite * backGround;
	CCSprite * menuBack1;
	CCSprite * menuBack2;
	CCSpriteBatchNode *spriteSheet;
}
- (id) initWithLevel:(int)enemyTag
				  c1:(PhysicalCharacter*)chara1 
				  c2:(PhysicalCharacter*)chara2 
				  c3:(PhysicalCharacter*)chara3;
-(void)setUpEnemies;
-(void)updateTimer:(ccTime)dt;
-(void)setUpUnitTimers;
-(void)setUpUnitsInBattleMenu;
-(void)setUpBattleMenu;
-(void)Enemy1Selected;
-(void)Enemy2Selected;
-(void)Enemy3Selected;
-(void)Enemy4Selected;
-(void)endBattle;
-(void)EnemyAction;
-(void)playAttackAnimation:(int)animationTag;
@end
