
#import "cocos2d.h"

@interface PhysicalBasicSkill : NSObject{
	
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

-(PhysicalBasicSkill*)initSkillWithTag:(int)tag;

-(NSString*)getSkillName;
-(NSString*)getSkillDisc;
-(int)getSkillLevel;
-(int)getTeirLevel;
-(int)getSkillTag;

-(void)raiseSkillLevel;

-(NSString*)getSkillIcon;

-(int)getPreReqTeir;
-(int)getPreReqLvl;


@end
