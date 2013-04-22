//
//  CharacterInfoLayer.m
//  Tower Of Heros
//
//  Created by MingYang Lu on 2/21/13.
//  Copyright 2013 Vanderbilt University. All rights reserved.
//

#import "CharacterInfoSceneLayer.h"
#import "GameScene.h"
#import "PhysicalBasicSkill.h"
#import "PhysicalPassiveSkill.h"
#import "PhysicalActiveSkill.h"
#import "someToolsClass.h"


@implementation CharacterInfoLayer



-(void)StatusTabPressed{
	NSLog(@"Status menu selected");
}

-(void)SoulTabPressed{
	NSLog(@"Soul menu selected");
}

-(void)SkillTabPressed{
	NSLog(@"Skill menu selected");
	NSMutableArray* temp = [currentCharacter getBasicSkills];
	
	basicSkillsMenu = [CCMenu menuWithItems: nil];
	
	for (int i = 0; i < [temp count]; i++) {
		PhysicalBasicSkill* bar = [temp objectAtIndex:i];
		
		CCMenuItemImage * foo = [CCMenuItemImage itemFromNormalImage:[bar getSkillIcon]
													   selectedImage:[bar getSkillIcon]
															  target:self
															selector:@selector(basicSkillWindow:)];
		foo.tag = i;
		[basicSkillsMenu addChild:foo];
	}
	[basicSkillsMenu alignItemsHorizontallyWithPadding:40];
	[basicSkillsMenu setPosition:ccp(280, 270)];
	[self addChild:basicSkillsMenu z:31];
	
	t1SkillsMenu = [CCMenu menuWithItems: nil];
	t2SkillsMenu = [CCMenu menuWithItems: nil];
	t3SkillsMenu = [CCMenu menuWithItems: nil];
	t4SkillsMenu = [CCMenu menuWithItems: nil];
	
	temp = [currentCharacter getPassiveSkills];
	
	for (int i = 0; i < [temp count]; i++) {
		PhysicalBasicSkill* bar = [temp objectAtIndex:i];
		CCMenuItemImage * foo = [CCMenuItemImage itemFromNormalImage:[bar getSkillIcon]
													   selectedImage:[bar getSkillIcon]
															  target:self
															selector:@selector(passiveSkillWindow:)];
		foo.tag = i;
		switch ([bar getTeirLevel]) {
			case 1:
				[t1SkillsMenu addChild:foo];
				break;
			case 2:
				[t2SkillsMenu addChild:foo];
				break;
			case 3:
				[t3SkillsMenu addChild:foo];
				break;
			case 4:
				[t4SkillsMenu addChild:foo];
				break;
			default:
				break;
		}
	}
	
	temp = [currentCharacter getActiveSkills];
	
	for (int i = 0; i < [temp count]; i++) {
		PhysicalBasicSkill* bar = [temp objectAtIndex:i];
		CCMenuItemImage * foo = [CCMenuItemImage itemFromNormalImage:[bar getSkillIcon]
													   selectedImage:[bar getSkillIcon]
															  target:self
															selector:@selector(activeskillWindow:)];
		foo.tag = i;
		switch ([bar getTeirLevel]) {
			case 1:
				[t1SkillsMenu addChild:foo];
				break;
			case 2:
				[t2SkillsMenu addChild:foo];
				break;
			case 3:
				[t3SkillsMenu addChild:foo];
				break;
			case 4:
				[t4SkillsMenu addChild:foo];
				break;
			default:
				break;
		}
	}
	
	
	[t1SkillsMenu alignItemsVerticallyWithPadding:30];
	[t2SkillsMenu alignItemsVerticallyWithPadding:30];
	[t3SkillsMenu alignItemsVerticallyWithPadding:30];
	[t4SkillsMenu alignItemsVerticallyWithPadding:30];
	
	[t1SkillsMenu setPosition:ccp(180, 150)];
	[t2SkillsMenu setPosition:ccp(240, 150)];
	[t3SkillsMenu setPosition:ccp(300, 150)];
	[t4SkillsMenu setPosition:ccp(360, 150)];
	
	[self addChild:t1SkillsMenu z:31];
	[self addChild:t2SkillsMenu z:31];
	[self addChild:t3SkillsMenu z:31];
	[self addChild:t4SkillsMenu z:31];
}

-(void)learnPressedCleanUp{
	GameScene * myParent = (GameScene *)[self parent];
	[myParent updateHuds];
	[self removeChild:skillLevelBg cleanup:YES];
	[self removeChild:skillDiscLabel cleanup:YES];
	[self removeChild:skillLevelMenu cleanup:YES];
	basicSkillsMenu.isTouchEnabled = YES;
	t1SkillsMenu.isTouchEnabled = YES;
	t2SkillsMenu.isTouchEnabled = YES;
	t3SkillsMenu.isTouchEnabled = YES;
	t4SkillsMenu.isTouchEnabled = YES;
}

-(void)learnPressed{
	NSLog(@"learn skill pressed");
	
	int foo;
	int bar;
	NSMutableArray* temp = [currentCharacter getBasicSkills];
	PhysicalBasicSkill* tempTeirSkill;
	bool reqMet = false;
	switch (currentlySelectedSkillType) {
		case 1:
			NSLog(@"Attempt to learn basic skills");
			foo = [currentSelectedSkillB getPreReqTeir];
			bar = [currentSelectedSkillB getPreReqLvl];
			if (foo > 0) {
				tempTeirSkill = [temp objectAtIndex:foo - 1];
				NSLog(@"Skill requires pre req teir %d", foo);
				NSLog(@"Teir %d master is level %d, must be at least %d", foo, [tempTeirSkill getSkillLevel], bar);
				if ([tempTeirSkill getSkillLevel] >= bar) {
					if ([currentCharacter skillPointMinus]) {
						reqMet = true;
					}else{
						NSLog(@"No skill points left");
					}
				}
			}else if (foo == 0) {
				NSLog(@"Skill requires no pre reqs");
				if ([currentCharacter skillPointMinus]) {
					reqMet = true;
				}else{
					NSLog(@"No skill points left");
				}
			}
			if (reqMet) {
				NSLog(@"successfully learned basic skill");
				[currentSelectedSkillB raiseSkillLevel];
				[someToolsClass learnedABasicSkill:[currentSelectedSkillB getSkillTag]
									   onCharacter:currentCharacter];
				
				[self learnPressedCleanUp];
			}
			break;
		case 2:
			NSLog(@"Attempt to learn Passive skills");
			foo = [currentSelectedSkillP getPreReqTeir];
			bar = [currentSelectedSkillP getPreReqLvl];
			if (foo > 0) {
				tempTeirSkill = [temp objectAtIndex:foo - 1];
				NSLog(@"Skill requires pre req teir %d", foo);
				NSLog(@"Teir %d master is level %d, must be at least %d", foo, [tempTeirSkill getSkillLevel], bar);
				if ([tempTeirSkill getSkillLevel] >= bar) {
					if ([currentCharacter skillPointMinus]) {
						reqMet = true;
					}else{
						NSLog(@"No skill points left");
					}
				}
			}else if (foo == 0) {
				NSLog(@"Skill requires no pre reqs");
				if ([currentCharacter skillPointMinus]) {
					reqMet = true;
				}else{
					NSLog(@"No skill points left");
				}
			}
			if (reqMet) {
				NSLog(@"successfully learned basic skill");
				[currentSelectedSkillB raiseSkillLevel];
				[self learnPressedCleanUp];
			}
			break;
		case 3:
			NSLog(@"Attempt to learn Active skills");
			foo = [currentSelectedSkillA getPreReqTeir];
			bar = [currentSelectedSkillA getPreReqLvl];
			if (foo > 0) {
				tempTeirSkill = [temp objectAtIndex:foo - 1];
				NSLog(@"Skill requires pre req teir %d", foo);
				NSLog(@"Teir %d master is level %d, must be at least %d", foo, [tempTeirSkill getSkillLevel], bar);
				if ([tempTeirSkill getSkillLevel] >= bar) {
					if ([currentCharacter skillPointMinus]) {
						reqMet = true;
					}else{
						NSLog(@"No skill points left");
					}
				}
			}else if (foo == 0) {
				NSLog(@"Skill requires no pre reqs");
				if ([currentCharacter skillPointMinus]) {
					reqMet = true;
				}else{
					NSLog(@"No skill points left");
				}
			}
			if (reqMet) {
				NSLog(@"successfully learned basic skill");
				[currentSelectedSkillA raiseSkillLevel];
				[self learnPressedCleanUp];
			}
			break;
		default:
			break;
	}
	
}

-(void)exitPressed{
	[self removeChild:skillLevelBg cleanup:YES];
	[self removeChild:skillDiscLabel cleanup:YES];
	[self removeChild:skillLevelMenu cleanup:YES];
	basicSkillsMenu.isTouchEnabled = YES;
	t1SkillsMenu.isTouchEnabled = YES;
	t2SkillsMenu.isTouchEnabled = YES;
	t3SkillsMenu.isTouchEnabled = YES;
	t4SkillsMenu.isTouchEnabled = YES;
}

-(void)skillPressedHelper{
	basicSkillsMenu.isTouchEnabled = NO;
	t1SkillsMenu.isTouchEnabled = NO;
	t2SkillsMenu.isTouchEnabled = NO;
	t3SkillsMenu.isTouchEnabled = NO;
	t4SkillsMenu.isTouchEnabled = NO;
	
	skillLevelBg = [CCSprite spriteWithFile:@"skillLevelBack.png"];
	[skillLevelBg setPosition:ccp(240, 160)];
	[self addChild:skillLevelBg z:40];

	[skillDiscLabel setPosition:ccp(240, 120)];
	skillDiscLabel.color = ccc3(0, 0, 0);
	[self addChild:skillDiscLabel z:41];
	
	CCMenuItemImage * Confirm = [CCMenuItemImage itemFromNormalImage:@"Learn.png"
													   selectedImage:@"Learn.png"
															  target:self
															selector:@selector(learnPressed)];
	
	CCMenuItemImage * Exit    = [CCMenuItemImage itemFromNormalImage:@"Exit.png"
													   selectedImage:@"Exit.png"
															  target:self
															selector:@selector(exitPressed)];
	
	skillLevelMenu = [CCMenu menuWithItems:Confirm, Exit, nil];
	[skillLevelMenu alignItemsHorizontallyWithPadding:20];
	[skillLevelMenu setPosition:ccp(240, 110)];
	
	[self addChild:skillLevelMenu z:42];
}

-(void)basicSkillWindow:(CCMenuItemImage *)sender{
	NSLog(@"basic skill pressed");
	currentlySelectedSkillType = 1;
	NSMutableArray* temp = [currentCharacter getBasicSkills];
	currentSelectedSkillB = [temp objectAtIndex:[sender tag]];
	
	skillDiscLabel = [CCLabelTTF labelWithString: [currentSelectedSkillB getSkillDisc]
									  dimensions: CGSizeMake(320, 200)
									   alignment: UITextAlignmentCenter
								   lineBreakMode: UILineBreakModeWordWrap
										fontName: @"Arial"
										fontSize: 16];
	
	[self skillPressedHelper];
}

-(void)passiveSkillWindow:(CCMenuItemImage *)sender{
	NSLog(@"passive skill pressed");
	currentlySelectedSkillType = 2;
	NSMutableArray* temp = [currentCharacter getPassiveSkills];
	currentSelectedSkillP = [temp objectAtIndex:[sender tag]];
	
	skillDiscLabel = [CCLabelTTF labelWithString: [currentSelectedSkillP getSkillDisc]
									  dimensions: CGSizeMake(320, 200)
									   alignment: UITextAlignmentCenter
								   lineBreakMode: UILineBreakModeWordWrap
										fontName: @"Arial"
										fontSize: 16];
	
	[self skillPressedHelper];
}

-(void)activeskillWindow:(CCMenuItemImage *)sender{
	NSLog(@"active skill pressed");
	currentlySelectedSkillType = 3;
	NSMutableArray* temp = [currentCharacter getActiveSkills];
	currentSelectedSkillA = [temp objectAtIndex:[sender tag]];
	
	skillDiscLabel = [CCLabelTTF labelWithString: [currentSelectedSkillA getSkillDisc]
									  dimensions: CGSizeMake(320, 200)
									   alignment: UITextAlignmentCenter
								   lineBreakMode: UILineBreakModeWordWrap
										fontName: @"Arial"
										fontSize: 16];
	
	
	[self skillPressedHelper];
}

- (id) initWithCharacter:(PhysicalCharacter *)character{
	if ((self = [super init])) {
		backGround = [CCSprite spriteWithFile:@"CharacterMenuBack.png"];
		[backGround setPosition:ccp(280, 160)];
		[self addChild:backGround z:30];
		
		currentCharacter = character;
		NSLog(@"current character: %@", [currentCharacter getName]);
		
		CCMenuItemImage * StatusTab = [CCMenuItemImage itemFromNormalImage:@"TabButton.png"
															 selectedImage:@"TabButton.png"
																	target:self
																  selector:@selector(StatusTabPressed)];
		
		CCMenuItemImage * SoulTab = [CCMenuItemImage itemFromNormalImage:@"TabButton.png"
														   selectedImage:@"TabButton.png"
																  target:self
																selector:@selector(SoulTabPressed)];
		
		CCMenuItemImage * SkillsTab = [CCMenuItemImage itemFromNormalImage:@"TabButton.png"
															 selectedImage:@"TabButton.png"
																	target:self
																  selector:@selector(SkillTabPressed)];
		
		menuTabs = [CCMenu menuWithItems:StatusTab, SoulTab, SkillsTab, nil];
		[menuTabs alignItemsVerticallyWithPadding:20];
		[menuTabs setPosition:ccp(440, 160)];
		
		[self addChild:menuTabs z:31];
		
		[self SkillTabPressed];
	}
    return self;
}

@end
