//
//  BattleScene.h
//  Tower Of Heros
//
//  Created by MingYang Lu on 1/18/13.
//  Copyright (c) 2013 Vanderbilt University. All rights reserved.
//

@class PhysicalRoom;
@class BattleLayer;
@class CharacterInfoLayer;

#import "cocos2d.h"
#import "PhysicalCharacter.h"
#import "PhysicalRoom.h"
#import "BattleSceneLayer.h"
#import "CharacterInfoSceneLayer.h"


@interface MapLayer : CCLayerColor {

	PhysicalRoom * PhysRoom10;
	PhysicalRoom * PhysRoom11;
	PhysicalRoom * PhysRoom12;
	PhysicalRoom * PhysRoom13;
	
	PhysicalRoom * PhysRoom20;
	PhysicalRoom * PhysRoom21;
	PhysicalRoom * PhysRoom22;
	PhysicalRoom * PhysRoom23;
	
	PhysicalRoom * PhysRoom30;
	PhysicalRoom * PhysRoom31;
	PhysicalRoom * PhysRoom32;
	PhysicalRoom * PhysRoom33;
	
	PhysicalRoom * PhysRoom40;
	PhysicalRoom * PhysRoom41;
	PhysicalRoom * PhysRoom42;
	PhysicalRoom * PhysRoom43;
	
	int monsterNo1;
	int monsterNo2;
	int monsterNo3;
	int boss;
	
	CCMenu * mapRow1; 
	CCMenu * mapRow2;
	CCMenu * mapRow3;
	CCMenu * mapRow4;
	
	PhysicalCharacter* char1;
	PhysicalCharacter* char2;
	PhysicalCharacter* char3;
	
	int floorLevel;
}
- (id) initWithLevel:(int)level 
		andTreasures:(NSMutableArray*)treasures
				  c1:(PhysicalCharacter*)char1 
				  c2:(PhysicalCharacter*)char2 
				  c3:(PhysicalCharacter*)char3;
- (void) addMap;
- (void) checkTreasures:(int[20])treasureList;
- (void) activateRoomNum:(int)RoomNumber;
@end

@interface BaseHudLayer : CCLayerColor {
	CCMenu * CharacterHud;
	CCLabelTTF * Character1InfoBox;
	CCLabelTTF * Character2InfoBox;
	CCLabelTTF * Character3InfoBox;
	CCSprite * Character1Portrait;
	CCSprite * Character2Portrait;
	CCSprite * Character3Portrait;
}
- (id) initWithc1:(PhysicalCharacter*)char1 
			   c2:(PhysicalCharacter*)char2 
			   c3:(PhysicalCharacter*)char3;
@property (nonatomic, retain) CCMenu* CharacterHud;
@property (nonatomic, retain) CCLabelTTF * Character1InfoBox;
@property (nonatomic, retain) CCLabelTTF * Character2InfoBox;
@property (nonatomic, retain) CCLabelTTF * Character3InfoBox;
@property (nonatomic, retain) CCSprite * Character1Portrait;
@property (nonatomic, retain) CCSprite * Character2Portrait;
@property (nonatomic, retain) CCSprite * Character3Portrait;
@end

@interface GameScene : CCScene{
	CharacterInfoLayer * myCharacterInfoLayer;
	MapLayer * myMapLayer;
	BaseHudLayer * myBaseLayer;
	BattleLayer * myBattleLayer;
	CCSprite * Bg;
	
	PhysicalCharacter* char1;
	PhysicalCharacter* char2;
	PhysicalCharacter* char3;
}
- (id) initGameWithc1:(PhysicalCharacter*)char1 
			   c2:(PhysicalCharacter*)char2 
			   c3:(PhysicalCharacter*)char3;
@property (nonatomic, retain) CharacterInfoLayer* myCharacterInfoLayer;
@property (nonatomic, retain) MapLayer* myMapLayer;
@property (nonatomic, retain) BaseHudLayer* myBaseLayer;
@property (nonatomic, retain) BattleLayer* myBattleLayer;
@property (nonatomic, retain) PhysicalCharacter* char1;
@property (nonatomic, retain) PhysicalCharacter* char2;
@property (nonatomic, retain) PhysicalCharacter* char3;
@end
