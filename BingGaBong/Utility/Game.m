//
//  Game.m
//  BingGaBong
//
//  Created by Michel Launier on 11-05-25.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Game.h"
#import "GameSettings.h"
#import "MainMenuScene.h"

static Game* ourSharedInstance= nil;

@implementation Game

@synthesize gameSettings;

+(void)initialize
{
    // Create game singleton
    if(!ourSharedInstance) {
        ourSharedInstance= [[Game alloc] init];
    }
    
    // Create user defaults for game settings.
    NSMutableDictionary *defaultValues= [NSMutableDictionary dictionary];
    [defaultValues setObject:[NSNumber numberWithFloat:0.8] forKey:keySfxVolume];
    [defaultValues setObject:[NSNumber numberWithFloat:0.8] forKey:keyMusicVolume];
    [defaultValues setObject:[NSNumber numberWithFloat:0.8] forKey:keyBrightness];
    [[NSUserDefaults standardUserDefaults] registerDefaults:defaultValues];
}

+(Game*)sharedInstance
{
    return ourSharedInstance;
}

-(id)init
{
    self= [super init];
    if(!self) return nil;
    
    chapters= [[NSMutableDictionary alloc] init];

    return self;
}

-(void)dealloc
{
    [chapters release];
    [super dealloc];
}

-(void)addChapter:(Chapter*)chapter withName:(NSString*)name
{
    [chapters setObject:chapter forKey:name];
}
-(Chapter*)chapterWithName:(NSString*)name
{
    return [chapters objectForKey:name];
}

@end
