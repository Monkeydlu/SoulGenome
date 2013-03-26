//
//  PhysicalCharacter.h
//  Tower Of Heros
//
//  Created by MingYang Lu on 1/10/13.
//  Copyright (c) 2013 Vanderbilt University. All rights reserved.
//

#import "cocos2d.h"
#import "PhysicalEquipment.h"
@class PhysicalEquipment;
@class PhysicalSkill;

@interface PhysicalCharacter : NSObject
{
	//Character's basic info.
	NSString* characterName;
	NSNumber* classTagNum;
	NSString* className;
	NSNumber* PartyPosition;
	
	bool isMale;
	
	//Character's skill usage pools.
	NSNumber *S1cur, *S1max, *S2cur, *S2max; 
	NSNumber *S3cur, *S3max, *S4cur, *S4max;
	
	//Character's current stats and their modifiers.
	int HPcur; 
	int HPmax;
	NSNumber* STR;
	NSNumber* VIT;
	NSNumber* AGI;
	NSNumber* INT;
	NSNumber* DEX;
	
	//Character's ACT, ATK, and DEF
	int ACT;
	int ATK; 
	int DEF;
	
	//Character's color resistences. 
	NSNumber* RED;
	NSNumber* GREEN;
	NSNumber* YELLOW;
	NSNumber* BLUE;
	NSNumber* PURPLE;
	
	//Character's skills.	
	NSArray* Skills;
	
	//Character's equipments;
	PhysicalEquipment* Armor;
	PhysicalEquipment* Weapon;
	PhysicalEquipment* Acc1;
	PhysicalEquipment* Acc2;

	NSMutableString* BasicInfo;
	NSMutableString* StatInfo;
	NSMutableString* AtkDefInfo;
	NSMutableString* HudInfo;
}

-(NSArray*)getAffinity;
-(NSArray*)getSkillsLearned;
-(NSArray*)getSkillsAll;

-(NSString*)getBasicInfo;
-(NSString*)getStatInfo;
-(NSString*)getAtkDefinfo;
-(CCSprite*)getCharacterBustSquare;

-(NSString*)getHudInfo;

-(int)getClassTag;
-(int)getActRate;
-(NSString*)getName;

-(id)initCharacterWithClass:(NSNumber*)classTag 
							   WithPosition:(int)position 
								   WithName:(NSString*)name
								 WithGender:(bool)isMale;

@end
