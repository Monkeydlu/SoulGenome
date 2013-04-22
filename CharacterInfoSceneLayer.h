//
//  CharacterInfoLayer.h
//  Tower Of Heros
//
//  Created by MingYang Lu on 2/21/13.
//  Copyright 2013 Vanderbilt University. All rights reserved.
//

#import "cocos2d.h"
#import "PhysicalCharacter.h"
#import "GameScene.h"
#import "PhysicalBasicSkill.h"
#import "PhysicalPassiveSkill.h"
#import "PhysicalActiveSkill.h"

@interface CharacterInfoLayer : CCLayerColor {
	CCSprite * backGround;
	CCMenu * menuTabs;
	PhysicalCharacter * currentCharacter;
	
	CCMenu * basicSkillsMenu;
	CCMenu * t1SkillsMenu;
	CCMenu * t2SkillsMenu;
	CCMenu * t3SkillsMenu;
	CCMenu * t4SkillsMenu;
	
	int currentlySelectedSkillType;
	PhysicalBasicSkill * currentSelectedSkillB;
	PhysicalPassiveSkill * currentSelectedSkillP;
	PhysicalActiveSkill * currentSelectedSkillA;
	CCLabelTTF * skillDiscLabel;
	CCMenu * skillLevelMenu;
	CCSprite * skillLevelBg;
}
- (id) initWithCharacter:(PhysicalCharacter*)character;
@end
