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

@implementation LevelScene

@synthesize levelName;

-(id)initWithName:(NSString*)_levelName
{
    self= [super init];
    if(!self) return nil;
    
    levelName= _levelName;
    
    // Load level
    NSString *tileMapFileName= [levelName stringByAppendingString:@"TileMap.tmx"];
    TileMapLayer *tileMap= [TileMapLayer createInstanceWithTMXFile:tileMapFileName];
    NSAssert(tileMap != nil, @"Unable to find tile map file: %@", tileMapFileName);
    [self addChild:tileMap];

    // Load in-game UI
    InGameMenu *inGameMenu= [InGameMenu createInstance];
    [self addChild:inGameMenu];
    
    return self;
}

+(LevelScene*)createInstanceWithName:(NSString*)levelName
{
    return [[[LevelScene alloc] initWithName:levelName] autorelease];
}


// ======================================================================================
-(id) init
{
    [self dealloc];
    @throw [NSException exceptionWithName:@"BadInitCall" reason:@"Please use initWithName to initialize the LevelScene object." userInfo:nil];
    return nil;
}

@end
