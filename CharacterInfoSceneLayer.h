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

@interface CharacterInfoLayer : CCLayerColor {
	
}
- (id) initWithCharacter:(PhysicalCharacter*)character;
@end
