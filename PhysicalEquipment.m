//
//  PhysicalEquipment.m
//  Tower Of Heros
//
//  Created by MingYang Lu on 1/12/13.
//  Copyright (c) 2013 Vanderbilt University. All rights reserved.
//

#import "PhysicalEquipment.h"

@implementation PhysicalEquipment

-(PhysicalEquipment*)initEuipmentWithTag:(int)equipTag{
	//access the equipment tool box. 
	return self;
}

-(void)gainEquipment:(NSNumber*)Character{
	//what happens when the character first gets
	//the equipment, so any stat alterations,
	//are made here. 
}

-(NSString*)getName{
	return name;
}
-(NSNumber*)getTag{
	return EquipmentTag;
}
-(void)checkThreshHolds{
	//evolve into a new piece of equipment.
	//Access equipmentToolBox.
}
-(NSArray*)getAffinityCount{
	return AffinityCount;
}
-(void)setAffinityCount:newAffinity{
	AffinityCount = [NSArray arrayWithArray:newAffinity];
}

@end
