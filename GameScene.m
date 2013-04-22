//
//  BattleScene.m
//  Tower Of Heros
//
//  Created by MingYang Lu on 1/18/13.
//  Copyright (c) 2013 Vanderbilt University. All rights reserved.
//

#import "GameScene.h"
#import "someToolsClass.h"
#import "BattleSceneLayer.h"

//====================================================//
//====================================================//
//====================GAME SCENE======================//
//====================================================//
//====================================================//

@implementation GameScene
@synthesize myBaseLayer = myBaseLayer;
@synthesize myBattleLayer = myBattleLayer;
@synthesize myMapLayer = myMapLayer;
@synthesize myCharacterInfoLayer = myCharacterInfoLayer;
@synthesize char1 = char1;
@synthesize char2 = char2;
@synthesize char3 = char3;

- (id) initGameWithc1:(PhysicalCharacter*)chara1 
			   c2:(PhysicalCharacter*)chara2 
			   c3:(PhysicalCharacter*)chara3{
	if ((self = [super init])) {
		
		char1 = chara1;
		char2 = chara2;
		char3 = chara3;
		
		NSLog(@"Starting game scene init");
		Bg = [CCSprite spriteWithFile:@"WhiteBg.png"];
        [Bg setPosition:ccp(240, 160)];
        [self addChild:Bg z:0];
		NSLog(@"calling BaseHugLayer creation");
		myBaseLayer = [[BaseHudLayer alloc] initWithc1:char1 c2:char2 c3:char3];
        [self addChild:myBaseLayer z:1];
		myMapLayer = [[MapLayer alloc] initWithLevel:1 andTreasures:0 c1:char1 c2:char2 c3:char3];
        [self addChild:myMapLayer z:1];
    }
    return self;
}

-(void)enableMap{
	myMapLayer.mapRow1.isTouchEnabled = YES;
	myMapLayer.mapRow2.isTouchEnabled = YES;
	myMapLayer.mapRow3.isTouchEnabled = YES;
	myMapLayer.mapRow4.isTouchEnabled = YES;
}

-(void)createNewMap:(int)level{
	[self removeChild:myMapLayer cleanup:YES];
	myMapLayer = [[MapLayer alloc] initWithLevel:level andTreasures:0 c1:char1 c2:char2 c3:char3];
	[self addChild:myMapLayer z:1];
}

-(void)updateHuds{
	[myBaseLayer updateHuds];
}

-(void)openCharacterInfoWindow:(int)characterPosition{
	switch (characterPosition) {
		case 1:
			tempChar = char1;
			break;
		case 2:
			tempChar = char2;
			break;
		case 3:
			tempChar = char3;
			break;
		default:
			break;
	}

	myCharacterInfoLayer = [[CharacterInfoLayer alloc] initWithCharacter:tempChar];
	[self addChild:myCharacterInfoLayer z:20];
	myMapLayer.mapRow1.isTouchEnabled = NO;
	myMapLayer.mapRow2.isTouchEnabled = NO;
	myMapLayer.mapRow3.isTouchEnabled = NO;
	myMapLayer.mapRow4.isTouchEnabled = NO;
}

@end

//====================================================//
//====================================================//
//===================BASE HUD LAYER===================//
//====================================================//
//====================================================//

@implementation BaseHudLayer
@synthesize CharacterHud = CharacterHud;
@synthesize Character1InfoBox = Character1InfoBox;
@synthesize Character2InfoBox = Character2InfoBox;
@synthesize Character3InfoBox = Character3InfoBox;
@synthesize strokeBox1 = strokeBox1;
@synthesize strokeBox2 = strokeBox2;
@synthesize strokeBox3 = strokeBox3;
@synthesize Character1Portrait = Character1Portrait;
@synthesize Character2Portrait = Character2Portrait;
@synthesize Character3Portrait = Character3Portrait;

- (id) initWithc1:(PhysicalCharacter*)char1temp
			   c2:(PhysicalCharacter*)char2temp
			   c3:(PhysicalCharacter*)char3temp{
	
	if ((self = [super init])) {
		
		char1 = char1temp;
		char2 = char2temp;
		char3 = char3temp;
		
		NSLog(@"Starting base hud layer init");
		CCMenuItemImage * Character1Disp = [CCMenuItemImage itemFromNormalImage:@"PortraitBorder.png" 
																	selectedImage:@"PortraitBorder.png"
																		   target:self
																		 selector:@selector(Character1Selected)];
		
		CCMenuItemImage * Character2Disp = [CCMenuItemImage itemFromNormalImage:@"PortraitBorder.png" 
																	selectedImage:@"PortraitBorder.png"
																		   target:self
																		 selector:@selector(Character2Selected)];
		
		CCMenuItemImage * Character3Disp = [CCMenuItemImage itemFromNormalImage:@"PortraitBorder.png" 
																	selectedImage:@"PortraitBorder.png"
																		   target:self
																		 selector:@selector(Character3Selected)];
		
		CharacterHud = [CCMenu menuWithItems:Character1Disp, Character2Disp, Character3Disp, nil];
		[CharacterHud alignItemsVerticallyWithPadding:5];
		[CharacterHud setPosition:ccp(50, 160)];
		
		[self addChild:CharacterHud z:5];
		
		Character1Portrait = [char1 getCharacterBustSquare];
		Character2Portrait = [char2 getCharacterBustSquare];
		Character3Portrait = [char3 getCharacterBustSquare];
		
		[Character1Portrait setPosition:ccp(50, 265)];
		[Character2Portrait setPosition:ccp(50, 160)];
		[Character3Portrait setPosition:ccp(50, 55)];
		NSLog(@"add portraits");
		[self addChild:Character1Portrait z:2];
		[self addChild:Character2Portrait z:2];
		[self addChild:Character3Portrait z:2];
		
		Character1InfoBox = [CCLabelTTF labelWithString:[char1 getHudInfo]
											 dimensions:CGSizeMake(100, 100) 
											  alignment:UITextAlignmentLeft
										  lineBreakMode:UILineBreakModeWordWrap 
											   fontName:@"Arial" 
											   fontSize:16];
		
		Character2InfoBox = [CCLabelTTF labelWithString:[char2 getHudInfo]
											 dimensions:CGSizeMake(100, 100) 
											  alignment:UITextAlignmentLeft 
										  lineBreakMode:UILineBreakModeWordWrap 
											   fontName:@"Arial" 
											   fontSize:16];
		
		Character3InfoBox = [CCLabelTTF labelWithString:[char3 getHudInfo]
											 dimensions:CGSizeMake(100, 100) 
											  alignment:UITextAlignmentLeft 
										  lineBreakMode:UILineBreakModeWordWrap 
											   fontName:@"Arial" 
											   fontSize:16];
		
		
		Character1InfoBox.color = ccc3(255, 255, 255);
		Character2InfoBox.color = ccc3(255, 255, 255);
		Character3InfoBox.color = ccc3(255, 255, 255);
		
		[Character1InfoBox setPosition: ccp(50, 265)];
		[Character2InfoBox setPosition: ccp(50, 160)];
		[Character3InfoBox setPosition: ccp(50, 55)];
		
		strokeBox1 = [someToolsClass createStroke:Character1InfoBox  size:1  color:ccBLACK];
		strokeBox2 = [someToolsClass createStroke:Character2InfoBox  size:1  color:ccBLACK];
		strokeBox3 = [someToolsClass createStroke:Character3InfoBox  size:1  color:ccBLACK];
		NSLog(@"add strokes");
		[self addChild:strokeBox1 z:3];
		[self addChild:strokeBox2 z:3];
		[self addChild:strokeBox3 z:3];
		
		[self addChild:Character1InfoBox z:4];
		[self addChild:Character2InfoBox z:4];
		[self addChild:Character3InfoBox z:4];
		
		
	}
    return self;
}


-(void)Character1Selected{
	NSLog(@"Character 1 Selected");
	GameScene * myParent = (GameScene *)[self parent];
	[myParent openCharacterInfoWindow:1];
}

-(void)Character2Selected{
	NSLog(@"Character 2 Selected");
	GameScene * myParent = (GameScene *)[self parent];
	[myParent openCharacterInfoWindow:2];
}

-(void)Character3Selected{
	NSLog(@"Character 3 Selected");
	GameScene * myParent = (GameScene *)[self parent];
	[myParent openCharacterInfoWindow:3];
}

-(void)turnOffHud{
	CharacterHud.isTouchEnabled = false;
}

-(void)turnOnHud{
	CharacterHud.isTouchEnabled = true;
}

-(void)updateHuds{
	[Character1InfoBox setString:[char1 getHudInfo]];
	[Character2InfoBox setString:[char2 getHudInfo]];
	[Character3InfoBox setString:[char3 getHudInfo]];
	[self removeChild:strokeBox1 cleanup:YES];
	[self removeChild:strokeBox2 cleanup:YES];
	[self removeChild:strokeBox3 cleanup:YES];
	strokeBox1 = [someToolsClass createStroke:Character1InfoBox  size:1  color:ccBLACK];
	strokeBox2 = [someToolsClass createStroke:Character2InfoBox  size:1  color:ccBLACK];
	strokeBox3 = [someToolsClass createStroke:Character3InfoBox  size:1  color:ccBLACK];
	[self addChild:strokeBox1 z:3];
	[self addChild:strokeBox2 z:3];
	[self addChild:strokeBox3 z:3];
}

@end


//====================================================//
//====================================================//
//====================MAP LAYER=======================//
//====================================================//
//====================================================//

@implementation MapLayer

@synthesize mapRow1;
@synthesize mapRow2;
@synthesize mapRow3;
@synthesize mapRow4;

- (id) initWithLevel:(int)level 
		andTreasures:(NSMutableArray*)treasures
				  c1:(PhysicalCharacter*)chara1 
				  c2:(PhysicalCharacter*)chara2 
				  c3:(PhysicalCharacter*)chara3{
	if ((self = [super init])) {
		floorLevel = level;
		char1 = chara1;
		char2 = chara2;
		char3 = chara3;
		[self addMap];
	}
    return self;
}

-(void)roomSelected:(PhysicalRoom *)sender{
	if ([sender getRoomType] != -1) {
		NSLog(@"room %d selected", [sender getRoomNumber]);
		int temp = [sender getRoomType];
		NSLog(@"*room type of %d", temp);
		if ([sender getRoomState] == 2) {
			[self activateRoomNum:[sender getRoomNumber]];
		}else if ([sender getRoomState] == 3){
			[self reactivateRoomType:[sender getRoomType]];
		}
	}
}

- (void) addMap{

	int missingNo1 = arc4random() % 2 + ((arc4random() % 2) * 4);
	int missingNo2 = arc4random() % 2 + 2 + ((arc4random() % 2) * 4);
	int missingNo3 = arc4random() % 2 + 8 + ((arc4random() % 2) * 4);
	int missingNo4 = arc4random() % 2 + 10 + ((arc4random() % 2) * 4);
	
	if (missingNo1 == 1) {
		missingNo1 = 5;
	}
	if (missingNo2 == 7) {
		missingNo2 = 6;
	}
	if (missingNo3 == 8) {
		missingNo3 = 9;
	}
	if (missingNo4 == 14) {
		missingNo4 = 10;
	}
	
	monsterNo1 = arc4random() % 16;
	while (monsterNo1 == missingNo1 || monsterNo1 == missingNo2 || monsterNo1 == missingNo3 || monsterNo1 == missingNo4) {
		monsterNo1 = arc4random() % 16;
	}
	monsterNo2 = arc4random() % 16;
	while (monsterNo2 == missingNo1 || monsterNo2 == missingNo2 || monsterNo2 == missingNo3 || monsterNo2 == missingNo4 || monsterNo2 == monsterNo1) {
		monsterNo2 = arc4random() % 16;
	}
	monsterNo3= arc4random() % 16;
	while (monsterNo3 == missingNo1 || monsterNo3 == missingNo2 || monsterNo3 == missingNo3 || monsterNo3 == missingNo4 || monsterNo3 == monsterNo1 || monsterNo3 == monsterNo2) {
		monsterNo3 = arc4random() % 16;
	}
	boss = arc4random() % 16;
	while (boss == missingNo1 || boss == missingNo2 || boss == missingNo3 || boss == missingNo4 || boss == monsterNo1 || boss == monsterNo2 || boss == monsterNo3) {
		boss = arc4random() % 16;
	}
	
	int startingRoom = arc4random() % 16;
	
	while (startingRoom == missingNo1 || startingRoom == missingNo2 ||startingRoom == missingNo3 ||startingRoom == missingNo4 || startingRoom == monsterNo1 || startingRoom == monsterNo2 ||startingRoom == monsterNo3 ||startingRoom == boss) {
		startingRoom = arc4random() % 16;
	}
	
	//room types: 0[Start] 1[Monster] 2[Boss] 3[Empty] 4[Treasure]
	//			  5[Hidden Treasure] 6[Puzzel] 7[Requirement]
	//			  8[Trap] 9[Heal] 10[Alter] 11[Shop]
	
	NSMutableArray * roomsForFloor = [NSMutableArray arrayWithObjects:
									  [NSNumber numberWithInt:3],[NSNumber numberWithInt:4],[NSNumber numberWithInt:5],
									  [NSNumber numberWithInt:6],[NSNumber numberWithInt:7],[NSNumber numberWithInt:8],
									  [NSNumber numberWithInt:9],[NSNumber numberWithInt:10],[NSNumber numberWithInt:11],
									  [NSNumber numberWithInt:3],[NSNumber numberWithInt:4],[NSNumber numberWithInt:5],
									  [NSNumber numberWithInt:6],[NSNumber numberWithInt:7],[NSNumber numberWithInt:8],
									  [NSNumber numberWithInt:9],[NSNumber numberWithInt:10],[NSNumber numberWithInt:11],
									  [NSNumber numberWithInt:3],[NSNumber numberWithInt:4],[NSNumber numberWithInt:5],
									  [NSNumber numberWithInt:6],[NSNumber numberWithInt:7],[NSNumber numberWithInt:8],
									  [NSNumber numberWithInt:9],[NSNumber numberWithInt:10],[NSNumber numberWithInt:11],
									  nil];
	
	int count = [roomsForFloor count];
	
	for (int i = 1; i < count; ++i) {
		int j = arc4random() % i;
		[roomsForFloor exchangeObjectAtIndex:j withObjectAtIndex:i];
	}
	
	for (int i = 0; i < 16; i++) {
		PhysicalRoomArray[i] = [PhysicalRoom itemFromNormalImage:@"BlankRoom.png"
													selectedImage:@"BlankRoom.png"
															target:self
														selector:@selector(roomSelected:)];
	}
	
	for (int i = 0; i < 16; i++) {
		NSLog(@"%dth room", i);
		int temp = i%4;
		temp = temp + 10 + (10 * ((i)/4));
		
		if (i == missingNo1 || i == missingNo2 || i == missingNo3 || i == missingNo4) {
			NSLog(@"%d Not added", temp);
			[PhysicalRoomArray[i] setUpHelperWithWithType:[NSNumber numberWithInt:-1] andRoomNumber:i];
		}else if(i == monsterNo1 || i == monsterNo2 || i == monsterNo3){
			[PhysicalRoomArray[i] setUpHelperWithWithType:[NSNumber numberWithInt:1] andRoomNumber:i];
			NSLog(@"%d Added, monster room", temp);
		}else if(i == boss){
			[PhysicalRoomArray[i] setUpHelperWithWithType:[NSNumber numberWithInt:2] andRoomNumber:i];
			NSLog(@"%d Added, boss room", temp);
		}else if(i == startingRoom){
			[PhysicalRoomArray[i] setUpHelperWithWithType:[NSNumber numberWithInt:0] andRoomNumber:i];
			NSLog(@"%d Added, starting room", temp);
		}else{
			[PhysicalRoomArray[i] setUpHelperWithWithType:[roomsForFloor objectAtIndex:i] andRoomNumber:i];
			NSLog(@"%d Added, %d type room", temp, [[roomsForFloor objectAtIndex:i] intValue]);
		}
	}
	
	
	
	mapRow1 = [CCMenu menuWithItems:PhysicalRoomArray[0],PhysicalRoomArray[1],PhysicalRoomArray[2],PhysicalRoomArray[3], nil];
	mapRow2 = [CCMenu menuWithItems:PhysicalRoomArray[4],PhysicalRoomArray[5],PhysicalRoomArray[6],PhysicalRoomArray[7], nil];
	mapRow3 = [CCMenu menuWithItems:PhysicalRoomArray[8],PhysicalRoomArray[9],PhysicalRoomArray[10],PhysicalRoomArray[11], nil];
	mapRow4 = [CCMenu menuWithItems:PhysicalRoomArray[12],PhysicalRoomArray[13],PhysicalRoomArray[14],PhysicalRoomArray[15], nil];
	
	int pad = 10;
	
	[mapRow1 alignItemsHorizontallyWithPadding:pad];
	[mapRow2 alignItemsHorizontallyWithPadding:pad];
	[mapRow3 alignItemsHorizontallyWithPadding:pad];
	[mapRow4 alignItemsHorizontallyWithPadding:pad];
	
	[mapRow1 setPosition:ccp(245, 250)];
	[mapRow2 setPosition:ccp(245, 200 - pad)];
	[mapRow3 setPosition:ccp(245, 150 - 2*pad)];
	[mapRow4 setPosition:ccp(245, 100 - 3*pad)];
	
	[self addChild:mapRow1 z:11];
	[self addChild:mapRow2 z:11];
	[self addChild:mapRow3 z:11];
	[self addChild:mapRow4 z:11];
	
	
	[self activateRoomNum:startingRoom];
	
}

-(void)reactivateRoomType:(int)typeNum{
	switch (typeNum) {
		case 0:
			NSLog(@"reactivating room type %d", typeNum);
			break;
		case 1:
			NSLog(@"reactivating room type %d", typeNum);
			break;
		case 2:
			NSLog(@"reactivating room type %d", typeNum);
			GameScene * myParent = (GameScene *)[self parent];
			[myParent createNewMap:floorLevel + 1];
			break;
		default:
			break;
	}
}

-(void)activateRoomType:(int)typeNum{
	
	GameScene * myParent = (GameScene *)[self parent];
	
	switch (typeNum) {
		case 0:
			NSLog(@"room type %d activated", typeNum);
			//Starting point.
			break;
		case 1:
			NSLog(@"room type %d activated", typeNum);
			NSLog(@"MONSTER ROOM");
			//Monster room fight.
			myParent.myBattleLayer = [[BattleLayer alloc] initWithLevel:1
																	 c1:char1
																	 c2:char2 
																	 c3:char3];
			[myParent addChild:myParent.myBattleLayer z:9];
			mapRow1.isTouchEnabled = NO;
			mapRow2.isTouchEnabled = NO;
			mapRow3.isTouchEnabled = NO;
			mapRow4.isTouchEnabled = NO;
			[myParent.myBaseLayer turnOffHud];
			break;
		case 2:
			NSLog(@"room type %d activated", typeNum);
			NSLog(@"BOSS ROOM");
			myParent.myBattleLayer = [[BattleLayer alloc] initWithLevel:2
																	 c1:char1
																	 c2:char2
																	 c3:char3];
			[myParent addChild:myParent.myBattleLayer z:9];
			mapRow1.isTouchEnabled = NO;
			mapRow2.isTouchEnabled = NO;
			mapRow3.isTouchEnabled = NO;
			mapRow4.isTouchEnabled = NO;
			[myParent.myBaseLayer turnOffHud];
			break;
		case 3:
			NSLog(@"room type %d activated", typeNum);
			//empty room.
			break;
		case 4:
			NSLog(@"room type %d activated", typeNum);
			break;
		case 5:
			NSLog(@"room type %d activated", typeNum);
			break;
		case 6:
			NSLog(@"room type %d activated", typeNum);
			break;
		case 7:
			NSLog(@"room type %d activated", typeNum);
			break;
		case 8:
			NSLog(@"room type %d activated", typeNum);
			break;
		case 9:
			NSLog(@"room type %d activated", typeNum);
			break;
		case 10:
			NSLog(@"room type %d activated", typeNum);
			break;
		default:
			break;
	}
}

-(void)activateRoomNum:(int)RoomNumber{
	NSLog(@"room %d activated", RoomNumber);
	
	[PhysicalRoomArray[RoomNumber] revealRoom];
	[self activateRoomType:[PhysicalRoomArray[RoomNumber] getRoomType]];
	
	int up = RoomNumber - 4;
	int down = RoomNumber + 4;
	int left = RoomNumber - 1;
	int right = RoomNumber + 1;
	
	if (up >= 0) {
		[PhysicalRoomArray[up] updateStatus];
	}
	if (down < 16) {
		[PhysicalRoomArray[down] updateStatus];
	}
	if (left % 4 != 3 && left != -1) {
		[PhysicalRoomArray[left] updateStatus];
	}
	if (right % 4 != 0 && right != 16) {
		[PhysicalRoomArray[right] updateStatus];
	}
}

@end





