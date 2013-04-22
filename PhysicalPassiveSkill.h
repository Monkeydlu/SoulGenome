
#import "cocos2d.h"

@interface PhysicalPassiveSkill : NSObject{
	bool isFixedLevel;
	int SkillTag;
	int SkillLevel;
	
	int maxSkillLevel;
	int TeirLevel;
	NSString* SkillName;
	NSString* SkillDescription;
	
	int preReqTeir;
	int preReqLvl;
	
	NSString* skillIcon;
}

-(PhysicalPassiveSkill*)initSkillWithTag:(int)tag andLevel:(int)level andIsFixed:(bool)isFixed;

-(NSString*)getSkillName;
-(NSString*)getSkillDisc;
-(int)getSkillLevel;
-(int)getTeirLevel;

-(void)raiseSkillLevel;

-(void)setUpHelper;

-(NSString*)getSkillIco;

-(int)getPreReqTeir;
-(int)getPreReqLvl;

@end
