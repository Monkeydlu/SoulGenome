//
//  BattleScene.m
//  Tower Of Heros
//
//  Created by MingYang Lu on 2/21/13.
//  Copyright 2013 Vanderbilt University. All rights reserved.
//

#import "BattleSceneLayer.h"
#import "GameScene.h"


//====================================================//
//====================================================//
//==============Battle Scene Layer====================//
//====================================================//
//====================================================//

@implementation BattleLayer

- (id) initWithLevel:(int)levelNum
				  c1:(PhysicalCharacter*)chara1 
				  c2:(PhysicalCharacter*)chara2 
				  c3:(PhysicalCharacter*)chara3{
	if ((self = [super init])) {
		
		
		member1 = chara1;
		member2 = chara2;
		member3 = chara3;
		
		//======================COLUMN ONE======================//
		int i = arc4random() % 5;
		HexTileArray[0] = [HexTileCCMenuItemImage itemFromNormalImage:@"HexEmpty.png" 
														selectedImage:@"HexEmpty.png"
															   target:self
															 selector:@selector(HexTileTouched:)];
		[HexTileArray[0] setUpHelperWithPosition:11 andColor:i];
		
		i = arc4random() % 5;
		HexTileArray[1] = [HexTileCCMenuItemImage itemFromNormalImage:@"HexEmpty.png" 
														selectedImage:@"HexEmpty.png"
															   target:self
															 selector:@selector(HexTileTouched:)];
		[HexTileArray[1] setUpHelperWithPosition:12 andColor:i];
		
		i = arc4random() % 5;
		HexTileArray[2] = [HexTileCCMenuItemImage itemFromNormalImage:@"HexEmpty.png" 
														selectedImage:@"HexEmpty.png"
															   target:self
															 selector:@selector(HexTileTouched:)];
		[HexTileArray[2] setUpHelperWithPosition:13 andColor:i];
		
		
		//======================COLUMN TWO======================//
		i = arc4random() % 5;
		HexTileArray[3] = [HexTileCCMenuItemImage itemFromNormalImage:@"HexEmpty.png" 
														selectedImage:@"HexEmpty.png"
															   target:self
															 selector:@selector(HexTileTouched:)];
		[HexTileArray[3] setUpHelperWithPosition:21 andColor:i];
		
		i = arc4random() % 5;
		HexTileArray[4] = [HexTileCCMenuItemImage itemFromNormalImage:@"HexEmpty.png" 
														selectedImage:@"HexEmpty.png"
															   target:self
															 selector:@selector(HexTileTouched:)];
		[HexTileArray[4] setUpHelperWithPosition:22 andColor:i];
		
		i = arc4random() % 5;
		HexTileArray[5] = [HexTileCCMenuItemImage itemFromNormalImage:@"HexEmpty.png" 
														selectedImage:@"HexEmpty.png"
															   target:self
															 selector:@selector(HexTileTouched:)];
		[HexTileArray[5] setUpHelperWithPosition:23 andColor:i];
		
		i = arc4random() % 5;
		HexTileArray[6] = [HexTileCCMenuItemImage itemFromNormalImage:@"HexEmpty.png" 
														selectedImage:@"HexEmpty.png"
															   target:self
															 selector:@selector(HexTileTouched:)];
		[HexTileArray[6] setUpHelperWithPosition:24 andColor:i];
		

		//======================COLUMN THREE======================//
		i = arc4random() % 5;
		HexTileArray[7] = [HexTileCCMenuItemImage itemFromNormalImage:@"HexEmpty.png" 
														selectedImage:@"HexEmpty.png"
															   target:self
															 selector:@selector(HexTileTouched:)];
		[HexTileArray[7] setUpHelperWithPosition:31 andColor:i];
		
		i = arc4random() % 5;
		HexTileArray[8] = [HexTileCCMenuItemImage itemFromNormalImage:@"HexEmpty.png" 
														selectedImage:@"HexEmpty.png"
															   target:self
															 selector:@selector(HexTileTouched:)];
		[HexTileArray[8] setUpHelperWithPosition:32 andColor:i];
		
		i = arc4random() % 5;
		HexTileArray[9] = [HexTileCCMenuItemImage itemFromNormalImage:@"HexEmpty.png" 
														selectedImage:@"HexEmpty.png"
															   target:self
															 selector:@selector(HexTileTouched:)];
		[HexTileArray[9] setUpHelperWithPosition:33 andColor:i];
		
		i = arc4random() % 5;
		HexTileArray[10] = [HexTileCCMenuItemImage itemFromNormalImage:@"HexEmpty.png" 
														selectedImage:@"HexEmpty.png"
															   target:self
															 selector:@selector(HexTileTouched:)];
		[HexTileArray[10] setUpHelperWithPosition:34 andColor:i];
		
		i = arc4random() % 5;
		HexTileArray[11] = [HexTileCCMenuItemImage itemFromNormalImage:@"HexEmpty.png" 
														selectedImage:@"HexEmpty.png"
															   target:self
															 selector:@selector(HexTileTouched:)];
		[HexTileArray[11] setUpHelperWithPosition:35 andColor:i];
		
		
		//======================COLUMN FOUR======================//
		i = arc4random() % 5;
		HexTileArray[12] = [HexTileCCMenuItemImage itemFromNormalImage:@"HexEmpty.png" 
														 selectedImage:@"HexEmpty.png"
																target:self
															  selector:@selector(HexTileTouched:)];
		[HexTileArray[12] setUpHelperWithPosition:42 andColor:i];
		
		i = arc4random() % 5;
		HexTileArray[13] = [HexTileCCMenuItemImage itemFromNormalImage:@"HexEmpty.png" 
														 selectedImage:@"HexEmpty.png"
																target:self
															  selector:@selector(HexTileTouched:)];
		[HexTileArray[13] setUpHelperWithPosition:43 andColor:i];
		
		i = arc4random() % 5;
		HexTileArray[14] = [HexTileCCMenuItemImage itemFromNormalImage:@"HexEmpty.png" 
														 selectedImage:@"HexEmpty.png"
																target:self
															  selector:@selector(HexTileTouched:)];
		[HexTileArray[14] setUpHelperWithPosition:44 andColor:i];
		
		i = arc4random() % 5;
		HexTileArray[15] = [HexTileCCMenuItemImage itemFromNormalImage:@"HexEmpty.png" 
														 selectedImage:@"HexEmpty.png"
																target:self
															  selector:@selector(HexTileTouched:)];
		[HexTileArray[15] setUpHelperWithPosition:45 andColor:i];
		
		
		//======================COLUMN FIVE======================//
		i = arc4random() % 5;
		HexTileArray[16] = [HexTileCCMenuItemImage itemFromNormalImage:@"HexEmpty.png" 
														 selectedImage:@"HexEmpty.png"
																target:self
															  selector:@selector(HexTileTouched:)];
		[HexTileArray[16] setUpHelperWithPosition:53 andColor:i];
		
		i = arc4random() % 5;
		HexTileArray[17] = [HexTileCCMenuItemImage itemFromNormalImage:@"HexEmpty.png" 
														 selectedImage:@"HexEmpty.png"
																target:self
															  selector:@selector(HexTileTouched:)];
		[HexTileArray[17] setUpHelperWithPosition:54 andColor:i];
		
		i = arc4random() % 5;
		HexTileArray[18] = [HexTileCCMenuItemImage itemFromNormalImage:@"HexEmpty.png" 
														 selectedImage:@"HexEmpty.png"
																target:self
															  selector:@selector(HexTileTouched:)];
		[HexTileArray[18] setUpHelperWithPosition:55 andColor:i];
		
		//========================================================//
		
		
		Column1 = [CCMenu menuWithItems:HexTileArray[0], HexTileArray[1], HexTileArray[2], nil];
		[Column1 alignItemsVerticallyWithPadding:2];
		[Column1 setPosition:ccp(150, 160)];
		
		Column2 = [CCMenu menuWithItems:HexTileArray[3], HexTileArray[4], HexTileArray[5], HexTileArray[6], nil];
		[Column2 alignItemsVerticallyWithPadding:2];
		[Column2 setPosition:ccp(196, 160)];
		
		Column3 = [CCMenu menuWithItems:HexTileArray[7], HexTileArray[8], HexTileArray[9], HexTileArray[10], HexTileArray[11], nil];
		[Column3 alignItemsVerticallyWithPadding:2];
		[Column3 setPosition:ccp(242, 160)];
	
		Column4 = [CCMenu menuWithItems:HexTileArray[12], HexTileArray[13], HexTileArray[14], HexTileArray[15], nil];
		[Column4 alignItemsVerticallyWithPadding:2];
		[Column4 setPosition:ccp(288, 160)];
		
		Column5 = [CCMenu menuWithItems:HexTileArray[16], HexTileArray[17], HexTileArray[18], nil];
		[Column5 alignItemsVerticallyWithPadding:2];
		[Column5 setPosition:ccp(334, 160)];
		
		backGround = [CCSprite spriteWithFile:@"Floor1BG.png"];
		[backGround setPosition:ccp(243, 160)];
		[self addChild:backGround z:0];
		
		[self addChild:Column1 z:10];
		[self addChild:Column2 z:11];
		[self addChild:Column3 z:12];
		[self addChild:Column4 z:11];
		[self addChild:Column5 z:10];
		
		
		hero1 = [[PhysicalHeroDummy alloc] initWithCharacter:member1 andPos:24];
		hero2 = [[PhysicalHeroDummy alloc] initWithCharacter:member2 andPos:35];
		hero3 = [[PhysicalHeroDummy alloc] initWithCharacter:member3 andPos:45];
		
		[self addChild:hero1 z: 15];
		[self addChild:hero2 z: 15];
		[self addChild:hero3 z: 15];
		
		[self setUpEnemies];
		[self setUpUnitsInBattleMenu];
		[self setUpUnitTimers];
		
		currentGameState = 0;
		currentlySelectedHero = 0;
		
		[self schedule:@selector(updateTimer:) interval:0.1];
	}
    return self;
}


-(void)setUpEnemies{
	enemy1 = [[PhysicalEnemyDummy alloc]initWithTag:0 andPos:21];
	enemy2 = [[PhysicalEnemyDummy alloc]initWithTag:0 andPos:31];
	enemy3 = [[PhysicalEnemyDummy alloc]initWithTag:0 andPos:42];
	enemy4 = [[PhysicalEnemyDummy alloc]initWithTag:0 andPos:32];
	[self addChild:enemy1 z:15];
	[self addChild:enemy2 z:15];
	[self addChild:enemy3 z:15];
	[self addChild:enemy4 z:15];
}

-(void)updateTimer:(ccTime)dt{
	
	if (currentGameState == 0) {
		[hero1 updateTimer];
		[hero2 updateTimer];
		[hero3 updateTimer];
		
		[hero1Timer setPercentage:[hero1 getTimerProgress] * 100];
		[hero2Timer setPercentage:[hero2 getTimerProgress] * 100];
		[hero3Timer setPercentage:[hero3 getTimerProgress] * 100];
		
		if (enemy1 != 0) {
			[enemy1 updateTimer];
		}
		if (enemy2 != 0) {
			[enemy2 updateTimer];
		}
		if (enemy3 != 0) {
			[enemy3 updateTimer];
		}
		if (enemy4 != 0) {
			[enemy4 updateTimer];
		}
	}
	
}

-(void)setUpUnitTimers{
	CCLabelTTF * hero1NameBox = [CCLabelTTF labelWithString:[member1 getName]
												 dimensions:CGSizeMake(80, 20) 
												  alignment:UITextAlignmentLeft
											  lineBreakMode:UILineBreakModeWordWrap 
												   fontName:@"Arial" 
												   fontSize:14];
	[hero1NameBox setPosition:ccp(435, 160 - 40)];
	[hero1NameBox setColor:ccc3(0, 0, 0)];
	[self addChild:hero1NameBox z:15];
	
	CCLabelTTF * hero2NameBox = [CCLabelTTF labelWithString:[member2 getName]
												 dimensions:CGSizeMake(80, 20) 
												  alignment:UITextAlignmentLeft
											  lineBreakMode:UILineBreakModeWordWrap 
												   fontName:@"Arial" 
												   fontSize:14];
	[hero2NameBox setPosition:ccp(435, 160 - 40 - 45)];
	[hero2NameBox setColor:ccc3(0, 0, 0)];
	[self addChild:hero2NameBox z:15];
	
	CCLabelTTF * hero3NameBox = [CCLabelTTF labelWithString:[member3 getName]
												 dimensions:CGSizeMake(80, 20) 
												  alignment:UITextAlignmentLeft
											  lineBreakMode:UILineBreakModeWordWrap 
												   fontName:@"Arial" 
												   fontSize:14];
	[hero3NameBox setPosition:ccp(435, 160 - 40 - 90)];
	[hero3NameBox setColor:ccc3(0, 0, 0)];
	[self addChild:hero3NameBox z:15];
	
	hero1Timer = [CCProgressTimer progressWithFile:@"playerLoadBar.png"];
	hero1Timer.type = kCCProgressTimerTypeHorizontalBarLR;
	hero1Timer.percentage = [hero1 getTimerProgress];
	hero1Timer.position = ccp(430, 160 - 45);
	[self addChild:hero1Timer z:15];
	
	hero2Timer = [CCProgressTimer progressWithFile:@"playerLoadBar.png"];
	hero2Timer.type = kCCProgressTimerTypeHorizontalBarLR;
	hero2Timer.percentage = [hero2 getTimerProgress];
	hero2Timer.position = ccp(430, 160 - 90);
	[self addChild:hero2Timer z:15];
	
	hero3Timer = [CCProgressTimer progressWithFile:@"playerLoadBar.png"];
	hero3Timer.type = kCCProgressTimerTypeHorizontalBarLR;
	hero3Timer.percentage = [hero3 getTimerProgress];
	hero3Timer.position = ccp(430, 160 - 135);
	[self addChild:hero3Timer z:15];
}

-(void)setUpUnitsInBattleMenu{
	menuBack1 = [CCSprite spriteWithFile:@"MenuBack.png"];
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

-(void)Enemy1Selected{
	NSLog(@"enemy 1 selected");
}

-(void)Enemy2Selected{
	NSLog(@"enemy 2 selected");
}

-(void)Enemy3Selected{
	NSLog(@"enemy 3 selected");
}

-(void)Enemy4Selected{
	NSLog(@"enemy 4 selected");
}

-(void)Player1Selected{
	NSLog(@"Player 1 selected");
	if ([hero1 heroIsReady]) {
		[self setUpBattleMenu];
		currentGameState = 1;	//set game state to command menu
		currentlySelectedHero = 1;
		unitsInBattle.isTouchEnabled = 0;
	}
}

-(void)Player2Selected{
	NSLog(@"Player 2 selected");
	if ([hero2 heroIsReady]) {
		[self setUpBattleMenu];
		currentGameState = 1;	//set game state to command menu
		currentlySelectedHero = 2;
		unitsInBattle.isTouchEnabled = 0;
	}
}

-(void)Player3Selected{
	NSLog(@"Player 3 selected");
	if ([hero3 heroIsReady]) {
		[self setUpBattleMenu];
		currentGameState = 1;	//set game state to command menu
		currentlySelectedHero = 3;
		unitsInBattle.isTouchEnabled = 0;
	}
}

-(void)setUpBattleMenu{
	menuBack2 = [CCSprite spriteWithFile:@"MenuBack.png"];
	[menuBack2 setPosition:ccp(430, 160)];
	[self addChild:menuBack2 z:16];
	
	CCMenuItemImage * MoveCmd = [CCMenuItemImage itemFromNormalImage:@"BattleMenuMove.png" 
													   selectedImage:@"BattleMenuPressed.png"
															  target:self
															selector:@selector(BattleMenuMove)];
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
	
	battleCommands = [CCMenu menuWithItems: MoveCmd, AttackCmd, SkillCmd, ItemCmd, CancelCmd, nil];
	[battleCommands alignItemsVerticallyWithPadding:2];
	[battleCommands setPosition:ccp(430, 160)];
	
	[self addChild:battleCommands z:17];
}

-(int)convertIndexToPosition:(int)tempIndex{
	switch (tempIndex) {
		case 0:
			return 11;
			break;
		case 1:
			return 12;
			break;
		case 2:
			return 13;
			break;
		case 3:
			return 21;
			break;
		case 4:
			return 22;
			break;
		case 5:
			return 23;
			break;
		case 6:
			return 24;
			break;
		case 7:
			return 31;
			break;
		case 8:
			return 32;
			break;
		case 9:
			return 33;
			break;
		case 10:
			return 34;
			break;
		case 11:
			return 35;
			break;
		case 12:
			return 42;
			break;
		case 13:
			return 43;
			break;
		case 14:
			return 44;
			break;
		case 15:
			return 45;
			break;
		case 16:
			return 53;
			break;
		case 17:
			return 54;
			break;
		case 18:
			return 55;
			break;
		default:
			return -1;
			break;
	}
}

-(int)convertPositionToIndex:(int)tempPosition{
	switch (tempPosition) {
		case 11:
			return 0;
			break;
		case 12:
			return 1;
			break;
		case 13:
			return 2;
			break;
		case 21:
			return 3;
			break;
		case 22:
			return 4;
			break;
		case 23:
			return 5;
			break;
		case 24:
			return 6;
			break;
		case 31:
			return 7;
			break;
		case 32:
			return 8;
			break;
		case 33:
			return 9;
			break;
		case 34:
			return 10;
			break;
		case 35:
			return 11;
			break;
		case 42:
			return 12;
			break;
		case 43:
			return 13;
			break;
		case 44:
			return 14;
			break;
		case 45:
			return 15;
			break;
		case 53:
			return 16;
			break;
		case 54:
			return 17;
			break;
		case 55:
			return 18;
			break;
		default:
			return -1;
			break;
	}
}

-(bool)checkIsTileOpen:(int)tileNum{
	if ([self convertPositionToIndex:tileNum] == -1) {
		return false;
	}
	if ([hero1 getPosition] == tileNum || [hero2 getPosition] == tileNum || [hero3 getPosition] == tileNum) {
		return false;
	}
	if ((enemy1 != 0 && [enemy1 getPosition] == tileNum) || (enemy2 != 0 && [enemy2 getPosition] == tileNum) || (enemy3 != 0 && [enemy3 getPosition] == tileNum) || (enemy4 != 0 && [enemy4 getPosition] == tileNum)) {
		return false;
	}
	return true;
}

-(void)highlightOpenNeighbors:(int)tileNum{
	if ([self checkIsTileOpen:tileNum - 1]) {
		NSLog(@"highlighting %d", tileNum - 1);
		int foo = [self convertPositionToIndex:tileNum - 1];
		[HexTileArray[foo] highLightTile];
	}
	if ([self checkIsTileOpen:tileNum + 1]) {
		NSLog(@"highlighting %d", tileNum + 1);
		int foo = [self convertPositionToIndex:tileNum + 1];
		[HexTileArray[foo] highLightTile];
	}
	if ([self checkIsTileOpen:tileNum + 10]) {
		NSLog(@"highlighting %d", tileNum + 10);
		int foo = [self convertPositionToIndex:tileNum + 10];
		[HexTileArray[foo] highLightTile];
	}
	if ([self checkIsTileOpen:tileNum + 11]) {
		NSLog(@"highlighting %d", tileNum + 11);
		int foo = [self convertPositionToIndex:tileNum + 11];
		[HexTileArray[foo] highLightTile];
	}
	if ([self checkIsTileOpen:tileNum - 10]) {
		NSLog(@"highlighting %d", tileNum - 10);
		int foo = [self convertPositionToIndex:tileNum - 10];
		[HexTileArray[foo] highLightTile];
	}
	if ([self checkIsTileOpen:tileNum - 11]) {
		NSLog(@"highlighting %d", tileNum - 11);
		int foo = [self convertPositionToIndex:tileNum - 11];
		[HexTileArray[foo] highLightTile];
	}
}

-(void)unHighlightTiles{
	for (int i = 0; i < 19; i++) {
		if ([HexTileArray[i] isTileHighlighted]) {
			[HexTileArray[i] unHighLightTile];
		}
	}
}

-(void)BattleMenuMove{
	if (currentGameState == 1 ) { // game state is in command menu
		int currentLocation;
		switch (currentlySelectedHero) {
			case 1:
				NSLog(@"Hero1's position is %d", [hero1 getPosition]);
				currentLocation = [hero1 getPosition];
				break;
			case 2:
				currentLocation = [hero2 getPosition];
				break;
			case 3:
				currentLocation = [hero3 getPosition];
				break;
			default:
				NSLog(@"hero selected out of range");
				break;
		}
		[self highlightOpenNeighbors:currentLocation];
		currentGameState = 2; //game state is in move command
	}
	
	
}

-(void)BattleMenuAttack{
	
}

-(void)BattleMenuSkill{
	
}

-(void)BattleMenuItem{
	
}

-(void)BattleMenuCancel{
	currentlySelectedHero = 0;
	currentGameState = 0;
	[self removeChild:battleCommands cleanup:YES];
	[self removeChild:menuBack2 cleanup:YES];
	unitsInBattle.isTouchEnabled = true;
	[self unHighlightTiles];
}

-(void)HexTileTouched:(HexTileCCMenuItemImage *)sender{
	int temp = sender.myPosition;
	NSLog(@"hex %d touched, gameState: %d", sender.myPosition, currentGameState);
	
	if (currentGameState == 0) {
		if ([sender getPosition] == [hero1 getPosition]) {
			[self Player1Selected];
		}
		if ([sender getPosition] == [hero2 getPosition]) {
			[self Player2Selected];
		}
		if ([sender getPosition] == [hero3 getPosition]) {
			[self Player3Selected];
		}
	}
	
	if (currentGameState == 2) { //game state is in move command
		if ([sender isHighlighted]) {
			NSLog(@"current hero: %d", currentlySelectedHero);
			switch (currentlySelectedHero) {
				case 1:
					[hero1 updatePosition:temp];
					[hero1 resetTimer];
					break;
				case 2:
					[hero2 updatePosition:temp];
					[hero2 resetTimer];
					break;
				case 3:
					[hero3 updatePosition:temp];
					[hero3 resetTimer];
					break;
				default:
					break;
			}
			currentlySelectedHero = 0;
			currentGameState = 0;
			[self removeChild:battleCommands cleanup:YES];
			[self removeChild:menuBack2 cleanup:YES];
			unitsInBattle.isTouchEnabled = true;
			[self unHighlightTiles];
		}
	}
}


@end