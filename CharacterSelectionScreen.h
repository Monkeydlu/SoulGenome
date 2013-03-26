//
//  CharacterSelectionScreen.h
//  Tower Of Heros
//
//  Created by MingYang Lu on 1/15/13.
//  Copyright (c) 2013 Vanderbilt University. All rights reserved.
//

#import "cocos2d.h"
#import "PhysicalCharacter.h"
#import "someToolsClass.h"

@class PhysicalCharacter;
@class GameScene;


@interface enterNameLayer : CCLayerColor {
	UITextField *myText;
	NSString * characterName;
}
@end

@interface ClassSelectLayer : CCLayerColor {
	CCMenu * ClassSelectMenu;
	int currentClassSelected;
	CCSprite * FemaleCharacterSquare;
	CCSprite * MaleCharacterSquare;
	CCSprite * ClassAffinities;
	CCSprite * selectedBorder;
	bool maleSelected;
	CCLabelTTF * classDiscriptionLabel;
}
@property bool maleSelected;
@property int currentClassSelected;
@end

@interface BaseLayer : CCLayerColor {
	CCMenu * CharacterSelectMenu; 
	CCLabelTTF * TopLabel;
	CCSprite * selectedBorder;
	int characterSelected;
	PhysicalCharacter *Character1;
	PhysicalCharacter *Character2;
	PhysicalCharacter *Character3;
	CCLabelTTF * BasicInfoBox;
	CCLabelTTF * StatInfoBox;
	CCLabelTTF * BattleInfo;
	CCSprite * Character1Bust;
	CCSprite * Character2Bust;
	CCSprite * Character3Bust;
}
@property int characterSelected;
@property (retain) PhysicalCharacter *Character1;
@property (retain) PhysicalCharacter *Character2;
@property (retain) PhysicalCharacter *Character3;
@end

@interface CharacterSelectionScreenSceen : CCScene {
	BaseLayer* Layer1;
	ClassSelectLayer* Layer2;
	enterNameLayer* Layer3;
	CCSprite * Bg;
}
@property (nonatomic, retain) BaseLayer* Layer1;
@property (nonatomic, retain) ClassSelectLayer* Layer2;
@property (nonatomic, retain) enterNameLayer* Layer3;
@property (nonatomic, retain) CCSprite * Bg;
@end

