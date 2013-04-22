//
//  PhysicalCharacter.m
//  Tower Of Heros
//
//  Created by MingYang Lu on 1/10/13.
//  Copyright (c) 2013 Vanderbilt University. All rights reserved.
//

#import "PhysicalCharacter.h"
#import "PhysicalBasicSkill.h"
#import "JobClassesInfoBox.h"
#import "PhysicalEquipment.h"

@implementation PhysicalCharacter

-(id)initCharacterWithClass:(int)classTag
			   WithPosition:(int)position 
				   WithName:(NSString*)name 
				 WithGender:(bool)characterIsMale{	
	
	if ((self = [super init])) {
		
		
		PartyPosition = position;
		characterName = [NSString stringWithString:name];
		classTagNum = classTag;
		isMale = characterIsMale;
		
		switch (classTag) {
			case 1:
				className = @"Berserker";
				break;
			case 2:
				className = @"Stratagist";
				break;
			default:
				break;
		}
		
		if (isMale) {
			switch (classTagNum) {
				case 1:
					bustImage = [[CCSprite spriteWithFile:@"DefenderMaleSquare.png"] retain];
					break;
				case 2:
					bustImage = [[CCSprite spriteWithFile:@"StratagistMaleSquare.png"] retain];
					break;
				default:
					break;
			}
		}else{
			switch (classTagNum) {
				case 1:
					bustImage = [[CCSprite spriteWithFile:@"DefenderFemaleSquare.png"] retain];
					break;
				case 2:
					bustImage = [[CCSprite spriteWithFile:@"StratagistFemaleSquare.png"] retain];
					break;
				default:
					break;
			}
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
		
		STR = [[classStats objectAtIndex:1] intValue];
		VIT = [[classStats objectAtIndex:2] intValue];
		AGI = [[classStats objectAtIndex:3] intValue];
		INT = [[classStats objectAtIndex:4] intValue];
		DEX = [[classStats objectAtIndex:5] intValue];
		
		ACT = 100 / ((float)AGI + 10);
		ACT = floorf(ACT * 100 + 0.5) / 100;
		
		TechPCur[0] = [[classStats objectAtIndex:7] intValue];
		TechPtMax[0] = [[classStats objectAtIndex:7] intValue];
		TechPCur[1] = [[classStats objectAtIndex:8] intValue];
		TechPtMax[1] = [[classStats objectAtIndex:8] intValue];
		TechPCur[2] = [[classStats objectAtIndex:9] intValue];
		TechPtMax[2] = [[classStats objectAtIndex:9] intValue];
		TechPCur[3] = [[classStats objectAtIndex:10] intValue];
		TechPtMax[3] = [[classStats objectAtIndex:10] intValue];
		
		RED =		[[classStats objectAtIndex:11] intValue];
		GREEN =		[[classStats objectAtIndex:12] intValue];
		YELLOW =	[[classStats objectAtIndex:13] intValue];
		BLUE =		[[classStats objectAtIndex:14] intValue];
		PURPLE =	[[classStats objectAtIndex:15] intValue];
		
		ATK = [[classStats objectAtIndex:16] intValue];
		DEF = [[classStats objectAtIndex:17] intValue];
		
		Armor = [[PhysicalEquipment alloc] initEuipmentWithTag: [[classStats objectAtIndex:18] intValue] asArmor:true];
		Weapon = [[PhysicalEquipment alloc] initEuipmentWithTag: [[classStats objectAtIndex:18] intValue] asArmor:false];
		
		basicSkills = [[tempBox GetSkillsLearnableOfClass:classTag whileType:0] retain];
		passiveSkills = [[tempBox GetSkillsLearnableOfClass:classTag whileType:1] retain];
		activeSkills = [[tempBox GetSkillsLearnableOfClass:classTag whileType:2] retain];
		
		NSLog(@"basic skills has %d entries", [basicSkills count]);
		NSLog(@"passive skills has %d entries", [passiveSkills count]);
		NSLog(@"active skills has %d entries", [activeSkills count]);
		
		currentSkillPoints = 3;
		
		for (int i = 0; i < 3; i++) {
			statuses[i] = 0;
			buffs[i] = 0;
			physRes[i] = 1;
			magiRes[i] = 1;
		}
		
		timerMax = ACT;
		NSLog(@"act rate is %.2f, timer max is %.2f",ACT, timerMax);
		timerCur = 0;
		
		//[self setCharacterBustSquare];
	}
	
	return self;
}

-(NSString*)getBasicInfo{
	//[BasicInfo release];
	BasicInfo = [NSString stringWithFormat:@"%@\n%@\nHP:%d/%d\nSP:%d•%d•%d•%d\nACT:%.2fsecs", characterName, className, HPcur, HPmax, TechPCur[0], TechPCur[1],TechPCur[2],TechPCur[3], ACT];
	//BasicInfo = [NSMutableString stringWithFormat:@"%@\n%@\nHP:5/5\nSP:%@/%@/%@/%@\nACT:%@", characterName, className, S1cur, S2cur,S3cur,S4cur, ACT];
	return BasicInfo;
	//return [NSString stringWithFormat:@"%@\n%@\nHP:%@/%@\nSP:%@/%@/%@/%@\nACT:%@", characterName, className, HPcur, HPmax, S1cur, S2cur,S3cur,S4cur, ACT];
	//[tempString release];
}

-(NSString*)getStatInfo{
	//[StatInfo release];
	StatInfo = [NSMutableString stringWithFormat:@"STR:%d\nVIT:%d\nAGI:%d\nINT:%d\nDEX:%d", STR, VIT, AGI, INT, DEX];
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
	needsUpdate = false;
	HudInfo = [NSString stringWithFormat:@"\n\n  %@\n  HP:%d/%d\n  SP:%d•%d•%d•%d", characterName, HPcur, HPmax, TechPCur[0], TechPCur[1],TechPCur[2],TechPCur[3]];
	return HudInfo;
}

-(NSArray*)getAffinity{
	return 0;
}

-(NSMutableArray*)getBasicSkills{
	//NSLog(@"basic skills has %d entries", [basicSkills count]);
	return basicSkills;
}
-(NSMutableArray*)getPassiveSkills{
	//NSLog(@"passive skills has %d entries", [passiveSkills count]);
	return passiveSkills;
}
-(NSMutableArray*)getActiveSkills{
	//NSLog(@"active skills has %d entries", [activeSkills count]);
	return activeSkills;
}

-(CCSprite*)getCharacterBustSquare{
	
	if (isMale) {
		switch (classTagNum) {
			case 1:
				return [[CCSprite spriteWithFile:@"DefenderMaleSquare.png"] retain];
				break;
			case 2:
				return [[CCSprite spriteWithFile:@"StratagistMaleSquare.png"] retain];
				break;
			default:
				break;
		}
	}else{
		switch (classTagNum) {
			case 1:
				return [[CCSprite spriteWithFile:@"DefenderFemaleSquare.png"] retain];
				break;
			case 2:
				return [[CCSprite spriteWithFile:@"StratagistFemaleSquare.png"] retain];
				break;
			default:
				break;
		}
	}
	
	return 0;
}

-(int)getClassTag{
	return classTagNum;
}

-(int)getActRate{
	return ACT;
}

-(NSString*)getName{
	return characterName;
}

-(void)updateTimer{
	if ((timerCur < timerMax)) { //state 10 and above alter timers.
		if (HPcur != 0) {
			timerCur = timerCur + 0.1;
		}
	}
}

-(bool)heroIsReady{
	return (timerCur >= timerMax);
}

-(float)getTimerProgress{
	float temp = timerCur / timerMax;
	return (temp);
}

-(void)resetTimer{
	timerCur = 0;
}

-(int)getCurHealth{
	return HPcur;
}
-(int)getMaxHealth{
	return HPmax;
}

-(int)getAtk{
	return ATK;
}
-(int)getDef{
	return DEF;
}

-(int)getStr{
	return STR;
}
-(int)getVit{
	return VIT;
}
-(int)getAgi{
	return AGI;
}
-(int)getDex{
	return DEX;
}
-(int)getInt{
	return INT;
}

-(void)takeDamage:(int)damage{
	needsUpdate = true;
	HPcur = HPcur - damage;
	if (HPcur < 0) {
		HPcur = 0;
		timerCur = 0;
	}
}

-(BOOL)needsUpdate{
	return needsUpdate;
}

-(CGPoint)getPosition{
	switch (PartyPosition) {
		case 1:
			return ccp(50, 265);
			break;
		case 2:
			return ccp(50, 160);
			break;
		case 3:
			return ccp(50, 55);
			break;
		default:
			break;
	}
	return ccp(50, 55);
}

-(ccColor3B)getSoulColor{
	int r = 85;
	int g = 85;
	int b = 85;
	
	int total = RED + GREEN + YELLOW + BLUE + PURPLE;
	
	r = r + ((RED / total) * 170);
	g = g + ((GREEN / total) * 170);
	b = b + ((BLUE / total) * 170);
	
	r = r + ((YELLOW / total) * 170);
	g = g + ((YELLOW / total) * 170);
	
	r = r + ((PURPLE / total) * 170);
	b = b + ((PURPLE / total) * 170);
	
	return ccc3(r, g, b);
}

-(int)getSkillPoints{
	return currentSkillPoints;
}
-(BOOL)skillPointMinus{
	if (currentSkillPoints > 0) {
		currentSkillPoints--;
		return true;
	}
	return false;
}

-(void)skillPointGain{
	currentSkillPoints++;
}

-(void)techPointsAdjustOfTeir:(int)teir modifier:(int)mod{
	TechPCur[teir-1] += mod;
	TechPtMax[teir-1] += mod;
}

-(void)increaseMaxHp:(int)modifier{
	HPcur += modifier;
	HPmax += modifier;
}

@end
