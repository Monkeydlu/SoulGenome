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
@synthesize Character1Portrait = Character1Portrait;
@synthesize Character2Portrait = Character2Portrait;
@synthesize Character3Portrait = Character3Portrait;

- (id) initWithc1:(PhysicalCharacter*)char1 
			   c2:(PhysicalCharacter*)char2 
			   c3:(PhysicalCharacter*)char3{
	
	if ((self = [super init])) {
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
		
		CCRenderTexture* stroke  = [someToolsClass createStroke:Character1InfoBox  size:1  color:ccBLACK];
		CCRenderTexture* stroke2 = [someToolsClass createStroke:Character2InfoBox  size:1  color:ccBLACK];
		CCRenderTexture* stroke3 = [someToolsClass createStroke:Character3InfoBox  size:1  color:ccBLACK];
		
		[self addChild:stroke z:3];
		[self addChild:stroke2 z:3];
		[self addChild:stroke3 z:3];
		
		[self addChild:Character1InfoBox z:4];
		[self addChild:Character2InfoBox z:4];
		[self addChild:Character3InfoBox z:4];
		
		
	}
    return self;
}


-(void)Character1Selected{
	NSLog(@"Character 1 Selected");
}

-(void)Character2Selected{
	NSLog(@"Character 2 Selected");
}

-(void)Character3Selected{
	NSLog(@"Character 3 Selected");
}

@end


//====================================================//
//====================================================//
//====================MAP LAYER=======================//
//====================================================//
//====================================================//

@implementation MapLayer

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

- (void) activateTreasure:(int)treasureNum{
	
}

- (void) checkTreasures:(int[20])treasureList{
	for (int i = 0; i < 20; i++) {
		if (treasureList[i] == 1) {
			[self activateTreasure:i];
		}
	}
}

- (void) room10Selected{
	if (PhysRoom10 != 0) {
		NSLog(@"room 10 selected");
		int temp = [PhysRoom10 getRoomType];
		NSLog(@"*room type of %d", temp);
		if ([PhysRoom10 getRoomState] == 2) {
			[self activateRoomNum:0];
		}
	}
}
- (void) room11Selected{
	if (PhysRoom11 != 0) {
		NSLog(@"room 11 selected");
		int temp = [PhysRoom11 getRoomType];
		NSLog(@"*room type of %d", temp);
		if ([PhysRoom11 getRoomState] == 2) {
			[self activateRoomNum:1];
		}
	}
}
- (void) room12Selected{
	if (PhysRoom12 != 0) {
		NSLog(@"room 12 selected");
		int temp = [PhysRoom12 getRoomType];
		NSLog(@"*room type of %d", temp);
		if ([PhysRoom12 getRoomState] == 2) {
			[self activateRoomNum:2];
		}
	}
}
- (void) room13Selected{
	if (PhysRoom13 != 0) {
		NSLog(@"room 13 selected");
		int temp = [PhysRoom13 getRoomType];
		NSLog(@"*room type of %d", temp);
		if ([PhysRoom13 getRoomState] == 2) {
			[self activateRoomNum:3];
		}
	}
}


- (void) room20Selected{
	if (PhysRoom20 != 0) {
		NSLog(@"room 20 selected");
		int temp = [PhysRoom20 getRoomType];
		NSLog(@"*room type of %d", temp);
		if ([PhysRoom20 getRoomState] == 2) {
			[self activateRoomNum:4];
		}
	}
}
- (void) room21Selected{
	if (PhysRoom21 != 0) {
		NSLog(@"room 21 selected");
		int temp = [PhysRoom21 getRoomType];
		NSLog(@"*room type of %d", temp);
		if ([PhysRoom21 getRoomState] == 2) {
			[self activateRoomNum:5];
		}
	}
}
- (void) room22Selected{
	if (PhysRoom22 != 0) {
		NSLog(@"room 22 selected");
		int temp = [PhysRoom22 getRoomType];
		NSLog(@"*room type of %d", temp);
		if ([PhysRoom22 getRoomState] == 2) {
			[self activateRoomNum:6];
		}
	}
}
- (void) room23Selected{
	if (PhysRoom23 != 0) {
		NSLog(@"room 23 selected");
		int temp = [PhysRoom23 getRoomType];
		NSLog(@"*room type of %d", temp);
		if ([PhysRoom23 getRoomState] == 2) {
			[self activateRoomNum:7];
		}
	}
}


- (void) room30Selected{
	if (PhysRoom30 != 0) {
		NSLog(@"room 30 selected");
		int temp = [PhysRoom30 getRoomType];
		NSLog(@"*room type of %d", temp);
		if ([PhysRoom30 getRoomState] == 2) {
			[self activateRoomNum:8];
		}
	}
}
- (void) room31Selected{
	if (PhysRoom31 != 0) {
		NSLog(@"room 31 selected");
		int temp = [PhysRoom31 getRoomType];
		NSLog(@"*room type of %d", temp);
		if ([PhysRoom31 getRoomState] == 2) {
			[self activateRoomNum:9];
		}
	}
}
- (void) room32Selected{
	if (PhysRoom32 != 0) {
		NSLog(@"room 32 selected");
		int temp = [PhysRoom32 getRoomType];
		NSLog(@"*room type of %d", temp);
		if ([PhysRoom32 getRoomState] == 2) {
			[self activateRoomNum:10];
		}
	}
}
- (void) room33Selected{
	if (PhysRoom33 != 0) {
		NSLog(@"room 33 selected");
		int temp = [PhysRoom33 getRoomType];
		NSLog(@"*room type of %d", temp);
		if ([PhysRoom33 getRoomState] == 2) {
			[self activateRoomNum:11];
		}
	}
}


- (void) room40Selected{
	if (PhysRoom40 != 0) {
		NSLog(@"room 40 selected");
		int temp = [PhysRoom40 getRoomType];
		NSLog(@"*room type of %d", temp);
		if ([PhysRoom40 getRoomState] == 2) {
			[self activateRoomNum:12];
		}
	}
}
- (void) room41Selected{
	if (PhysRoom41 != 0) {
		NSLog(@"room 41 selected");
		int temp = [PhysRoom41 getRoomType];
		NSLog(@"*room type of %d", temp);
		if ([PhysRoom41 getRoomState] == 2) {
			[self activateRoomNum:13];
		}
	}
}
- (void) room42Selected{
	if (PhysRoom42 != 0) {
		NSLog(@"room 42 selected");
		int temp = [PhysRoom42 getRoomType];
		NSLog(@"*room type of %d", temp);
		if ([PhysRoom42 getRoomState] == 2) {
			[self activateRoomNum:14];
		}
	}
}
- (void) room43Selected{
	if (PhysRoom43 != 0) {
		NSLog(@"room 43 selected");
		int temp = [PhysRoom43 getRoomType];
		NSLog(@"*room type of %d", temp);
		if ([PhysRoom43 getRoomState] == 2) {
			[self activateRoomNum:15];
		}
	}
}

- (void) physicalRoomAllocHelper:(int)position andType:(NSNumber*)typeTag andPosition:(int)posTag{
	switch (position) {
		case 0:
			PhysRoom10 = [[PhysicalRoom alloc] initWithPosition:posTag andType:[typeTag intValue]];
			[self addChild:PhysRoom10 z:10];
			break;	
		case 1:
			PhysRoom11 = [[PhysicalRoom alloc] initWithPosition:posTag andType:[typeTag intValue]];
			[self addChild:PhysRoom11 z:10];
			break;
		case 2:
			PhysRoom12 = [[PhysicalRoom alloc] initWithPosition:posTag andType:[typeTag intValue]];
			[self addChild:PhysRoom12 z:10];
			break;	
		case 3:
			PhysRoom13 = [[PhysicalRoom alloc] initWithPosition:posTag andType:[typeTag intValue]];
			[self addChild:PhysRoom13 z:10];
			break;	
		case 4:
			PhysRoom20 = [[PhysicalRoom alloc] initWithPosition:posTag andType:[typeTag intValue]];
			[self addChild:PhysRoom20 z:10];
			break;	
		case 5:
			PhysRoom21 = [[PhysicalRoom alloc] initWithPosition:posTag andType:[typeTag intValue]];
			[self addChild:PhysRoom21 z:10];
			break;	
		case 6:
			PhysRoom22 = [[PhysicalRoom alloc] initWithPosition:posTag andType:[typeTag intValue]];
			[self addChild:PhysRoom22 z:10];
			break;	
		case 7:
			PhysRoom23 = [[PhysicalRoom alloc] initWithPosition:posTag andType:[typeTag intValue]];
			[self addChild:PhysRoom23 z:10];
			break;	
		case 8:
			PhysRoom30 = [[PhysicalRoom alloc] initWithPosition:posTag andType:[typeTag intValue]];
			[self addChild:PhysRoom30 z:10];
			break;	
		case 9:
			PhysRoom31 = [[PhysicalRoom alloc] initWithPosition:posTag andType:[typeTag intValue]];
			[self addChild:PhysRoom31 z:10];
			break;	
		case 10:
			PhysRoom32 = [[PhysicalRoom alloc] initWithPosition:posTag andType:[typeTag intValue]];
			[self addChild:PhysRoom32 z:10];
			break;	
		case 11:
			PhysRoom33 = [[PhysicalRoom alloc] initWithPosition:posTag andType:[typeTag intValue]];
			[self addChild:PhysRoom33 z:10];
			break;	
		case 12:
			PhysRoom40 = [[PhysicalRoom alloc] initWithPosition:posTag andType:[typeTag intValue]];
			[self addChild:PhysRoom40 z:10];
			break;	
		case 13:
			PhysRoom41 = [[PhysicalRoom alloc] initWithPosition:posTag andType:[typeTag intValue]];
			[self addChild:PhysRoom41 z:10];
			break;	
		case 14:
			PhysRoom42 = [[PhysicalRoom alloc] initWithPosition:posTag andType:[typeTag intValue]];
			[self addChild:PhysRoom42 z:10];
			break;	
		case 15:
			PhysRoom43 = [[PhysicalRoom alloc] initWithPosition:posTag andType:[typeTag intValue]];
			[self addChild:PhysRoom43 z:10];
			break;	
		default:
			break;
	}
}


- (void) addMap{
	CCMenuItemImage * Room10temp;
	CCMenuItemImage * Room11temp;
	CCMenuItemImage * Room12temp;
	CCMenuItemImage * Room13temp;
	
	CCMenuItemImage * Room20temp;
	CCMenuItemImage * Room21temp;
	CCMenuItemImage * Room22temp;
	CCMenuItemImage * Room23temp;
	
	CCMenuItemImage * Room30temp;
	CCMenuItemImage * Room31temp;
	CCMenuItemImage * Room32temp;
	CCMenuItemImage * Room33temp;
	
	CCMenuItemImage * Room40temp;
	CCMenuItemImage * Room41temp;
	CCMenuItemImage * Room42temp;
	CCMenuItemImage * Room43temp;
	
	
	Room10temp = [CCMenuItemImage itemFromNormalImage:@"BlankRoom.png" 
										selectedImage:@"BlankRoom.png"
											   target:self
											 selector:@selector(room10Selected)];
	Room11temp = [CCMenuItemImage itemFromNormalImage:@"BlankRoom.png" 
									selectedImage:@"BlankRoom.png"
										   target:self
										 selector:@selector(room11Selected)];
	Room12temp = [CCMenuItemImage itemFromNormalImage:@"BlankRoom.png" 
									selectedImage:@"BlankRoom.png"
										   target:self
										 selector:@selector(room12Selected)];
	Room13temp = [CCMenuItemImage itemFromNormalImage:@"BlankRoom.png" 
									selectedImage:@"BlankRoom.png"
										   target:self
										 selector:@selector(room13Selected)];
	
	Room20temp = [CCMenuItemImage itemFromNormalImage:@"BlankRoom.png" 
										selectedImage:@"BlankRoom.png"
											   target:self
											 selector:@selector(room20Selected)];
	Room21temp = [CCMenuItemImage itemFromNormalImage:@"BlankRoom.png" 
									selectedImage:@"BlankRoom.png"
										   target:self
										 selector:@selector(room21Selected)];
	Room22temp = [CCMenuItemImage itemFromNormalImage:@"BlankRoom.png" 
									selectedImage:@"BlankRoom.png"
										   target:self
										 selector:@selector(room22Selected)];
	Room23temp = [CCMenuItemImage itemFromNormalImage:@"BlankRoom.png" 
									selectedImage:@"BlankRoom.png"
										   target:self
										 selector:@selector(room23Selected)];
	
	Room30temp = [CCMenuItemImage itemFromNormalImage:@"BlankRoom.png" 
										selectedImage:@"BlankRoom.png"
											   target:self
											 selector:@selector(room30Selected)];
	Room31temp = [CCMenuItemImage itemFromNormalImage:@"BlankRoom.png" 
									selectedImage:@"BlankRoom.png"
										   target:self
										 selector:@selector(room31Selected)];
	Room32temp = [CCMenuItemImage itemFromNormalImage:@"BlankRoom.png" 
									selectedImage:@"BlankRoom.png"
										   target:self
										 selector:@selector(room32Selected)];
	Room33temp = [CCMenuItemImage itemFromNormalImage:@"BlankRoom.png" 
									selectedImage:@"BlankRoom.png"
										   target:self
										 selector:@selector(room33Selected)];
	
	Room40temp = [CCMenuItemImage itemFromNormalImage:@"BlankRoom.png" 
										selectedImage:@"BlankRoom.png"
											   target:self
											 selector:@selector(room40Selected)];
	Room41temp = [CCMenuItemImage itemFromNormalImage:@"BlankRoom.png" 
									selectedImage:@"BlankRoom.png"
										   target:self
										 selector:@selector(room41Selected)];
	Room42temp = [CCMenuItemImage itemFromNormalImage:@"BlankRoom.png" 
									selectedImage:@"BlankRoom.png"
										   target:self
										 selector:@selector(room42Selected)];
	Room43temp = [CCMenuItemImage itemFromNormalImage:@"BlankRoom.png" 
									selectedImage:@"BlankRoom.png"
										   target:self
										 selector:@selector(room43Selected)];
	
	mapRow1 = [CCMenu menuWithItems:Room10temp, Room11temp, Room12temp, Room13temp, nil];
	mapRow2 = [CCMenu menuWithItems:Room20temp, Room21temp, Room22temp, Room23temp, nil];
	mapRow3 = [CCMenu menuWithItems:Room30temp, Room31temp, Room32temp, Room33temp, nil];
	mapRow4 = [CCMenu menuWithItems:Room40temp, Room41temp, Room42temp, Room43temp, nil];
	
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
									  [NSNumber numberWithInt:3], 
									  [NSNumber numberWithInt:4], 
									  [NSNumber numberWithInt:5], 
									  [NSNumber numberWithInt:6], 
									  [NSNumber numberWithInt:7], 
									  [NSNumber numberWithInt:8], 
									  [NSNumber numberWithInt:9], 
									  [NSNumber numberWithInt:10], 
									  [NSNumber numberWithInt:11],
									  [NSNumber numberWithInt:3], 
									  [NSNumber numberWithInt:4], 
									  [NSNumber numberWithInt:5], 
									  [NSNumber numberWithInt:6], 
									  [NSNumber numberWithInt:7], 
									  [NSNumber numberWithInt:8], 
									  [NSNumber numberWithInt:9], 
									  [NSNumber numberWithInt:10], 
									  [NSNumber numberWithInt:11],
									  [NSNumber numberWithInt:3], 
									  [NSNumber numberWithInt:4], 
									  [NSNumber numberWithInt:5], 
									  [NSNumber numberWithInt:6], 
									  [NSNumber numberWithInt:7], 
									  [NSNumber numberWithInt:8], 
									  [NSNumber numberWithInt:9], 
									  [NSNumber numberWithInt:10], 
									  [NSNumber numberWithInt:11],
									  nil];
	
	int count = [roomsForFloor count]; 
	
	for (int i = 1; i < count; ++i) {
		int j = arc4random() % i;
		[roomsForFloor exchangeObjectAtIndex:j withObjectAtIndex:i];
	}
	
	for (int i = 0; i < 16; i++) {
		NSLog(@"%dth room", i);
		int temp = i%4;
		temp = temp + 10 + (10 * ((i)/4));
		
		if (i == missingNo1 || i == missingNo2 || i == missingNo3 || i == missingNo4) {
			NSLog(@"%d Not added", temp);
		}else if(i == monsterNo1 || i == monsterNo2 || i == monsterNo3){
			[self physicalRoomAllocHelper:i andType:[NSNumber numberWithInt:1] andPosition:temp];
			NSLog(@"%d Added, monster room", temp);
		}else if(i == boss){
			[self physicalRoomAllocHelper:i andType:[NSNumber numberWithInt:2] andPosition:temp];
			NSLog(@"%d Added, boss room", temp);
		}else if(i == startingRoom){
			[self physicalRoomAllocHelper:i andType:[NSNumber numberWithInt:0] andPosition:temp];
			NSLog(@"%d Added, starting room", temp);
		}else{
			[self physicalRoomAllocHelper:i andType:[roomsForFloor objectAtIndex:i] andPosition:temp];
			NSLog(@"%d Added, %d type room", temp, [[roomsForFloor objectAtIndex:i] intValue]);
		}
	}
	
	[self activateRoomNum:startingRoom];
	
}

-(void)revealRoom:(int)roomNumber{
	switch (roomNumber) {
		case 10:
			[PhysRoom10 updateStatus];
			break;
		case 11:
			[PhysRoom11 updateStatus];
			break;
		case 12:
			[PhysRoom12 updateStatus];
			break;
		case 13:
			[PhysRoom13 updateStatus];
			break;
		case 20:
			[PhysRoom20 updateStatus];
			break;
		case 21:
			[PhysRoom21 updateStatus];
			break;
		case 22:
			[PhysRoom22 updateStatus];
			break;
		case 23:
			[PhysRoom23 updateStatus];
			break;
		case 30:
			[PhysRoom30 updateStatus];
			break;
		case 31:
			[PhysRoom31 updateStatus];
			break;
		case 32:
			[PhysRoom32 updateStatus];
			break;
		case 33:
			[PhysRoom33 updateStatus];
			break;
		case 40:
			[PhysRoom40 updateStatus];
			break;
		case 41:
			[PhysRoom41 updateStatus];
			break;
		case 42:
			[PhysRoom42 updateStatus];
			break;
		case 43:
			[PhysRoom43 updateStatus];
			break;
		default:
			NSLog(@"badstate update");
			break;
	}
}

-(void)activateRoomType:(int)typeNum{
	switch (typeNum) {
		case 0:
			NSLog(@"room type %d activated", typeNum);
			//Starting point.
			break;
		case 1:
			NSLog(@"room type %d activated", typeNum);
			NSLog(@"MONSTER ROOM");
			//Monster room fight.
			GameScene * myParent = (GameScene *)[self parent];
			myParent.myBattleLayer = [[BattleLayer alloc] initWithLevel:1
																	 c1:char1
																	 c2:char2 
																	 c3:char3];
			[myParent addChild:myParent.myBattleLayer z:9];
			mapRow1.isTouchEnabled = NO;
			mapRow2.isTouchEnabled = NO;
			mapRow3.isTouchEnabled = NO;
			mapRow4.isTouchEnabled = NO;
			break;
		case 2:
			NSLog(@"room type %d activated", typeNum);
			NSLog(@"BOSS ROOM");
			//Boss room fight.
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

-(void)activateRoomHelper:(int)RoomNumber{
	switch (RoomNumber) {
		case 10:
			[PhysRoom10 revealRoom];
			[self activateRoomType:[PhysRoom10 getRoomType]];
			break;
		case 11:
			[PhysRoom11 revealRoom];
			[self activateRoomType:[PhysRoom11 getRoomType]];
			break;
		case 12:
			[PhysRoom12 revealRoom];
			[self activateRoomType:[PhysRoom12 getRoomType]];
			break;
		case 13:
			[PhysRoom13 revealRoom];
			[self activateRoomType:[PhysRoom13 getRoomType]];
			break;
		case 20:
			[PhysRoom20 revealRoom];
			[self activateRoomType:[PhysRoom20 getRoomType]];
			break;
		case 21:
			[PhysRoom21 revealRoom];
			[self activateRoomType:[PhysRoom21 getRoomType]];
			break;
		case 22:
			[PhysRoom22 revealRoom];
			[self activateRoomType:[PhysRoom22 getRoomType]];
			break;
		case 23:
			[PhysRoom23 revealRoom];
			[self activateRoomType:[PhysRoom23 getRoomType]];
			break;
		case 30:
			[PhysRoom30 revealRoom];
			[self activateRoomType:[PhysRoom30 getRoomType]];
			break;
		case 31:
			[PhysRoom31 revealRoom];
			[self activateRoomType:[PhysRoom31 getRoomType]];
			break;
		case 32:
			[PhysRoom32 revealRoom];
			[self activateRoomType:[PhysRoom32 getRoomType]];
			break;
		case 33:
			[PhysRoom33 revealRoom];
			[self activateRoomType:[PhysRoom33 getRoomType]];
			break;
		case 40:
			[PhysRoom40 revealRoom];
			[self activateRoomType:[PhysRoom40 getRoomType]];
			break;
		case 41:
			[PhysRoom41 revealRoom];
			[self activateRoomType:[PhysRoom41 getRoomType]];
			break;
		case 42:
			[PhysRoom42 revealRoom];
			[self activateRoomType:[PhysRoom42 getRoomType]];
			break;
		case 43:
			[PhysRoom43 revealRoom];
			[self activateRoomType:[PhysRoom43 getRoomType]];
			break;
		default:
			NSLog(@"badstate reveal");
			break;
	}
}



-(void)activateRoomNum:(int)RoomNumber{
	NSLog(@"room %d activated", RoomNumber);
	
	int temp = RoomNumber%4;
	temp = temp + 10 + (10 * ((RoomNumber)/4));
	[self activateRoomHelper:temp];
	
	int up = temp - 10;
	int down = temp + 10;
	int left = temp - 1;
	int right = temp + 1;
	
	if (up >= 10) {
		//reveal room.
		[self revealRoom:up];
	}
	if (down < 50) {
		[self revealRoom:down];
	}
	if (left % 10 < 4) {
		[self revealRoom:left];
	}
	if (right % 10 < 4) {
		[self revealRoom:right];
	}
}

@end






















