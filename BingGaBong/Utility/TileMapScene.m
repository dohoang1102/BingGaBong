//
//  LevelScene.m
//  BingGaBong
//
//  Created by Michel Launier on 11-05-30.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TileMapScene.h"
#import "TileMapLayer.h"
#import "Game.h"

@implementation TileMapScene

-(id)init
{
    self= [super init];
    if(!self) return nil;
    
    // Load level
    NSString *tileMapFileName= [[self sceneName] stringByAppendingString:@"TileMap.tmx"];
    TileMapLayer *tileMap= [TileMapLayer createInstanceWithTMXFile:tileMapFileName];
    NSAssert1(tileMap != nil, @"Unable to find tile map file: %@", tileMapFileName);
    [self addChild:tileMap z:0];

    // Load in-game UI
    CCLayer *inGameMenu= [self getInGameMenu];
    [self addChild:inGameMenu z:100];
    
    return self;
}

+(TileMapScene*)createInstance
{
    return [[[TileMapScene alloc] init] autorelease];
}

@end
