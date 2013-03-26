//
//  AppDelegate.h
//  Tower Of Heros
//
//  Created by MingYang Lu on 1/8/13.
//  Copyright Vanderbilt University 2013. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface AppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow			*window;
	RootViewController	*viewController;
}

@property (nonatomic, retain) UIWindow *window;

@end
