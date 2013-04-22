//
//  PhysicalEquipment.h
//  Tower Of Heros
//
//  Created by MingYang Lu on 1/12/13.
//  Copyright (c) 2013 Vanderbilt University. All rights reserved.
//

#import "cocos2d.h"

@interface PhysicalEquipment : NSObject{
	
	NSString* name;
	NSNumber* EquipmentTag;
	NSArray* ThreshHolds; //Array of NSArrays
	NSArray* AffinityCount;
	
	
}
-(PhysicalEquipment*)initEuipmentWithTag:(int)equipTag asArmor:(bool)isArmor;

-(void)gainEquipment:(NSNumber*)Character;
-(NSString*)getName;
-(NSNumber*)getTag;
-(void)checkThreshHolds;
-(NSArray*)getAffinityCount;
-(void)setAffinityCount:(NSArray*)newAffinity;
@end
