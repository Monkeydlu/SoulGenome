//
//  PolygonNode.h
//  Tower Of Heros
//
//  Created by MingYang Lu on 4/2/13.
//  Copyright 2013 Vanderbilt University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface PolygonNode : CCNode

// Store the number of points in the polygon
@property (nonatomic, readwrite) int numberOfPoints;

@property (nonatomic, readwrite) ccVertex2F * glPoints ;

// The stroke color
@property (nonatomic, readwrite) ccColor4B strokeColor;

// The fill color
@property (nonatomic, readwrite) ccColor4B fillColor;

// If a stroke should be drawn
@property (nonatomic, readwrite) BOOL stroke;

// If the polygon should be filled
@property (nonatomic, readwrite) BOOL fill;

// Whether to close the polygon
@property (nonatomic, readwrite) BOOL closed;

// Standard constructor
+(id) newPolygonNode: (NSMutableArray *) newPoints;

// Draw the polygon node as a rectangle
+(id) newPolygonNodeAsRectangle: (int) width: (int) height;

// Set the points using a NSMutableArray
-(void) setupPoints: (NSMutableArray*) points;

@end