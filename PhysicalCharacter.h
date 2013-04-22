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

@interface PhysicalCharacter : NSObject
{
	//Character's basic info.
	CCSprite* bustImage;
	CCSprite* bodyImage;
	NSString* characterName;
	int classTagNum;
	NSString* className;
	int PartyPosition;
	BOOL isMale;
	
	int currentSkillPoints;
	
	//true if information about the character changed and needs update.
	BOOL needsUpdate;
	
	//Character's skill usage pools.
	int TechPCur[4];
	int TechPtMax[4];

	//Character's current stats and their modifiers.
	int HPcur; 
	int HPmax;
	int STR;
	int VIT;
	int AGI;
	int INT;
	int DEX;
	
	//Character's resistances.
	// 0 = Slash, 1 = Bash, 2 = pierce
	// 0 = Fire,  1 = Ice,  2 = Lightning
	int physRes[3];
	int magiRes[3];
	
	//Character's ACT, ATK, and DEF
	float ACT;
	int ATK; 
	int DEF;
	
	//Character's timmer
	float timerMax;
	float timerCur;
	
	//Character's current State
	int statuses[3]; //death, poison, etc etc.
	int buffs[3]; //attack up etc etc.
	
	//Character's color values. 
	int RED;
	int GREEN;
	int YELLOW;
	int BLUE;
	int PURPLE;
	
	//Character's skills.	
	NSMutableArray* basicSkills;
	NSMutableArray* passiveSkills;
	NSMutableArray* activeSkills;
	
	//Character's equipments;
	PhysicalEquipment* Armor;
	PhysicalEquipment* Weapon;

	NSMutableString* BasicInfo;
	NSMutableString* StatInfo;
	NSMutableString* AtkDefInfo;
	NSMutableString* HudInfo;
}

-(NSArray*)getAffinity;

-(NSMutableArray*)getBasicSkills;
-(NSMutableArray*)getPassiveSkills;
-(NSMutableArray*)getActiveSkills;

-(NSString*)getBasicInfo;
-(NSString*)getStatInfo;
-(NSString*)getAtkDefinfo;
-(CCSprite*)getCharacterBustSquare;

-(NSString*)getHudInfo;

-(int)getClassTag;
-(int)getActRate;
-(NSString*)getName;

-(void)updateTimer;
-(bool)heroIsReady;
-(float)getTimerProgress;
-(void)resetTimer;

-(int)getCurHealth;
-(int)getMaxHealth;

-(int)getAtk;
-(int)getDef;

-(int)getStr;
-(int)getVit;
-(int)getAgi;
-(int)getDex;
-(int)getInt;

-(BOOL)needsUpdate;

-(void)takeDamage:(int)damage;

-(CGPoint)getPosition;

-(ccColor3B)getSoulColor;

-(int)getSkillPoints;
-(BOOL)skillPointMinus;
-(void)skillPointGain;

-(void)techPointsAdjustOfTeir:(int)teir modifier:(int)mod;

-(void)increaseMaxHp:(int)modifier;

-(id)initCharacterWithClass:(int)classTag
							   WithPosition:(int)position 
								   WithName:(NSString*)name
								 WithGender:(bool)isMale;

@end
