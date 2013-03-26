//
//  JobClassKnight.h
//  Tower Of Heros
//
//  Created by MingYang Lu on 1/8/13.
//  Copyright (c) 2013 Vanderbilt University. All rights reserved.
//

#import <Foundation/Foundation.h>
@class PhysicalEquipment;
@class PhysicalSkill;

@interface JobClassesInfoBox : NSObject{
	
}

//function that returns an array of the skills
//a class can learn. 
-(NSArray*)GetSkillsLearnableOfClass:(NSNumber*)classTag;
-(NSArray*)GetClassStatInfoOfClass:(NSNumber*)classTag;
-(NSArray*)GetStartingEquipmentOfClass:(NSNumber*)classTag;
@end
