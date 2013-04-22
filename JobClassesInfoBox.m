//
//  JobClassKnight.m
//  Tower Of Heros
//
//  Created by MingYang Lu on 1/8/13.
//  Copyright (c) 2013 Vanderbilt University. All rights reserved.
//

//This is the class that will handel the information for all the classes. 
//There is a function for every single class in the game that
//returns all the stats of that class at a particular level.
//Then there is a function that will return a nsarray of
//all the skills that class can learn. 

#import "JobClassesInfoBox.h"
#import "PhysicalEquipment.h"
#import "PhysicalBasicSkill.h"
#import "PhysicalActiveSkill.h"
#import "PhysicalPassiveSkill.h"

@implementation JobClassesInfoBox

-(id) init{
	if ((self = [super init])) {
		
	}
	return self;
}

-(NSArray*)GetClassStatInfoOfClass:(int)classTag{
	//NSArray* stats = 0;
	NSLog(@"creating info array");
	switch (classTag) {
		case 1: //Berserker
			NSLog(@"creating Berserker");
			return [NSArray arrayWithObjects:
					//[0]	HP	HEALTH POINTS
					[NSNumber numberWithInt:42],
					//[1]	STR	STRENTH
					[NSNumber numberWithInt:9],
					//[2]	VIT	VITALITY
					[NSNumber numberWithInt:5],
					//[3]	AGI	AGILITY
					[NSNumber numberWithInt:3],
					//[4]	INT	INTELEGENCE
					[NSNumber numberWithInt:1],
					//[5]	DEX	DEXTERITY
					[NSNumber numberWithInt:2],
					//[6]	Attack Type [0 = slash][1 = bash][2 = pierce]
					[NSNumber numberWithInt:1],
					//[7]	S1	SPELL LV1
					[NSNumber numberWithInt:1], 
					//[8]	S2	SPELL LV2
					[NSNumber numberWithInt:0], 
					//[9]	S3	SPELL LV3
					[NSNumber numberWithInt:0], 
					//[10]	S4	SPELL LV4
					[NSNumber numberWithInt:0],
					//[11]	RED
					[NSNumber numberWithInt:5],
					//[12]	GREEN
					[NSNumber numberWithInt:4],
					//[13]	YELLOW
					[NSNumber numberWithInt:3],
					//[14]	BLUE
					[NSNumber numberWithInt:1],
					//[15]	PURPLE
					[NSNumber numberWithInt:2],
					//[16]	ATK
					[NSNumber numberWithInt:16],
					//[17]	DEF
					[NSNumber numberWithInt:8],
					//[18]	Weapon Tag
					[NSNumber numberWithInt:1],
					//[19]	Armor Tag
					[NSNumber numberWithInt:1],
					nil];
			break;
		case 2: //STRATAGIST
			NSLog(@"creating stratagist");
			return [NSArray arrayWithObjects:
					//[0]	HP	HEALTH POINTS
					[NSNumber numberWithInt:35], 
					//[1]	STR	STRENTH
					[NSNumber numberWithInt:6], 
					//[2]	VIT	VITALITY
					[NSNumber numberWithInt:11], 
					//[3]	AGI	AGILITY
					[NSNumber numberWithInt:7], 
					//[4]	INT	INTELEGENCE
					[NSNumber numberWithInt:5], 
					//[5]	DEX	DEXTERITY
					[NSNumber numberWithInt:7], 
					//[6]	ACT	ACTION
					[NSNumber numberWithInt:100], 
					//[7]	S1	SPELL LV1
					[NSNumber numberWithInt:1], 
					//[8]	S2	SPELL LV2
					[NSNumber numberWithInt:0], 
					//[9]	S3	SPELL LV3
					[NSNumber numberWithInt:0], 
					//[10]	S4	SPELL LV4
					[NSNumber numberWithInt:0],
					//[11]	RED
					[NSNumber numberWithInt:1],
					//[12]	GREEN
					[NSNumber numberWithInt:3],
					//[13]	YELLOW
					[NSNumber numberWithInt:2],
					//[14]	BLUE
					[NSNumber numberWithInt:4],
					//[15]	PURPLE
					[NSNumber numberWithInt:5],
					//[16]	ATK
					[NSNumber numberWithInt:12],
					//[17]	DEF
					[NSNumber numberWithInt:21],
					nil];
			break;
		default:
			NSLog(@"OUT OF BOUNDS");
			return 0;
			break;
	}
}

//Takes in a int value representing class being 
//checked for skills learnable.
//[0] = Defender	[1] = Knight
-(NSMutableArray*)GetSkillsLearnableOfClass:(int)classTag whileType:(int)typeTag{
	NSMutableArray* Skills = 0;
	
	switch (classTag) {
		case 1:
			NSLog(@"fetch berserker skills");
			//Class Berserker
			if(typeTag == 0){
				Skills = [NSMutableArray arrayWithObjects:
						  [[PhysicalBasicSkill alloc] initSkillWithTag:10],
						  [[PhysicalBasicSkill alloc] initSkillWithTag:20],
						  [[PhysicalBasicSkill alloc] initSkillWithTag:30],
						  [[PhysicalBasicSkill alloc] initSkillWithTag:40],
						  nil];
			}else if(typeTag == 1){
				Skills = [NSMutableArray arrayWithObjects:
						  [[PhysicalPassiveSkill alloc] initSkillWithTag:0 andLevel:0 andIsFixed:false],
						  [[PhysicalPassiveSkill alloc] initSkillWithTag:1 andLevel:0 andIsFixed:false],
						  [[PhysicalPassiveSkill alloc] initSkillWithTag:2 andLevel:0 andIsFixed:false],
						  [[PhysicalPassiveSkill alloc] initSkillWithTag:3 andLevel:0 andIsFixed:false],
						  [[PhysicalPassiveSkill alloc] initSkillWithTag:4 andLevel:0 andIsFixed:false],
						  [[PhysicalPassiveSkill alloc] initSkillWithTag:5 andLevel:0 andIsFixed:false],
						  nil];
			}else{
				Skills = [NSMutableArray arrayWithObjects:
						  [[PhysicalActiveSkill alloc] initSkillWithTag:0 andLevel:2 andIsFixed:false],
						  [[PhysicalActiveSkill alloc] initSkillWithTag:1 andLevel:2 andIsFixed:false],
						  [[PhysicalActiveSkill alloc] initSkillWithTag:2 andLevel:2 andIsFixed:false],
						  [[PhysicalActiveSkill alloc] initSkillWithTag:3 andLevel:2 andIsFixed:false],
						  [[PhysicalActiveSkill alloc] initSkillWithTag:4 andLevel:2 andIsFixed:false],
						  [[PhysicalActiveSkill alloc] initSkillWithTag:5 andLevel:2 andIsFixed:false],
						  nil];
			}
			
			break;
			
		case 2:
			//Class Stratagist
			Skills = [NSArray arrayWithObjects:
						nil];
			break;
			
		default:
			//Shouldn't happen.
			NSLog (@"Class inputted out of range");
			break;
	}
	NSLog(@"Skills has %d entries", [Skills count]);
	return Skills;
}

-(NSArray*)GetStartingEquipmentOfClass:(int)classTag{
	NSArray* startingEquips = 0;
	
	switch (classTag) {
		case 1:
			//Class Defender
			startingEquips = [NSArray arrayWithObjects:
							  //[0]		Armor
							  [[PhysicalEquipment alloc] initEuipmentWithTag:0],
							  //[1]		Weapon
							  [[PhysicalEquipment alloc] initEuipmentWithTag:1],
							  //[2]		Acc1
							  [[PhysicalEquipment alloc] initEuipmentWithTag:2],
							  //[3]		Acc2
							  [[PhysicalEquipment alloc] initEuipmentWithTag:3],
							  nil];
			break;
			
		case 2:
			//Class Stratagist
			startingEquips = [NSArray arrayWithObjects:
							  //[0]		Armor
							  [NSNumber numberWithInt:0],
							  //[1]		Weapon
							  [NSNumber numberWithInt:1],
							  //[2]		Acc1
							  [NSNumber numberWithInt:2],
							  //[3]		Acc2
							  [NSNumber numberWithInt:3],
							  nil];
			break;
			
		default:
			//Shouldn't happen.
			NSLog (@"Class inputted out of range");
			break;
	}
	return 0;
	
}

-(ccColor3B)getSoulColor:(int)classTag{
	NSArray* stats = [self GetClassStatInfoOfClass:classTag];
	float r = 85;
	float g = 85;
	float b = 85;
	
	float RED = [[stats objectAtIndex:11] floatValue];
	float GREEN = [[stats objectAtIndex:12] floatValue];
	float YELLOW = [[stats objectAtIndex:13] floatValue];
	float BLUE = [[stats objectAtIndex:14] floatValue];
	float PURPLE = [[stats objectAtIndex:15] floatValue];
	
	float total = RED + GREEN + YELLOW + BLUE + PURPLE;
	
	r = r + ((RED / total) * 170);
	g = g + ((GREEN / total) * 170);
	b = b + ((BLUE / total) * 170);
	
	r = r + ((YELLOW / total) * 170);
	g = g + ((YELLOW / total) * 170);
	
	r = r + ((PURPLE / total) * 170);
	b = b + ((PURPLE / total) * 170);
	
	NSLog(@"R:%f, G:%f, B:%f", r, g, b);
	return ccc3(r, g, b);
}


@end
