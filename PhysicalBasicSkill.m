

#import "PhysicalBasicSkill.h"


@implementation PhysicalBasicSkill

-(void)skillSetUpHelper{
	switch (SkillTag) {
		case 1: //  HP UP I (0/10)
			maxSkillLevel = 10;
			TeirLevel = 0;
			SkillName = @"HP UP I";
			SkillDescription = @"Increases HP by 10 per level";
			preReqTeir = 0;
			preReqLvl = 0;
			skillIcon = @"SkillIcon.png";
			break;
		case 2: //  HP UP II (0/10)
			maxSkillLevel = 10;
			TeirLevel = 0;
			SkillName = @"HP UP II";
			SkillDescription = @"Increases HP by 13 per level";
			preReqTeir = 0;
			preReqLvl = 0;
			skillIcon = @"SkillIcon.png";
			break;
		case 3: //  HP UP III (0/10)
			maxSkillLevel = 10;
			TeirLevel = 0;
			SkillName = @"HP UP III";
			SkillDescription = @"Increases HP by 15 per level";
			preReqTeir = 0;
			preReqLvl = 0;
			skillIcon = @"SkillIcon.png";
			break;
		case 10:  // TP•1 UP I (0/5)
			maxSkillLevel = 5;
			TeirLevel = 1;
			SkillName = @"TP•1 UP I";
			SkillDescription = @"Increases TP•1 by 1";
			preReqTeir = 0;
			preReqLvl = 0;
			skillIcon = @"SkillIcon.png";
			break;
		case 11:  // TP•1 UP II (0/3)
			maxSkillLevel = 3;
			TeirLevel = 1;
			SkillName = @"TP•1 UP II";
			SkillDescription = @"Increases TP•1 by 2";
			preReqTeir = 0;
			preReqLvl = 0;
			skillIcon = @"SkillIcon.png";
			break;
		case 20:  // TP•2 UP I (0/5)
			maxSkillLevel = 5;
			TeirLevel = 2;
			SkillName = @"TP•2 UP I";
			SkillDescription = @"Increases TP•2 by 1";
			preReqTeir = 1;
			preReqLvl = 2;
			skillIcon = @"SkillIcon.png";
			break;
		case 21:  // TP•2 UP II (0/4)
			maxSkillLevel = 4;
			TeirLevel = 2;
			SkillName = @"TP•2 UP II";
			SkillDescription = @"Increases TP•2 by 2";
			preReqTeir = 1;
			preReqLvl = 2;
			skillIcon = @"SkillIcon.png";
			break; 
		case 30:  // TP•3 UP I (0/5)
			maxSkillLevel = 5;
			TeirLevel = 3;
			SkillName = @"TP•3 UP I";
			SkillDescription = @"Increases TP•3 by 1";
			preReqTeir = 2;
			preReqLvl = 2;
			skillIcon = @"SkillIcon.png";
			break;
		case 31:  // TP•3 UP II (0/3)
			maxSkillLevel = 3;
			TeirLevel = 3;
			SkillName = @"TP•3 UP II";
			SkillDescription = @"Increases TP•3 by 2";
			preReqTeir = 2;
			preReqLvl = 2;
			skillIcon = @"SkillIcon.png";
			break;
		case 40: // TP•4 UP I (0/5)
			maxSkillLevel = 5;
			TeirLevel = 4;
			SkillName = @"TP•4 UP I";
			SkillDescription = @"Increases TP•4 by 1";
			preReqTeir = 3;
			preReqLvl = 2;
			skillIcon = @"SkillIcon.png";
			break;
		default:
			NSLog(@"initialized invalid basic skill");
			break;
	}
}

-(PhysicalBasicSkill*)initSkillWithTag:(int)tag{
	
	if ((self = [super init])) {
		SkillTag = tag;
		SkillLevel = 0;
		
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

-(int)getSkillTag{
	return SkillTag;
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
