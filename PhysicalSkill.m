//
//  Skills.m
//  Tower Of Heros
//
//  Created by MingYang Lu on 1/10/13.
//  Copyright (c) 2013 Vanderbilt University. All rights reserved.
//

#import "PhysicalSkill.h"


@implementation PhysicalSkill

-(PhysicalSkill*)initSkillWithTag:(int)tag{
	//access the Skill Tool Box and set up values. 
	return self;
}

-(NSString*)getSkillName{
	return SkillName;
}
-(NSNumber*)getSkillLevel{
	return SkillLevel;
}
-(NSNumber*)getTeirLevel{
	return TeirLevel;
}
-(NSNumber*)getCostToLevel{
	return CostToLevel;
}

-(void)raiseSkillLevel{
	int temp = [SkillLevel intValue];
	temp++;
	SkillLevel = [NSNumber numberWithInt:temp];
}
-(void)activateSkill{
	//Activate skill, access SkillToolBox.
}

@end
