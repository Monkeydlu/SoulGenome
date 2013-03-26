//
//  PhysicalCharacter.m
//  Tower Of Heros
//
//  Created by MingYang Lu on 1/10/13.
//  Copyright (c) 2013 Vanderbilt University. All rights reserved.
//

#import "PhysicalCharacter.h"
#import "PhysicalSkill.h"
#import "JobClassesInfoBox.h"

@implementation PhysicalCharacter

-(id)initCharacterWithClass:(NSNumber*)classTag 
			   WithPosition:(int)position 
				   WithName:(NSString*)name 
				 WithGender:(bool)characterIsMale{	
	
	if ((self = [super init])) {
		
		
		PartyPosition = [NSNumber numberWithInt:position];
		characterName = [NSString stringWithString:name];
		classTagNum = [NSNumber numberWithInt:[classTag intValue]];
		isMale = characterIsMale;
		switch ([classTag intValue]) {
			case 1:
				className = @"Defender";
				break;
			case 2:
				className = @"Stratagist";
				break;
			default:
				break;
		}
		
		JobClassesInfoBox * tempBox = [[JobClassesInfoBox alloc] init];
		NSLog(@"infoBox successfully initialized");
		//NSLog(@"%@", [[tempBox GetClassStatInfoOfClass:classTag] count]);
		NSArray * classStats = [tempBox GetClassStatInfoOfClass:classTag];
		NSLog(@"array recieved");
		
		
		//NSNumber* temp = [classStats objectAtIndex:1];
		//HPcur = [NSNumber numberWithInt:[temp intValue]];
		//HPmax = [NSNumber numberWithInt:[temp intValue]];
		
		HPcur = [[classStats objectAtIndex:0] intValue];
		HPmax = [[classStats objectAtIndex:0] intValue];
		
		STR = [classStats objectAtIndex:1];
		VIT = [classStats objectAtIndex:2];
		AGI = [classStats objectAtIndex:3];
		INT = [classStats objectAtIndex:4];
		DEX = [classStats objectAtIndex:5];
		
		ACT = [[classStats objectAtIndex:6] intValue];
		
		S1cur = [classStats objectAtIndex:7];
		S1max = [classStats objectAtIndex:7];
		S2cur = [classStats objectAtIndex:8];
		S2max = [classStats objectAtIndex:8];
		S3cur = [classStats objectAtIndex:9];
		S3max = [classStats objectAtIndex:9];
		S4cur = [classStats objectAtIndex:10];
		S4max = [classStats objectAtIndex:10];
		
		STR = [classStats objectAtIndex:11];
		VIT = [classStats objectAtIndex:12];
		AGI = [classStats objectAtIndex:13];
		INT = [classStats objectAtIndex:14];
		DEX = [classStats objectAtIndex:15];
		
		ATK = [[classStats objectAtIndex:16] intValue];
		DEF = [[classStats objectAtIndex:17] intValue];
		
		//ATK = [NSNumber numberWithInt:4];
		//DEF = [NSNumber numberWithInt:6];
		
		/*
		Skills = [JobClassesInfoBox GetSkillsLearnableOfClass:classTag];
		
		
		
		NSArray* EquipTemp = [JobClassesInfoBox GetStartingEquipmentOfClass:classTag];
		
		Armor = [EquipTemp objectAtIndex:0];
		Weapon = [EquipTemp objectAtIndex:1];
		Acc1 = [EquipTemp objectAtIndex:2];
		Acc2 = [EquipTemp objectAtIndex:3];
		*/
	}
	
	return self;
}

-(NSString*)getBasicInfo{
	//[BasicInfo release];
	BasicInfo = [NSString stringWithFormat:@"%@\n%@\nHP:%d/%d\nSP:%@•%@•%@•%@\nACT:%d", characterName, className, HPcur, HPmax, S1cur, S2cur,S3cur,S4cur, ACT];
	//BasicInfo = [NSMutableString stringWithFormat:@"%@\n%@\nHP:5/5\nSP:%@/%@/%@/%@\nACT:%@", characterName, className, S1cur, S2cur,S3cur,S4cur, ACT];
	return BasicInfo;
	//return [NSString stringWithFormat:@"%@\n%@\nHP:%@/%@\nSP:%@/%@/%@/%@\nACT:%@", characterName, className, HPcur, HPmax, S1cur, S2cur,S3cur,S4cur, ACT];
	//[tempString release];
}

-(NSString*)getStatInfo{
	//[StatInfo release];
	StatInfo = [NSMutableString stringWithFormat:@"STR:%@\nVIT:%@\nAGI:%@\nINT:%@\nDEX:%@", STR, VIT, AGI, INT, DEX];
	return StatInfo;
	//return [NSString stringWithFormat:@"STR:%@\nVIT:%@\nAGI:%@\nINT:%@\nDEX:%@", STR, VIT, AGI, INT, DEX];
	//[tempString2 release];
}

-(NSString*)getAtkDefinfo{
	//[AtkDefInfo release];
	AtkDefInfo = [NSMutableString stringWithFormat:@"ATK:%d\nDEF:%d", ATK, DEF, nil];
	return AtkDefInfo;
	//NSLog(@"ATK:%d\nDEF:%d", ATK, DEF);
	//return @"something";
	//return [NSString stringWithFormat:@"ATK:%@ DEF:%@", ATK, DEF];
	//[tempString3 release];
}

-(NSString*)getHudInfo{
	HudInfo = [NSString stringWithFormat:@"\n\n  %@\n  HP:%d/%d\n  SP:%@•%@•%@•%@", characterName, HPcur, HPmax, S1cur, S2cur,S3cur,S4cur];
	return HudInfo;
}

-(NSArray*)getAffinity{
	NSArray* Affinity = [NSArray arrayWithObjects:RED, GREEN, YELLOW, BLUE, PURPLE, nil];
	return Affinity;
}

-(NSArray*)getSkillsLearned{
	//Skills will contain all the skills the player has that are at least at Lvl 1. 
	//It will store the skills by storing first the number representation of that skill, 
	//and then the level value of the skill.
	NSMutableArray* LearnedSkills;
	
	for (size_t i = 0; i < [Skills count]; i++) {
		PhysicalSkill* zoobar = [Skills objectAtIndex:i];
		if ([zoobar getSkillLevel] > 0) {
			[LearnedSkills addObject:zoobar];
		}
	}
	
	return LearnedSkills;
}

-(NSArray*)getSkillsAll{
	return Skills;
}

-(CCSprite*)getCharacterBustSquare{
	if (isMale) {
		switch ([classTagNum intValue]) {
			case 1:
				return [CCSprite spriteWithFile:@"DefenderMaleSquare.png"];
				break;
			case 2:
				return [CCSprite spriteWithFile:@"StratagistMaleSquare.png"];
				break;		
			default:
				break;
		}
	}else{
		switch ([classTagNum intValue]) {
			case 1:
				return [CCSprite spriteWithFile:@"DefenderFemaleSquare.png"];
				break;
			case 2:
				return [CCSprite spriteWithFile:@"StratagistFemaleSquare.png"];
				break;	
			default:
				break;
		}
	}
	
	return 0;
}

-(int)getClassTag{
	return [classTagNum intValue];
}

-(int)getActRate{
	return ACT;
}

-(NSString*)getName{
	return characterName;
}

@end
