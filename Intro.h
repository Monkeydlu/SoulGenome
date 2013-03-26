//
//  CutSceneEventsScene.h
//  Tower Of Heros
//
//  Created by MingYang Lu on 1/14/13.
//  Copyright (c) 2013 Vanderbilt University. All rights reserved.
//

#import "cocos2d.h"

@interface IntroEventScene : CCScene{
}

@end

@interface IntroEventLayer : CCLayerColor{
	int pageCounter;
	bool tapToContinue;
	CCLabelTTF * textWindowLabel;
}

@end
