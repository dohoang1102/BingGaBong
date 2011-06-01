//
//  SplashScreen.m
//  BingGaBong
//
//  Created by Michel Launier on 11-06-01.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SplashScreen.h"
#import "Game.h"

@implementation SplashScreen

-(id)init
{
    self= [super init];
    if(!self) return nil;

    secondsBeforeMainMenu= 3;
    [gameLoopLayer setGameTimerObserver:self];
    
    return self;
}

+(SplashScreen*)createInstance
{
    return [[[SplashScreen alloc] init] autorelease];
}

-(void)update:(ccTime)dt {}
-(void)update1sec
{
    if(--secondsBeforeMainMenu <= 0) {
        [[CCDirector sharedDirector] replaceScene:[[Game sharedInstance] createNextScene:self]];
    }
}

// ===================================================================================
// Deactivate GUI elements.
-(CCLayer*)getInGameMenu    { return nil; }

@end
