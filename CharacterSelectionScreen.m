//
//  CharacterSelectionScreen.m
//  Tower Of Heros
//
//  Created by MingYang Lu on 1/15/13.
//  Copyright (c) 2013 Vanderbilt University. All rights reserved.
//

#import "CharacterSelectionScreen.h"
#import "PhysicalCharacter.h"
#import "GameScene.h"
#import "JobClassesInfoBox.h"

@implementation CharacterSelectionScreenSceen
@synthesize Layer1 = Layer1;
@synthesize Layer2 = Layer2;
@synthesize Layer3 = Layer3;
@synthesize Bg = Bg;

- (id) init {
	if ((self = [super init])) {
		Bg = [CCSprite spriteWithFile:@"MenuBg.png"];
        [Bg setPosition:ccp(240, 160)];
        [self addChild:Bg z:0];
		Layer1 = [BaseLayer node];
        [self addChild:Layer1];
    }
    return self;
}
@end


@implementation BaseLayer
@synthesize characterSelected = characterSelected;
@synthesize Character1 = Character1;
@synthesize Character2 = Character2;
@synthesize Character3 = Character3;
- (id) init {
	
	if ((self = [super init])) {
		//CharacterSelectionScreenSceen * myParent = (CharacterSelectionScreenSceen *)[self parent];
		
		TopLabel = [CCLabelTTF labelWithString:@"Select Your Party Members:" 
										   dimensions:CGSizeMake(340, 30) 
											alignment:UITextAlignmentCenter 
										lineBreakMode:UILineBreakModeWordWrap 
											 fontName:@"Arial" 
											 fontSize:20];
		TopLabel.color = ccc3(255, 255, 255);
		[TopLabel setPosition: ccp(240, 290)];
		
		CCRenderTexture* stroke = [someToolsClass createStroke:TopLabel  size:1  color:ccBLACK];
		[self addChild:stroke z:4];
		[self addChild:TopLabel z:4];
		
		BasicInfoBox = [CCLabelTTF labelWithString:@"" 
								   dimensions:CGSizeMake(140, 140) 
									alignment:UITextAlignmentLeft
								lineBreakMode:UILineBreakModeWordWrap 
									 fontName:@"Arial" 
									 fontSize:16];
		BasicInfoBox.color = ccc3(255, 255, 255);
		[BasicInfoBox setPosition: ccp(120, 80)];
		[self addChild:BasicInfoBox z:4];
		
		StatInfoBox = [CCLabelTTF labelWithString:@"Tap on the character slot to create a new character." 
										dimensions:CGSizeMake(120, 140) 
										 alignment:UITextAlignmentLeft
									 lineBreakMode:UILineBreakModeWordWrap 
										  fontName:@"Arial" 
										  fontSize:16];
		StatInfoBox.color = ccc3(255, 255, 255);
		[StatInfoBox setPosition: ccp(220, 80)];
		[self addChild:StatInfoBox z:4];
		
		BattleInfo = [CCLabelTTF labelWithString:@"" 
										dimensions:CGSizeMake(140, 140) 
										 alignment:UITextAlignmentLeft
									 lineBreakMode:UILineBreakModeWordWrap 
										  fontName:@"Arial" 
										  fontSize:16];
		BattleInfo.color = ccc3(255, 255, 255);
		[BattleInfo setPosition: ccp(320, 80)];
		[self addChild:BattleInfo z:4];
		
		CCMenuItemImage * Character1Button = [CCMenuItemImage itemFromNormalImage:@"PortraitBorder.png" 
															  selectedImage:@"PortraitBorder.png"
																	 target:self
																   selector:@selector(Character1Selected)];
		
		CCMenuItemImage * Character2Button = [CCMenuItemImage itemFromNormalImage:@"PortraitBorder.png" 
															  selectedImage:@"PortraitBorder.png"
																	 target:self
																   selector:@selector(Character2Selected)];
		
		CCMenuItemImage * Character3Button = [CCMenuItemImage itemFromNormalImage:@"PortraitBorder.png" 
															  selectedImage:@"PortraitBorder.png"
																	 target:self
																   selector:@selector(Character3Selected)];
		
		CharacterSelectMenu = [CCMenu menuWithItems:Character1Button, Character2Button, Character3Button, nil];
		[CharacterSelectMenu alignItemsHorizontallyWithPadding:50];
		[CharacterSelectMenu setPosition:ccp(240, 220)];
		
		selectedBorder = [CCSprite spriteWithFile:@"PortraitBorderSelected.png"];
		[selectedBorder setPosition:ccp(90, 220)];
		
		[self addChild:CharacterSelectMenu z:3];
		[self addChild:selectedBorder z:4];
		
		//CharacterSelectMenu.isTouchEnabled = NO;
		
		characterSelected = 1;
		
		Character1 = 0;
		Character2 = 0;
		Character3 = 0;
		
		Character1Bust = 0;
		Character2Bust = 0;
		Character3Bust = 0;
	}
    return self;
}

-(void)updateInfo{
	[BattleInfo cleanup];
	[StatInfoBox cleanup];
	[BattleInfo cleanup];
	CharacterSelectMenu.isTouchEnabled = YES;
	switch (characterSelected) {
		case 1:
			if (Character1 != 0) {
				[BasicInfoBox setString:[Character1 getBasicInfo]];
				[StatInfoBox setString:[Character1 getStatInfo]];
				[BattleInfo setString:[Character1 getAtkDefinfo]];
				if (Character1Bust != 0) {
					[Character1Bust setTexture:[[Character1 getCharacterBustSquare]texture]];
				}else{
					Character1Bust = [Character1 getCharacterBustSquare];
					[Character1Bust setPosition:ccp(90, 220)];
					[self addChild:Character1Bust z:1];
				}
			}else{
				[BasicInfoBox setString:@""];
				[StatInfoBox setString:@"Tap on the character slot to create a new character."];
				[BattleInfo setString:@""];
			}
			break;
		case 2:
			if (Character2 != 0) {
				[BasicInfoBox setString:[Character2 getBasicInfo]];
				[StatInfoBox setString:[Character2 getStatInfo]];
				[BattleInfo setString:[Character2 getAtkDefinfo]];
				if (Character2Bust != 0) {
					[Character2Bust setTexture:[[Character2 getCharacterBustSquare]texture]];
				}else{
					Character2Bust = [Character2 getCharacterBustSquare];
					[Character2Bust setPosition:ccp(240, 220)];
					[self addChild:Character2Bust z:1];
				}
			}else{
				[BasicInfoBox setString:@""];
				[StatInfoBox setString:@"Tap on the character slot to create a new character."];
				[BattleInfo setString:@""];
			}
			break;
		case 3:
			if (Character3 != 0) {
				[BasicInfoBox setString:[Character3 getBasicInfo]];
				[StatInfoBox setString:[Character3 getStatInfo]];
				[BattleInfo setString:[Character3 getAtkDefinfo]];
				if (Character3Bust != 0) {
					[Character3Bust setTexture:[[Character3 getCharacterBustSquare]texture]];
				}else{
					Character3Bust = [Character3 getCharacterBustSquare];
					[Character3Bust setPosition:ccp(390, 220)];
					[self addChild:Character3Bust z:1];
				}
			}else{
				[BasicInfoBox setString:@""];
				[StatInfoBox setString:@"Tap on the character slot to create a new character."];
				[BattleInfo setString:@""];
			}break;
		default:
			break;
	}
	
	if(Character1 != 0 && Character2 != 0 && Character3 != 0){
		CCMenuItemImage * contButton = [CCMenuItemImage itemFromNormalImage:@"ArrowRight.png" 
																	selectedImage:@"ArrowRight.png"
																		   target:self
																		 selector:@selector(contSelected)];
		
		
		
		CCMenu * contMenu = [CCMenu menuWithItems:contButton, nil];
		[contMenu setPosition:ccp(400, 40)];
		[self addChild:contMenu z:10];
	}
	
}

-(void)contSelected{
	/*
	PhysicalCharacter * myCharacter;
	myCharacter = [[PhysicalCharacter alloc] initCharacterWithClass:classTag
													   WithPosition:positionTag
														   WithName:characterName
														 WithGender:isMaleTag];
	
	*/
	 NSLog(@"creating game scene");
	GameScene * newGameScene;
	newGameScene = [[GameScene alloc] initGameWithc1:Character1 
												  c2:Character2 
												  c3:Character3];
	NSLog(@"game scene created");
	[[CCDirector sharedDirector] replaceScene:newGameScene];
}

-(void)Character1Selected{
	[selectedBorder setPosition:ccp(90, 220)];
	if (characterSelected == 1) {
		NSLog(@"create character 1");
		CharacterSelectMenu.isTouchEnabled = NO;
		CharacterSelectionScreenSceen * myParent = (CharacterSelectionScreenSceen *)[self parent];
		myParent.Layer2 = [ClassSelectLayer node];
		[myParent addChild:myParent.Layer2];
	}else{
		characterSelected = 1;
		[self updateInfo];
	}
	
}

-(void)Character2Selected{
	[selectedBorder setPosition:ccp(240, 220)];
	if (characterSelected == 2) {
		NSLog(@"create character 2");
		CharacterSelectMenu.isTouchEnabled = NO;
		CharacterSelectionScreenSceen * myParent = (CharacterSelectionScreenSceen *)[self parent];
		myParent.Layer2 = [ClassSelectLayer node];
		[myParent addChild:myParent.Layer2];
	}else{
		characterSelected = 2;
		[self updateInfo];
	}
}

-(void)Character3Selected{
	[selectedBorder setPosition:ccp(390, 220)];
	if (characterSelected == 3) {
		NSLog(@"create character 3");
		CharacterSelectMenu.isTouchEnabled = NO;
		CharacterSelectionScreenSceen * myParent = (CharacterSelectionScreenSceen *)[self parent];
		myParent.Layer2 = [ClassSelectLayer node];
		[myParent addChild:myParent.Layer2];
	}else{
		characterSelected = 3;
		[self updateInfo];
	}
}



- (void)tapDownAt:(CGPoint)location {
	return;
}

- (void) dealloc
{
	[super dealloc];
}

@end

//===========================================================//
//===========================================================//
//===========================================================//
//======================class select layer===================//
//===========================================================//
//===========================================================//
//===========================================================//


@implementation ClassSelectLayer
@synthesize maleSelected = maleSelected;
@synthesize currentClassSelected = currentClassSelected;

- (id) init {
	if ((self = [super init])) {
		
		CCSprite* menuImage = [CCSprite spriteWithFile:@"ClassSelectLayer.png"];
        [menuImage setPosition:ccp(240, 160)];
        [self addChild:menuImage z:6];
		
		CCMenuItemImage * LeftButton = [CCMenuItemImage itemFromNormalImage:@"ArrowLeft.png" 
															  selectedImage:@"ArrowLeft.png"
																	 target:self
																   selector:@selector(LeftButtonSelected)];
		
		CCMenuItemImage * ClassFemale =  [CCMenuItemImage itemFromNormalImage:@"PortraitBorder.png" 
															  selectedImage:@"PortraitBorder.png"
																	 target:self
																   selector:@selector(FemaleSelected)];
		
		CCMenuItemImage * AffinityImage = [CCMenuItemImage itemFromNormalImage:@"Blank.png" 
																 selectedImage:@"Blank.png"
																		target:self
																	  selector:@selector(DoNothing)];
		
		CCMenuItemImage * ClassMale =[CCMenuItemImage itemFromNormalImage:@"PortraitBorder.png" 
															  selectedImage:@"PortraitBorder.png"
																	 target:self
																   selector:@selector(MaleSelected)];
		
		CCMenuItemImage * RightButton =[CCMenuItemImage itemFromNormalImage:@"ArrowRight.png" 
															  selectedImage:@"ArrowRight.png"
																	 target:self
																   selector:@selector(RightButtonPressed)];
		
		FemaleCharacterSquare = [CCSprite spriteWithFile:@"DefenderFemaleSquare.png"];
		MaleCharacterSquare = [CCSprite spriteWithFile:@"DefenderMaleSquare.png"];
		ClassAffinities = [CCSprite spriteWithFile:@"SoulOrb.png"];
		
		[FemaleCharacterSquare setPosition:ccp(130, 220)];
		[MaleCharacterSquare setPosition:ccp(350, 220)];
		[ClassAffinities setPosition:ccp(240, 220)];
		JobClassesInfoBox * infoBox = [[JobClassesInfoBox alloc] init];
		ClassAffinities.color = [infoBox getSoulColor:1];
		
		[self addChild:FemaleCharacterSquare z:7];
		[self addChild:MaleCharacterSquare z:7];
		[self addChild:ClassAffinities z:7];
		
		selectedBorder = [CCSprite spriteWithFile:@"PortraitBorderSelected.png"];
		[selectedBorder setPosition:ccp(130, 220)];
		[self addChild:selectedBorder z:9];
		
		ClassSelectMenu = [CCMenu menuWithItems:LeftButton, ClassFemale, AffinityImage, ClassMale, RightButton, nil];
		[ClassSelectMenu alignItemsHorizontallyWithPadding:10];
		[ClassSelectMenu setPosition:ccp(240, 220)];
		[self addChild:ClassSelectMenu z:8];
		
		currentClassSelected = 1;
		maleSelected = false;
		
		NSString * temp = @"Unweavering and Steadfast, the defender is able to control the battlefield with it's absolute defense, attracting aggression of enemies and absorbing damage for the party.";
		
		classDiscriptionLabel = [CCLabelTTF labelWithString:temp
									   dimensions:CGSizeMake(340, 120) 
										alignment:UITextAlignmentLeft
									lineBreakMode:UILineBreakModeWordWrap 
										 fontName:@"Arial" 
										 fontSize:16];
		classDiscriptionLabel.color = ccc3(0, 0, 0);
		[classDiscriptionLabel setPosition: ccp(240, 80)];
		[self addChild:classDiscriptionLabel z:8];
		
	}
    return self;
}
-(void)updateClasses{
	JobClassesInfoBox * infoBox = [[JobClassesInfoBox alloc] init];
	switch (currentClassSelected) {
		case 1:
			[self removeChild:FemaleCharacterSquare cleanup:YES];
			[self removeChild:MaleCharacterSquare cleanup:YES];
			//[self removeChild:ClassAffinities cleanup:YES];
			FemaleCharacterSquare = [CCSprite spriteWithFile:@"DefenderFemaleSquare.png"];
			MaleCharacterSquare = [CCSprite spriteWithFile:@"DefenderMaleSquare.png"];
			//ClassAffinities = [CCSprite spriteWithFile:@"DefenderAffinity.png"];
			[FemaleCharacterSquare setPosition:ccp(130, 220)];
			[MaleCharacterSquare setPosition:ccp(350, 220)];
			//[ClassAffinities setPosition:ccp(240, 220)];
			[self addChild:FemaleCharacterSquare z:7];
			[self addChild:MaleCharacterSquare z:7];
			//[self addChild:ClassAffinities z:7];
			ClassAffinities.color = [infoBox getSoulColor:1];
			[classDiscriptionLabel setString:@"Unweavering and Steadfast, the defender is able to control the battlefield with it's absolute defense, attracting aggression of enemies and absorbing damage for the party."];
			break;
		case 2:
			[self removeChild:FemaleCharacterSquare cleanup:YES];
			[self removeChild:MaleCharacterSquare cleanup:YES];
			//[self removeChild:ClassAffinities cleanup:YES];
			FemaleCharacterSquare = [CCSprite spriteWithFile:@"StratagistFemaleSquare.png"];
			MaleCharacterSquare = [CCSprite spriteWithFile:@"StratagistMaleSquare.png"];
			//ClassAffinities = [CCSprite spriteWithFile:@"StratagistAffinity.png"];
			[FemaleCharacterSquare setPosition:ccp(130, 220)];
			[MaleCharacterSquare setPosition:ccp(350, 220)];
			//[ClassAffinities setPosition:ccp(240, 220)];
			[self addChild:FemaleCharacterSquare z:7];
			[self addChild:MaleCharacterSquare z:7];
			//[self addChild:ClassAffinities z:7];
			ClassAffinities.color = [infoBox getSoulColor:2];
			[classDiscriptionLabel setString:@"Cautious and calculating, the stratagist is able to make quick decisions and use skills that can increase the fighting potential of his team, manuvering positioning and adjusting the battle field to his will."];
			break;
		default:
			break;
	}
}

-(void)LeftButtonSelected{
	if(currentClassSelected == 1){
		currentClassSelected = 2;
	}else{
		currentClassSelected--;
	}
	[self updateClasses];
}

-(void)FemaleSelected{
	[selectedBorder setPosition:ccp(130, 220)];
	if (maleSelected == false) {
		NSLog(@"female selected");
		ClassSelectMenu.isTouchEnabled = NO;
		CharacterSelectionScreenSceen * myParent = (CharacterSelectionScreenSceen *)[self parent];
		myParent.Layer3 = [enterNameLayer node];
		[myParent addChild:myParent.Layer3];
	}else{
		maleSelected = false;
	}
}

-(void)DoNothing{
}

-(void)MaleSelected{
	[selectedBorder setPosition:ccp(350, 220)];
	if (maleSelected == true) {
		NSLog(@"male selected");
		ClassSelectMenu.isTouchEnabled = NO;
		CharacterSelectionScreenSceen * myParent = (CharacterSelectionScreenSceen *)[self parent];
		myParent.Layer3 = [enterNameLayer node];
		[myParent addChild:myParent.Layer3];
	}else{
		maleSelected = true;
	}
}

-(void)RightButtonPressed{
	if(currentClassSelected == 2){
		currentClassSelected = 1;
	}else{
		currentClassSelected++;
	}
	[self updateClasses];
}



@end

@implementation enterNameLayer

-(void)createCharacter{
	CharacterSelectionScreenSceen * myParent = (CharacterSelectionScreenSceen *)[self parent];
	int* classTag = myParent.Layer2.currentClassSelected;
	int positionTag = myParent.Layer1.characterSelected;
	//characterName;
	bool isMaleTag = myParent.Layer2.maleSelected;
	
	PhysicalCharacter * myCharacter;
	myCharacter = [[PhysicalCharacter alloc] initCharacterWithClass:classTag
													   WithPosition:positionTag
														   WithName:characterName
														 WithGender:isMaleTag];
	
	
	switch (positionTag) {
		case 1:
			myParent.Layer1.Character1 = myCharacter;
			break;
		case 2:
			myParent.Layer1.Character2 = myCharacter;
			break;
		case 3:
			myParent.Layer1.Character3 = myCharacter;
			break;
		default:
			break;
	}
	
	[myParent.Layer1 updateInfo];
	
	[myParent removeChild:myParent.Layer2 cleanup:YES];
	[myParent removeChild:myParent.Layer3 cleanup:YES];
}

-(void)specifyStartLevel {
	myText = [[UITextField alloc] initWithFrame:CGRectMake(130, 225, 200, 40)];
    [myText setDelegate:self];
    [myText setText:@""];
	[myText setTextAlignment:UITextAlignmentCenter];
    [myText setTextColor: [UIColor colorWithRed:0 green:0 blue:0 alpha:1.0]];
    [myText setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0]];
	myText.transform = CGAffineTransformConcat(myText.transform, CGAffineTransformMakeRotation(90 * 0.0174532925));
	[[[[CCDirector sharedDirector] openGLView] window] addSubview:myText];
    [myText becomeFirstResponder];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [myText resignFirstResponder];
    return YES;
}

-(void)textFieldDidEndEditing: (UITextField *)textField {
    if(textField == myText) {
        [myText endEditing:YES];
        [myText removeFromSuperview];
        characterName = myText.text;
		NSLog(@"Finished inputting character name");
		[self createCharacter];
	} else {
        NSLog(@"textField did not match myText");
    }
}

- (id) init {
	if ((self = [super init])) {
		characterName = 0;
		CCSprite * bg = [CCSprite spriteWithFile:@"NameFieldMenu.png"];
		[bg setPosition:ccp(240, 240)];
		[self addChild:bg z:10];
		[self specifyStartLevel];
	}
    return self;
}


@end




