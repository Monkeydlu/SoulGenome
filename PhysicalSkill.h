//
//  Skills.h
//  Tower Of Heros
//
//  Created by MingYang Lu on 1/10/13.
//  Copyright (c) 2013 Vanderbilt University. All rights reserved.
//

#import "cocos2d.h"

@interface PhysicalSkill : NSObject{
	NSNumber* SkillTag;
	NSNumber* SkillLevel;
	NSNumber* CostToLevel;
	NSNumber* TeirLevel;
	NSNumber* skillOwner;
	NSString* SkillName;
}

-(PhysicalSkill*)initSkillWithTag:(int)tag;

-(NSString*)getSkillName;
-(NSNumber*)getSkillLevel;
-(NSNumber*)getTeirLevel;
-(NSNumber*)getCostToLevel;

-(void)raiseSkillLevel;
-(void)activateSkill;

@end
