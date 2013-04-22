

#import "PhysicalActiveSkill.h"


@implementation PhysicalActiveSkill

//00-09 Berserker
//10-19 Samurai
-(void)skillSetUpHelper{
	switch (SkillTag) {
		case 0: //  (0/4)	Disregard
			maxSkillLevel = 4;
			TeirLevel = 1;
			SkillName = @"Disregard";
			SkillDescription = @"Deals [bash] damage to 1 target enemy & damages yourself";
			preReqTeir = 0;
			preReqLvl = 0;
			skillIcon = @"SkillIcon.png";
			break;
		case 1: //  (0/4)	Rampage
			maxSkillLevel = 4;
			TeirLevel = 1;
			SkillName = @"Rampage";
			SkillDescription = @"Deals [bash] damage to all enemies";
			preReqTeir = 0;
			preReqLvl = 0;
			skillIcon = @"SkillIcon.png";
			break;
		case 2: //  (0/4)	Roar
			maxSkillLevel = 4;
			TeirLevel = 2;
			SkillName = @"Roar";
			SkillDescription = @"Lower the physical defense of [1] enemy for 15 seconds";
			preReqTeir = 2;
			preReqLvl = 1;
			skillIcon = @"SkillIcon.png";
			break;
		case 3: //  (0/4)	Flame Crush
			maxSkillLevel = 4;
			TeirLevel = 2;
			SkillName = @"Flame Crush";
			SkillDescription = @"Deals [bash/fire] damage to 1 target enemy";
			preReqTeir = 2;
			preReqLvl = 1;
			skillIcon = @"SkillIcon.png";
			break;
		case 4: //  (0/4)	Charge
			maxSkillLevel = 4;
			TeirLevel = 3;
			SkillName = @"Charge";
			SkillDescription = @"Increase the damage you will deal next turn, effect wears off if you do not deal damage with your next turn";
			preReqTeir = 3;
			preReqLvl = 1;
			skillIcon = @"SkillIcon.png";
			break;
		case 5: //  (0/4)	Enraged Bash
			maxSkillLevel = 4;
			TeirLevel = 4;
			SkillName = @"Enraged Bash";
			SkillDescription = @"Deal heavy [bash] damage to 1 target enemy, with a chance to inflict stun on yourself";
			preReqTeir = 4;
			preReqLvl = 1;
			skillIcon = @"SkillIcon.png";
			break;
		default:
			NSLog(@"initialized invalid Active skill");
			break;
	}
}

-(PhysicalActiveSkill*)initSkillWithTag:(int)tag andLevel:(int)level andIsFixed:(bool)isFixed{
	
	if ((self = [super init])) {
		//access the Skill Tool Box and set up values.
		SkillTag = tag;
		SkillLevel = level;
		isFixedLevel = isFixed;
		[self skillSetUpHelper];
	}
	
	return self;
}


-(NSString*)getSkillName{
	return SkillName;
}

-(NSString*)getSkillDisc{
	return SkillDescription;
}

-(int)getSkillLevel{
	return SkillLevel;
}
-(int)getTeirLevel{
	return TeirLevel;
}

-(void)raiseSkillLevel{
	SkillLevel++;
}

-(NSString*)getSkillIcon{
	return skillIcon;
}

-(int)getPreReqTeir{
	return preReqTeir;
}

-(int)getPreReqLvl{
	return preReqLvl;
}


@end