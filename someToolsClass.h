//
//  someToolsClass.h
//  Tower Of Heros
//
//  Created by MingYang Lu on 1/28/13.
//  Copyright 2013 Vanderbilt University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "PhysicalCharacter.h"

@interface someToolsClass : CCNode {
    
}
+(CCRenderTexture*) createStroke: (CCLabelTTF*) label   size:(float)size   color:(ccColor3B)cor;
+(void) learnedABasicSkill:(int)skillTag onCharacter:(PhysicalCharacter*)character;
+(void) learnedAPassiveSkill:(int)skillTag onCharacter:(PhysicalCharacter*)character;
+(void) learnedAActiveSkill:(int)skillTag onCharacter:(PhysicalCharacter*)character;
@end
