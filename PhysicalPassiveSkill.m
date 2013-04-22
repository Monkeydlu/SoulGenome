

#import "PhysicalPassiveSkill.h"


@implementation PhysicalPassiveSkill

//00-09 Berserker
//10-19 Samurai
-(void)skillSetUpHelper{
	switch (SkillTag) {
		case 0: //  (0/4)	Recklessness
			maxSkillLevel = 4;
			TeirLevel = 1;
			SkillName = @"Recklessness";
			SkillDescription = @"Normal attacks take % of Max Health to do Increased Damage";
			preReqTeir = 0;
			preReqLvl = 0;
			skillIcon = @"SkillIcon.png";
			break;
		case 1: //  (0/4)	Rage
			maxSkillLevel = 4;
			TeirLevel = 1;
			SkillName = @"Rage";
			SkillDescription = @"Increased physical damage for all sources, but take more damage from all sources";
			preReqTeir = 0;
			preReqLvl = 0;
			skillIcon = @"SkillIcon.png";
			break;
		case 2: //  (0/4)	Bloodthirst
			maxSkillLevel = 4;
			TeirLevel = 2;
			SkillName = @"Bloodthirst";
			SkillDescription = @"Once per battle, upon death, automatically revive with some health";
			preReqTeir = 2;
			preReqLvl = 1;
			skillIcon = @"SkillIcon.png";
			break;
		case 3: //  (0/4)	Healthy Body
			maxSkillLevel = 4;
			TeirLevel = 3;
			SkillName = @"Healthy Body";
			SkillDescription = @"Increase Max & Cur HP by [20] per level";
			preReqTeir = 3;
			preReqLvl = 1;
			skillIcon = @"SkillIcon.png";
			break;
		case 4: //  (0/4)	Endure
			maxSkillLevel = 4;
			TeirLevel = 3;
			SkillName = @"Endure";
			SkillDescription = @"Once per battle, upon death, automatically revive with some health";
			preReqTeir = 3;
			preReqLvl = 1;
			skillIcon = @"SkillIcon.png";
			break;
		case 5: //  (0/4)	Ferocity
			maxSkillLevel = 4;
			TeirLevel = 4;
			SkillName = @"Ferocity";
			SkillDescription = @"Increases your ATK and DEF per HP lost";
			preReqTeir = 4;
			preReqLvl = 1;
			skillIcon = @"SkillIcon.png";
			break;
		default:
			NSLog(@"initialized invalid Passice skill");
			break;
	}
}

-(PhysicalPassiveSkill*)initSkillWithTag:(int)tag andLevel:(int)level andIsFixed:(bool)isFixed{
	
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