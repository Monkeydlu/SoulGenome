//
//  JobClassKnight.h
//  Tower Of Heros
//
//  Created by MingYang Lu on 1/8/13.
//  Copyright (c) 2013 Vanderbilt University. All rights reserved.
//

#import "cocos2d.h"
@class PhysicalEquipment;
@class PhysicalBasicSkill;
@class PhysicalActiveSkill;
@class PhysicalPassiveSkill;

@interface JobClassesInfoBox : NSObject{
	
}

//function that returns an array of the skills
//a class can learn. 
-(NSMutableArray*)GetSkillsLearnableOfClass:(int)classTag whileType:(int)typeTag;
-(NSArray*)GetClassStatInfoOfClass:(int)classTag;
-(NSArray*)GetStartingEquipmentOfClass:(int)classTag;
-(ccColor3B)getSoulColor:(int)classTag;
@end
