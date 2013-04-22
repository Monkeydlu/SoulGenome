//
//  BattleSystemScene.m
//  Tower Of Heros
//
//  Created by MingYang Lu on 3/26/13.
//  Copyright 2013 Vanderbilt University. All rights reserved.
//

#import "BattleSceneLayer.h"
#import "CCMenuAdvanced.h"


@implementation BattleLayer

- (id) initWithLevel:(int)enemyTag
				  c1:(PhysicalCharacter*)chara1 
				  c2:(PhysicalCharacter*)chara2 
				  c3:(PhysicalCharacter*)chara3{
	if ((self = [super init])) {
		
		member1 = chara1;
		member2 = chara2;
		member3 = chara3;
		
		backGround = [CCSprite spriteWithFile:@"Floor1BG.png"];
		[backGround setPosition:ccp(240, 160)];
		[self addChild:backGround z:0];

		[self generateEnemyParty:enemyTag];
		[self setUpUnitsInBattleMenu];
		[self setUpUnitTimers];
		
		currentGameState = 0;
		currentlySelectedHero = 0;
		
		[self schedule:@selector(updateTimer:) interval:0.1];
	}
    return self;
}


-(void)updateTimer:(ccTime)dt{
	
	if ([member1 needsUpdate] == true || [member2 needsUpdate] == true || [member3 needsUpdate] == true) {
		GameScene * myParent = (GameScene *)[self parent];
		[myParent updateHuds];
	}
	
	if (currentGameState == 0) {
		[member1 updateTimer];
		[member2 updateTimer];
		[member3 updateTimer];
		
		[hero1Timer setPercentage:[member1 getTimerProgress] * 100];
		[hero2Timer setPercentage:[member2 getTimerProgress] * 100];
		[hero3Timer setPercentage:[member3 getTimerProgress] * 100];
		
		bool enemysLeft = false;
		
		if (enemy1 != 0 && ![enemy1 isDead] && currentGameState == 0) {
			[enemy1 updateTimer];
			[enemy1Timer setPercentage:[enemy1 getTimerProgress] * 100];
			if ([enemy1 enemyIsReady]) {
				currentGameState = 10;
				enemyTemp = enemy1;
				[self EnemyAction];
				enemyTemp = 0;
				[enemy1 resetTimer];
				currentGameState = 0;
				return;
			}
			enemysLeft = true;
		}
		if (enemy2 != 0 && ![enemy2 isDead] && currentGameState == 0) {
			[enemy2 updateTimer];
			[enemy2Timer setPercentage:[enemy2 getTimerProgress] * 100];
			if ([enemy2 enemyIsReady]) {
				currentGameState = 10;
				enemyTemp = enemy1;
				[self EnemyAction];
				enemyTemp = 0;
				[enemy2 resetTimer];
				currentGameState = 0;
				return;
			}
			enemysLeft = true;
		}
		if (enemy3 != 0 && ![enemy3 isDead] && currentGameState == 0) {
			[enemy3 updateTimer];
			[enemy3Timer setPercentage:[enemy3 getTimerProgress] * 100];
			if ([enemy3 enemyIsReady]) {
				currentGameState = 10;
				enemyTemp = enemy1;
				[self EnemyAction];
				enemyTemp = 0;
				[enemy3 resetTimer];
				currentGameState = 0;
				return;
			}
			enemysLeft = true;
		}
		if (enemy4 != 0 && ![enemy4 isDead] && currentGameState == 0) {
			[enemy4 updateTimer];
			[enemy4Timer setPercentage:[enemy4 getTimerProgress] * 100];
			if ([enemy4 enemyIsReady]) {
				currentGameState = 10;
				enemyTemp = enemy1;
				[self EnemyAction];
				enemyTemp = 0;
				[enemy4 resetTimer];
				currentGameState = 0;
				return;
			}
			enemysLeft = true;
		}
		
		if (enemysLeft == false) {
			[self endBattle];
		}
	}
	
}

-(void)endBattle{
	GameScene * myParent = (GameScene *)[self parent];
	[myParent.myBaseLayer turnOnHud];
	[myParent enableMap];
	[myParent removeChild:myParent.myBattleLayer cleanup:YES];
}

-(void)generateEnemyParty:(int)partyTag{
	
	switch (partyTag) {
		case 1:
			enemy1 = [[PhysicalEnemyDummy alloc]initWithTag:1 andName:@"FrogA" andPosition:1];
			//enemy2 = [[PhysicalEnemyDummy alloc]initWithTag:1 andName:@"FrogB" andPosition:2];
			//enemy3 = [[PhysicalEnemyDummy alloc]initWithTag:1 andName:@"FrogC" andPosition:3];
			//enemy4 = [[PhysicalEnemyDummy alloc]initWithTag:1 andName:@"FrogD" andPosition:4];
			[enemy1 setPosition:ccp(140, 160)];
			//[enemy2 setPosition:ccp(200, 160)];
			//[enemy3 setPosition:ccp(260, 160)];
			//[enemy4 setPosition:ccp(320, 160)];
			[self addChild:enemy1 z:15];
			//[self addChild:enemy2 z:15];
			//[self addChild:enemy3 z:15];
			//[self addChild:enemy4 z:15];
			break;
		case 2:
			enemy1 = [[PhysicalEnemyDummy alloc]initWithTag:1 andName:@"FrogA" andPosition:1];
			enemy2 = [[PhysicalEnemyDummy alloc]initWithTag:1 andName:@"FrogB" andPosition:2];
			//enemy3 = [[PhysicalEnemyDummy alloc]initWithTag:1 andName:@"FrogC" andPosition:3];
			//enemy4 = [[PhysicalEnemyDummy alloc]initWithTag:1 andName:@"FrogD" andPosition:4];
			[enemy1 setPosition:ccp(140, 160)];
			[enemy2 setPosition:ccp(200, 160)];
			//[enemy3 setPosition:ccp(260, 160)];
			//[enemy4 setPosition:ccp(320, 160)];
			[self addChild:enemy1 z:15];
			[self addChild:enemy2 z:15];
			//[self addChild:enemy3 z:15];
			//[self addChild:enemy4 z:15];
			break;
		default:
			break;
	}
	
	[self setUpEnemies];
}

-(void)setUpEnemies{
	
	if (enemy1 != 0) {
		CCLabelTTF * enemy1NameBox = [CCLabelTTF labelWithString:[enemy1 getName]
													  dimensions:CGSizeMake(80, 20) 
													   alignment:UITextAlignmentLeft
												   lineBreakMode:UILineBreakModeWordWrap 
														fontName:@"Arial" 
														fontSize:14];
		[enemy1NameBox setPosition:ccp(435, 160 + 8 + 42*3)];
		[enemy1NameBox setColor:ccc3(0, 0, 0)];
		[self addChild:enemy1NameBox z:15];
		
		enemy1Timer = [CCProgressTimer progressWithFile:@"enemyLoadBar.png"];
		enemy1Timer.type = kCCProgressTimerTypeHorizontalBarLR;
		enemy1Timer.percentage = [enemy1 getTimerProgress];
		enemy1Timer.position = ccp(430, 160 - 8 + 42*3);
		[self addChild:enemy1Timer z:15];
	}
	
	if (enemy2 != 0) {
		CCLabelTTF * enemy2NameBox = [CCLabelTTF labelWithString:[enemy2 getName]
													  dimensions:CGSizeMake(80, 20) 
													   alignment:UITextAlignmentLeft
												   lineBreakMode:UILineBreakModeWordWrap 
														fontName:@"Arial" 
														fontSize:14];
		[enemy2NameBox setPosition:ccp(435, 160 + 8 + 42*2)];
		[enemy2NameBox setColor:ccc3(0, 0, 0)];
		[self addChild:enemy2NameBox z:15];
		
		enemy2Timer = [CCProgressTimer progressWithFile:@"enemyLoadBar.png"];
		enemy2Timer.type = kCCProgressTimerTypeHorizontalBarLR;
		enemy2Timer.percentage = [enemy2 getTimerProgress];
		enemy2Timer.position = ccp(430, 160 - 8 + 42*2);
		[self addChild:enemy2Timer z:15];
	}
	
	if (enemy3 != 0){
		CCLabelTTF * enemy3NameBox = [CCLabelTTF labelWithString:[enemy3 getName]
													  dimensions:CGSizeMake(80, 20) 
													   alignment:UITextAlignmentLeft
												   lineBreakMode:UILineBreakModeWordWrap 
														fontName:@"Arial" 
														fontSize:14];
		[enemy3NameBox setPosition:ccp(435, 160 + 8 + 42)];
		[enemy3NameBox setColor:ccc3(0, 0, 0)];
		[self addChild:enemy3NameBox z:15];
		
		enemy3Timer = [CCProgressTimer progressWithFile:@"enemyLoadBar.png"];
		enemy3Timer.type = kCCProgressTimerTypeHorizontalBarLR;
		enemy3Timer.percentage = [enemy3 getTimerProgress];
		enemy3Timer.position = ccp(430, 160 - 8 + 42);
		[self addChild:enemy3Timer z:15];
	}
	
	if (enemy4 != 0){
		
		CCLabelTTF * enemy4NameBox = [CCLabelTTF labelWithString:[enemy4 getName]
													  dimensions:CGSizeMake(80, 20) 
													   alignment:UITextAlignmentLeft
												   lineBreakMode:UILineBreakModeWordWrap 
														fontName:@"Arial" 
														fontSize:14];
		[enemy4NameBox setPosition:ccp(435, 160 + 8)];
		[enemy4NameBox setColor:ccc3(0, 0, 0)];
		[self addChild:enemy4NameBox z:15];
		
		enemy4Timer = [CCProgressTimer progressWithFile:@"enemyLoadBar.png"];
		enemy4Timer.type = kCCProgressTimerTypeHorizontalBarLR;
		enemy4Timer.percentage = [enemy4 getTimerProgress];
		enemy4Timer.position = ccp(430, 160 - 8);
		[self addChild:enemy4Timer z:15];
	}
	
}

-(void)setUpUnitTimers{
	CCLabelTTF * hero1NameBox = [CCLabelTTF labelWithString:[member1 getName]
												 dimensions:CGSizeMake(80, 20) 
												  alignment:UITextAlignmentLeft
											  lineBreakMode:UILineBreakModeWordWrap 
												   fontName:@"Arial" 
												   fontSize:14];
	[hero1NameBox setPosition:ccp(435, 160 + 8 - 42)];
	[hero1NameBox setColor:ccc3(0, 0, 0)];
	[self addChild:hero1NameBox z:15];
	
	CCLabelTTF * hero2NameBox = [CCLabelTTF labelWithString:[member2 getName]
												 dimensions:CGSizeMake(80, 20) 
												  alignment:UITextAlignmentLeft
											  lineBreakMode:UILineBreakModeWordWrap 
												   fontName:@"Arial" 
												   fontSize:14];
	[hero2NameBox setPosition:ccp(435, 160 + 8 - 42*2)];
	[hero2NameBox setColor:ccc3(0, 0, 0)];
	[self addChild:hero2NameBox z:15];
	
	CCLabelTTF * hero3NameBox = [CCLabelTTF labelWithString:[member3 getName]
												 dimensions:CGSizeMake(80, 20) 
												  alignment:UITextAlignmentLeft
											  lineBreakMode:UILineBreakModeWordWrap 
												   fontName:@"Arial" 
												   fontSize:14];
	[hero3NameBox setPosition:ccp(435, 160 + 8 - 42*3)];
	[hero3NameBox setColor:ccc3(0, 0, 0)];
	[self addChild:hero3NameBox z:15];
	
	hero1Timer = [CCProgressTimer progressWithFile:@"playerLoadBar.png"];
	hero1Timer.type = kCCProgressTimerTypeHorizontalBarLR;
	hero1Timer.percentage = [member1 getTimerProgress];
	hero1Timer.position = ccp(430, 160 - 8 - 42);
	[self addChild:hero1Timer z:15];
	
	hero2Timer = [CCProgressTimer progressWithFile:@"playerLoadBar.png"];
	hero2Timer.type = kCCProgressTimerTypeHorizontalBarLR;
	hero2Timer.percentage = [member2 getTimerProgress];
	hero2Timer.position = ccp(430, 160 - 8  - 42*2);
	[self addChild:hero2Timer z:15];
	
	hero3Timer = [CCProgressTimer progressWithFile:@"playerLoadBar.png"];
	hero3Timer.type = kCCProgressTimerTypeHorizontalBarLR;
	hero3Timer.percentage = [member3 getTimerProgress];
	hero3Timer.position = ccp(430, 160 - 8  - 42*3);
	[self addChild:hero3Timer z:15];
}

-(void)setUpUnitsInBattleMenu{
	menuBack1 = [CCSprite spriteWithFile:@"MenuBack2.png"];
	[menuBack1 setPosition:ccp(430, 160)];
	[self addChild:menuBack1 z:14];
	
	CCMenuItemImage * tempEnemy1 = [CCMenuItemImage itemFromNormalImage:@"unitBorder.png" 
														  selectedImage:@"unitBorder.png"
																 target:self
															   selector:@selector(Enemy1Selected)];
	CCMenuItemImage * tempEnemy2 = [CCMenuItemImage itemFromNormalImage:@"unitBorder.png" 
														  selectedImage:@"unitBorder.png"
																 target:self
															   selector:@selector(Enemy2Selected)];
	CCMenuItemImage * tempEnemy3 = [CCMenuItemImage itemFromNormalImage:@"unitBorder.png" 
														  selectedImage:@"unitBorder.png"
																 target:self
															   selector:@selector(Enemy3Selected)];
	CCMenuItemImage * tempEnemy4 = [CCMenuItemImage itemFromNormalImage:@"unitBorder.png" 
														  selectedImage:@"unitBorder.png"
																 target:self
															   selector:@selector(Enemy4Selected)];
	
	CCMenuItemImage * tempPlayer1 = [CCMenuItemImage itemFromNormalImage:@"unitBorder.png" 
														   selectedImage:@"unitBorder.png"
																  target:self
																selector:@selector(Player1Selected)];
	CCMenuItemImage * tempPlayer2 = [CCMenuItemImage itemFromNormalImage:@"unitBorder.png" 
														   selectedImage:@"unitBorder.png"
																  target:self
																selector:@selector(Player2Selected)];
	CCMenuItemImage * tempPlayer3 = [CCMenuItemImage itemFromNormalImage:@"unitBorder.png" 
														   selectedImage:@"unitBorder.png"
																  target:self
																selector:@selector(Player3Selected)];
	
	unitsInBattle = [CCMenu menuWithItems:tempEnemy1, tempEnemy2, tempEnemy3, tempEnemy4, tempPlayer1, tempPlayer2, tempPlayer3, nil];
	[unitsInBattle alignItemsVerticallyWithPadding:2];
	[unitsInBattle setPosition:ccp(430, 160)];
	
	[self addChild:unitsInBattle z:15];
}

-(void)enemyTargetSelect{
	float a = [member1 getCurHealth];
	float b = [member2 getCurHealth];
	float c = [member3 getCurHealth];
	
	float d = a + b + c;
	
	a = (a / d) * 100;
	b = (b / d + a)  * 100;
	c = (c / d + b)  * 100;
	
	int foo = arc4random() % 100 + 1;
	
	if (foo < a) {
		currentlySelectedHero = member1;
	}else if(foo < b){
		currentlySelectedHero = member2;
	}else{
		currentlySelectedHero = member3;
	}
	
}

-(int)calculateDamageTaken{
	
	int damage = ( [enemyTemp getATK] - [currentlySelectedHero getDef] ) * ( [enemyTemp getATK] / [currentlySelectedHero getVit]);
	
	if (damage <= 0) {
		damage = 1;
	}
	return damage;
}

-(void)EnemyAction{
	int action = [enemyTemp getAction];
	[enemyTemp progressActionCounter];
	switch (action) {
		case 0: //command to wait
			NSLog(@"%@ waits...", [enemyTemp getName]);
			break;
		case 1: //command to attack
			[self enemyTargetSelect];
			[self playAttackAnimation:1];
			int damage = [self calculateDamageTaken];
			[currentlySelectedHero takeDamage:damage];
			NSLog(@"%@ attacks %@ for %d damage!", [enemyTemp getName], [currentlySelectedHero getName], damage);
			break;
		default:
			break;
	}
}

-(int)calculateAttackDamage:(int)enemyDef{

	int damage = ( [currentlySelectedHero getAtk] - enemyDef ) * ( [currentlySelectedHero getStr] / enemyDef);
	
	return damage;
}

-(void)playAttackAnimation:(int)animationTag{
	
	switch (animationTag) {
		case 1:
			[[CCSpriteFrameCache sharedSpriteFrameCache] addSpriteFramesWithFile:@"slash.plist"];
			spriteSheet = [CCSpriteBatchNode 
						   batchNodeWithFile:@"slash.png"];
			[self addChild:spriteSheet z:16];
			
			NSMutableArray *attackAnimationFrames = [NSMutableArray array];
			for(int i = 1; i <= 10; ++i) {
				[attackAnimationFrames addObject:[[CCSpriteFrameCache sharedSpriteFrameCache] spriteFrameByName:[NSString stringWithFormat:@"%d.png", i]]];
			}
			
			CCAnimation *attackAnimation = [CCAnimation animationWithFrames:attackAnimationFrames delay:0.1f];
			
			CCSprite* attackAnimationSprite = [CCSprite spriteWithSpriteFrameName:@"1.png"];        
			NSLog(@"current game state is %d", currentGameState);
			if (currentGameState > 9) {
				NSLog(@"attack player");
				attackAnimationSprite.position = [currentlySelectedHero getPosition];
			}else{
				NSLog(@"attack enemy");
				attackAnimationSprite.position = enemyTemp.position;
			}
			CCFiniteTimeAction * playAction = [CCAnimate actionWithAnimation:attackAnimation restoreOriginalFrame:NO];
			CCFiniteTimeAction * cleanupAction = [CCCallFuncND actionWithTarget:self selector:@selector(cleanupSprite:) data:attackAnimationSprite];
			
			[spriteSheet addChild:attackAnimationSprite z:0];
			[attackAnimationSprite runAction:[CCSequence actions:playAction, cleanupAction, nil]];
			break;
		default:
			break;
	}
	
	}

-(void)cleanupSprite:(CCSprite*)inSprite
{
    [spriteSheet removeChild:inSprite cleanup:YES];
	
	unitsInBattle.isTouchEnabled = true;
	
	if ([enemyTemp isDead]) {
		[self removeChild:enemyTemp cleanup:YES];
		enemyTemp = 0;
	}
}

-(void)enemySelected{
	
	if (currentGameState == 2 && enemyTemp != 0) { // attack game state
		int damage = [self calculateAttackDamage:[enemyTemp getDEF]];
		[enemyTemp takeDamage:damage];
		NSLog(@"%@ attacks %@ for %d damage!", [currentlySelectedHero getName], [enemyTemp getName], damage);
		[self playAttackAnimation:1];
		[currentlySelectedHero resetTimer];
		currentlySelectedHero = 0;
		currentGameState = 0;
	}
}

-(void)Enemy1Selected{
	NSLog(@"enemy 1 selected");
	enemyTemp = enemy1;
	[self enemySelected];
}

-(void)Enemy2Selected{
	NSLog(@"enemy 2 selected");
	enemyTemp = enemy2;
	[self enemySelected];
}

-(void)Enemy3Selected{
	NSLog(@"enemy 3 selected");
	enemyTemp = enemy3;
	[self enemySelected];
}

-(void)Enemy4Selected{
	NSLog(@"enemy 4 selected");
	enemyTemp = enemy4;
	[self enemySelected];
}

-(void)PlayerSelected:(int)selectedTag{
	switch (selectedTag) {
		case 1:
			currentlySelectedHero = member1;
			break;
		case 2:
			currentlySelectedHero = member2;
			break;
		case 3:
			currentlySelectedHero = member3;
			break;
		default:
			break;
	}
	if ([currentlySelectedHero heroIsReady]) {
		[self setUpBattleMenu];
		currentGameState = 1;
		unitsInBattle.isTouchEnabled = 0;
	}
}

-(void)Player1Selected{
	NSLog(@"Player 1 selected");
	[self PlayerSelected:1];
}

-(void)Player2Selected{
	NSLog(@"Player 2 selected");
	[self PlayerSelected:2];
}

-(void)Player3Selected{
	NSLog(@"Player 3 selected");
	[self PlayerSelected:3];
}

-(void)setUpBattleMenu{
	menuBack2 = [CCSprite spriteWithFile:@"MenuBack.png"];
	[menuBack2 setPosition:ccp(240, 50)];
	[self addChild:menuBack2 z:16];
	
	CCMenuItemImage * AttackCmd = [CCMenuItemImage itemFromNormalImage:@"BattleMenuAttack.png" 
														 selectedImage:@"BattleMenuPressed.png"
																target:self
															  selector:@selector(BattleMenuAttack)];
	CCMenuItemImage * SkillCmd = [CCMenuItemImage itemFromNormalImage:@"BattleMenuSkill.png" 
														selectedImage:@"BattleMenuPressed.png"
															   target:self
															 selector:@selector(BattleMenuSkill)];
	CCMenuItemImage * ItemCmd = [CCMenuItemImage itemFromNormalImage:@"BattleMenuItem.png" 
													   selectedImage:@"BattleMenuPressed.png"
															  target:self
															selector:@selector(BattleMenuItem)];
	CCMenuItemImage * CancelCmd = [CCMenuItemImage itemFromNormalImage:@"BattleMenuCancel.png" 
														 selectedImage:@"BattleMenuPressed.png"
																target:self
															  selector:@selector(BattleMenuCancel)];
	
	battleCommands = [CCMenu menuWithItems: AttackCmd, SkillCmd, ItemCmd, CancelCmd, nil];
	[battleCommands alignItemsHorizontallyWithPadding:2];
	[battleCommands setPosition:ccp(240, 50)];
	
	[self addChild:battleCommands z:17];
}

-(void)BattleMenuAttack{
	if (currentGameState == 1) {
		NSLog(@"attack selected");
		currentGameState = 2; //attak game state.
		NSLog(@"Select enemy to attack...");
		[self removeChild:battleCommands cleanup:YES];
		[self removeChild:menuBack2 cleanup:YES];
	}
}

-(void)BattleMenuSkill{
	NSLog(@"start to build skill list menu");
	NSMutableArray *menuItems = [currentlySelectedHero getActiveSkills];
	
	// Prepare Menu
	NSLog(@"Declare menu");
	CCMenuAdvanced *menu = [CCMenuAdvanced menuWithItems: nil];
	CCMenuItemLabel * temp;
	NSLog(@"Begin skills loop");
	for (PhysicalActiveSkill *skill in menuItems){
		NSLog(@"Fetch Skill");
		if ([skill getSkillLevel] > 0) {
			NSLog(@"Add Skill");
			temp = [CCMenuItemLabel itemWithLabel: [CCLabelTTF labelWithString:[skill getSkillName] fontName:@"Arial" fontSize:16]
										   target: self
										 selector: @selector(activeSkillPressed:)];
			temp.color = ccc3(0, 0, 0);
			[menu addChild: temp];
		}
	}
	NSLog(@"Finished all skills");
	
	NSLog(@"Set Alignmnet");	
	// Setup Menu Alignment
	[menu alignItemsVerticallyWithPadding: 5 bottomToTop: NO]; //< also sets contentSize and keyBindings on Mac
	menu.isRelativeAnchorPoint = YES;
	
	//menu.anchorPoint = ccp(1, 1);
	menu.position = ccp(200, 160);
	
	//menu.scale = 1;
	
	menu.boundaryRect = CGRectMake(100, 160, 200, 300);
	
	NSLog(@"Fix Position");
	[menu fixPosition];
	
	[self removeChild:battleCommands cleanup:YES];
	[self removeChild:menuBack2 cleanup:YES];
	
	[self addChild:menu];
}

-(void)BattleMenuItem{
	
}

-(void)BattleMenuCancel{
	currentlySelectedHero = 0;
	currentGameState = 0;
	[self removeChild:battleCommands cleanup:YES];
	[self removeChild:menuBack2 cleanup:YES];
	unitsInBattle.isTouchEnabled = true;
}

-(void)activeSkillPressed:(CCMenuItemLabel *)sender{
	
}

@end
