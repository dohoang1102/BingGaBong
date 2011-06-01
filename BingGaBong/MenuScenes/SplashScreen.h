//
//  SplashScreen.h
//  BingGaBong
//
//  Created by Michel Launier on 11-06-01.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameScene.h"
#import "GameTimerProtocol.h"


@interface SplashScreen : GameScene <GameTimerProtocol> {
    int secondsBeforeMainMenu;
}

+(SplashScreen*)createInstance;

@end
