//
//  Game.m
//  BingGaBong
//
//  Created by Michel Launier on 11-05-25.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Game.h"
#import "GameSettings.h"
#import "LevelInfo.h"
#import "MainMenuScene.h"
#import "C1L1Scene.h"

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

+(NSString*)toKey:(int)sceneId
{
    return [NSString stringWithFormat:@"%d", sceneId];
}

-(id)init
{
    self= [super init];
    if(!self) return nil;
    
    // Add levels to game
    levels= [[[NSMutableDictionary alloc] init] retain];
    LevelInfo *levelInfo= [LevelInfo createInstanceWithSceneClass:[MainMenuScene class]];
    [levels setObject:levelInfo forKey:[Game toKey:0]];
    levelInfo= [LevelInfo createInstanceWithSceneClass:[C1L1Scene class]];
    [levels setObject:levelInfo forKey:[Game toKey:101]];

    return self;
}

-(void)dealloc
{
    [levels release];
    [super dealloc];
}

+(int)chapterIndexFromSceneId:(int)sceneId
{
    return sceneId / 100;
}
+(int)levelIndexFromSceneId:(int)sceneId
{
    return sceneId % 100;
}

-(CCScene*)createSceneFromSceneId:(int)sceneId
{
    LevelInfo *levelInfo= [levels objectForKey:[Game toKey:sceneId]];
    if(!levelInfo) return nil;
    return [levelInfo createScene];
}

@end
