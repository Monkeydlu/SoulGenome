//
//  PolygonNode.m
//  Tower Of Heros
//
//  Created by MingYang Lu on 4/2/13.
//  Copyright 2013 Vanderbilt University. All rights reserved.
//

#import "PolygonNode.h"

@implementation PolygonNode

@synthesize strokeColor;
@synthesize fillColor;
@synthesize glPoints;
@synthesize numberOfPoints;

@synthesize stroke;
@synthesize fill;
@synthesize closed;

// Initialise the object. Allocate the array of points and set the default values.
// by default this will draw a closed white polygon with a red border
-(id) init {
	if( (self=[super init]) ) {
		//points = [[NSMutableArray alloc] initWithObjects: nil];
		
        closed = YES;
        fill = YES;
        stroke = YES;
		
        self.strokeColor = ccc4(255, 0, 0, 255);
        self.fillColor = ccc4(255, 255, 255, 255);
	}
	return self;
}

// Override the node draw method. Call the ccDrawPoly method
// to perform the OpenGL draw operation
-(void) draw {
	[super draw];
    [self ccDrawPoly];
}

// Draw the polygon using OpenGL
-(void) ccDrawPoly  {
	
    // Disable textures - we want to draw with plaine colors
    glDisableClientState(GL_COLOR_ARRAY);
	glDisableClientState(GL_TEXTURE_COORD_ARRAY);
	glDisable(GL_TEXTURE_2D);
	
    // Setup the vertex pointer. This puts gives OpenGL access
    // to our array of points
    glVertexPointer(2, GL_FLOAT, 0, self.glPoints);
	
    if(fill) {
        // Set the OpenGL color
        glColor4ub(fillColor.r, fillColor.g, fillColor.b, fillColor.a);
		
        // Draw the polygon
        if(closed)
            glDrawArrays(GL_TRIANGLE_FAN, 0, numberOfPoints);
        else
            glDrawArrays(GL_TRIANGLE_STRIP, 0, numberOfPoints);
    }
    if(stroke) {
        glColor4f(strokeColor.r, strokeColor.g, strokeColor.b, strokeColor.a);
        if(closed)
            glDrawArrays(GL_LINE_LOOP, 0, (GLsizei) numberOfPoints);
        else
            glDrawArrays(GL_LINE_STRIP, 0, (GLsizei) numberOfPoints);
    }
	
	
	// restore default state
	glEnableClientState(GL_COLOR_ARRAY);
	glEnableClientState(GL_TEXTURE_COORD_ARRAY);
	glEnable(GL_TEXTURE_2D);
	
}

// Constructor to create a polygon from an NSMutableArray of points
+(id) newPolygonNode: (NSMutableArray *) newPoints {
	return [[self alloc] initPolygonNode: newPoints] ;
}

// Set polygon as rectangle
+ (id) newPolygonNodeAsRectangle:(int)width withHeight:(int)height {
    NSMutableArray * pts = [[NSMutableArray alloc] initWithObjects:Nil];
	
    [pts addObject:[NSValue valueWithCGPoint:ccp(0,0)]];
    [pts addObject:[NSValue valueWithCGPoint:ccp(width,0)]];
    [pts addObject:[NSValue valueWithCGPoint:ccp(width,height)]];
    [pts addObject:[NSValue valueWithCGPoint:ccp(0,height)]];
	
    return [[self alloc] initPolygonNode: pts];
}

-(id) initPolygonNode: (NSMutableArray *) points {
	if((self = [self init] )) {
        [self setupPoints:points];
	}
	return self;
}

// Convert a NSMutableArray into an array of ccVertex2F which can
// be understood by OpenGL
-(void) setupPoints: (NSMutableArray*) points {
    self.numberOfPoints = [points count];
	
    ccVertex2F *newPoint = malloc(numberOfPoints * sizeof(ccVertex2F));
    if (newPoint == NULL) {
        // Handle error
    }
	
	// iPhone and 32-bit machines
    if( sizeof(CGPoint) == sizeof(ccVertex2F) ) {
		for(NSUInteger i=0; i<numberOfPoints; i++) {
			NSValue *val = [points objectAtIndex:i];
			CGPoint pt = [val CGPointValue];
			newPoint[i] = (ccVertex2F) { pt.x * CC_CONTENT_SCALE_FACTOR(), pt.y * CC_CONTENT_SCALE_FACTOR() };
		}
 	} else {
		// 64-bit machines (Mac)
		
		for(NSUInteger i=0; i<numberOfPoints; i++) {
			NSValue *val = [points objectAtIndex:i];
			CGPoint pt = [val CGPointValue];
			newPoint[i] = (ccVertex2F) { pt.x, pt.y };
		}
	}
	
    self.glPoints = newPoint;
}

-(void) dealloc {
    free(self.glPoints);
	[super dealloc];
}

@end