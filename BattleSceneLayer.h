//
//  BattleScene.h
//  Tower Of Heros
//
//  Created by MingYang Lu on 2/21/13.
//  Copyright 2013 Vanderbilt University. All rights reserved.
//

@class PhysicalHeroDummy;
@class PhysicalEnemyDummy;
@class CCMenuItemImage;
@class HexTileCCMenuItemImage;

#import "cocos2d.h"
#import "PhysicalCharacter.h"
#import "GameScene.h"
#import "PhysicalHeroDummy.h"
#import "PhysicalEnemyDummy.h"
#import "PhysicalHexTile.h"

@interface BattleLayer : CCLayerColor {
	int currentGameState;
	
	PhysicalCharacter* member1;
	PhysicalCharacter* member2;
	PhysicalCharacter* member3;
	
	PhysicalHeroDummy* hero1;
	PhysicalHeroDummy* hero2;
	PhysicalHeroDummy* hero3;
	
	CCSprite * menuBack1;
	CCSprite * menuBack2;
	
	int currentlySelectedHero;
	
	int numOfEnemies;
	PhysicalEnemyDummy* enemy1;
	PhysicalEnemyDummy* enemy2;
	PhysicalEnemyDummy* enemy3;
	PhysicalEnemyDummy* enemy4;
	
	CCProgressTimer * hero1Timer;
	CCProgressTimer * hero2Timer;
	CCProgressTimer * hero3Timer;
	
	HexTileCCMenuItemImage * HexTileArray[19];

	CCMenu* Column1;
	CCMenu* Column2;
	CCMenu* Column3;
	CCMenu* Column4;
	CCMenu* Column5;
	
	CCMenu* battleCommands; 
	
	CCMenu* unitsInBattle;
	
	CCSprite * backGround;
	
	
}
-(void)setUpEnemies;
-(void)updateTimer:(ccTime)dt;
-(void)setUpUnitTimers;
-(void)setUpUnitsInBattleMenu;
-(void)setUpBattleMenu;
@end
