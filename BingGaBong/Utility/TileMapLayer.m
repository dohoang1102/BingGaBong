//
//  TileMapLayer.m
//  BingGaBong
//
//  Created by Michel Launier on 11-05-18.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TileMapLayer.h"


@implementation TileMapLayer

@synthesize tileMapInfo;


-(id)initWithTMXFile:(NSString*)fileName z:(int)depth
{
    self= [super init];
    if(self == nil) return nil;
    
    // Load TMX file.
    tileMapInfo= [[TileMapInfo createInstanceWithTMXFile:fileName] retain]; 
    NSAssert1(tileMapInfo != nil, @"Unable to load TMX file: %@", fileName);

    // Resize tilemap to fit screen area.
    CGSize winSize= [[CCDirector sharedDirector] winSize];
    float tileMapWidth= tileMapInfo.mapSize.width * tileMapInfo.tileSize.width;
    float tileMapHeight= tileMapInfo.mapSize.height * tileMapInfo.tileSize.height;
    tileMapInfo.tileMap.scaleX= (winSize.width / tileMapWidth);
    tileMapInfo.tileMap.scaleY= (winSize.height / tileMapHeight); 
    [self addChild:tileMapInfo.tileMap z:depth];
    
    return self;
}

-(id)init {
    // We do not support initialization without a TMX file.
    [self dealloc];
    @throw [NSException exceptionWithName:@"BadInitCall" reason:@"Default initialization not supported." userInfo:nil];
    return nil;
}

+(TileMapLayer*)createInstanceWithTMXFile:(NSString*)fileName
{
    return [TileMapLayer createInstanceWithTMXFile:fileName z:-1];
}

+(TileMapLayer*)createInstanceWithTMXFile:(NSString*)fileName z:(int)depth
{
    return [[[TileMapLayer alloc] initWithTMXFile:fileName z:depth] autorelease];
}

-(void)dealloc {
    // Release allocated objects.
    [tileMapInfo release];

    // Ask super to do the same.
    [super dealloc];
}

@end
