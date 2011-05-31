//
//  LevelScene.m
//  BingGaBong
//
//  Created by Michel Launier on 11-05-30.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LevelScene.h"
#import "TileMapLayer.h"
#import "InGameMenu.h"
#import "Game.h"

@implementation LevelScene

@synthesize sceneName;
@synthesize sceneId;


-(id)initWithSceneId:(int)sid withSceneName:(NSString*)name
{
    self= [super init];
    if(!self) return nil;
    
    sceneName= name;
    sceneId= sid;
    
    // Load level
    NSString *tileMapFileName= [sceneName stringByAppendingString:@"TileMap.tmx"];
    TileMapLayer *tileMap= [TileMapLayer createInstanceWithTMXFile:tileMapFileName];
    NSAssert(tileMap != nil, @"Unable to find tile map file: %@", tileMapFileName);
    [self addChild:tileMap z:0];

    // Load in-game UI
    InGameMenu *inGameMenu= [InGameMenu createInstance];
    [self addChild:inGameMenu z:10];
    
    return self;
}
-(id)initWithSceneId:(int)sid
{
    NSString *sname= [NSString stringWithFormat:@"C%@L%@", [Game chapterIndexFromSceneId:sceneId], [Game levelIndexFromSceneId:sceneId]];
    return [self initWithSceneId:sid withSceneName:sname];
}

+(LevelScene*)createInstanceWithSceneId:(int)sid withSceneName:(NSString*)name
{
    return [[[LevelScene alloc] initWithSceneId:sid withSceneName:name] autorelease];
}
+(LevelScene*)createInstanceWithSceneId:(int)sid
{
    return [[[LevelScene alloc] initWithSceneId:sid] autorelease];
}

// ======================================================================================
-(id) init
{
    [self dealloc];
    @throw [NSException exceptionWithName:@"BadInitCall" reason:@"Please use initWithName to initialize the LevelScene object." userInfo:nil];
    return nil;
}

@end
