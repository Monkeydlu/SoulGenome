
#import "cocos2d.h"

@interface PhysicalActiveSkill : NSObject{
	bool isFixedLevel;
	int SkillTag;
	int SkillLevel;
	
	int maxSkillLevel;
	
	bool isActiveSkill;
	int TeirLevel;
	NSString* SkillName;
	NSString* SkillDescription;
	int preReqTeir;
	int preReqLvl;
	
	NSString* skillIcon;
}

-(PhysicalActiveSkill*)initSkillWithTag:(int)tag andLevel:(int)level andIsFixed:(bool)isFixed;

-(NSString*)getSkillName;
-(NSString*)getSkillDisc;
-(int)getSkillLevel;
-(int)getTeirLevel;

-(void)raiseSkillLevel;

-(void)setUpHelper;

-(NSString*)getSkillIcon;

-(int)getPreReqTeir;
-(int)getPreReqLvl;

@end
