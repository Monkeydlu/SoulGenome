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

	PhysicalRoom * PhysicalRoomArray[16];
	
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
- (void) activateRoomNum:(int)RoomNumber;
- (void)reactivateRoomType:(int)typeNum;
@property (nonatomic, retain) CCMenu * mapRow1; 
@property (nonatomic, retain) CCMenu * mapRow2;
@property (nonatomic, retain) CCMenu * mapRow3;
@property (nonatomic, retain) CCMenu * mapRow4;
@end

@interface BaseHudLayer : CCLayerColor {
	CCMenu * CharacterHud;
	PhysicalCharacter* char1;
	PhysicalCharacter* char2;
	PhysicalCharacter* char3;
	CCLabelTTF * Character1InfoBox;
	CCLabelTTF * Character2InfoBox;
	CCLabelTTF * Character3InfoBox;
	CCRenderTexture* strokeBox1;
	CCRenderTexture* strokeBox2;
	CCRenderTexture* strokeBox3;
	CCSprite * Character1Portrait;
	CCSprite * Character2Portrait;
	CCSprite * Character3Portrait;
}
- (id) initWithc1:(PhysicalCharacter*)char1 
			   c2:(PhysicalCharacter*)char2 
			   c3:(PhysicalCharacter*)char3;
-(void) turnOffHud;
-(void) turnOnHud;
-(void) updateHuds;
@property (nonatomic, retain) CCMenu* CharacterHud;
@property (nonatomic, retain) CCLabelTTF * Character1InfoBox;
@property (nonatomic, retain) CCLabelTTF * Character2InfoBox;
@property (nonatomic, retain) CCLabelTTF * Character3InfoBox;
@property (nonatomic, retain) CCRenderTexture* strokeBox1;
@property (nonatomic, retain) CCRenderTexture* strokeBox2;
@property (nonatomic, retain) CCRenderTexture* strokeBox3;
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
	
	PhysicalCharacter* tempChar;
}
- (id) initGameWithc1:(PhysicalCharacter*)char1 
			   c2:(PhysicalCharacter*)char2 
			   c3:(PhysicalCharacter*)char3;
- (void) enableMap;
- (void) createNewMap:(int)level;
- (void) updateHuds;
- (void) openCharacterInfoWindow:(int)characterPosition;
@property (nonatomic, retain) CharacterInfoLayer* myCharacterInfoLayer;
@property (nonatomic, retain) MapLayer* myMapLayer;
@property (nonatomic, retain) BaseHudLayer* myBaseLayer;
@property (nonatomic, retain) BattleLayer* myBattleLayer;
@property (nonatomic, retain) PhysicalCharacter* char1;
@property (nonatomic, retain) PhysicalCharacter* char2;
@property (nonatomic, retain) PhysicalCharacter* char3;
@end
