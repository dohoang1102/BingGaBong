//
//  TileMapInfo.m
//  BingGaBong
//
//  Created by Michel Launier on 11-05-11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TileMapInfo.h"


@implementation TileMapInfo

@synthesize tileMap;
@synthesize objects;
@synthesize mapSize;
@synthesize tileSize;

//-----------------------------------------------------------------------
/**
 Creates an autorelease TileMapInfo from a TMX file.
 */
+(TileMapInfo*)createInstanceWithTMXFile:(NSString*)tmxFile
{
    return [[[TileMapInfo alloc] initWithTMXFile:tmxFile] autorelease];
}


//-----------------------------------------------------------------------
-(id) initWithTMXFile: (NSString*)fileName
{
	// always call "super" init
	if( (self=[super init]) == nil) return nil;
        
    // Load tile map.
    tileMap= [[CCTMXTiledMap tiledMapWithTMXFile:fileName] retain];
    mapSize= tileMap.mapSize;
    tileSize= tileMap.tileSize;
    
    // Load all map related objects.
    objects= [[tileMap objectGroupNamed:@"Objects"] retain];
    NSAssert(objects != nil, @"TileMap Objects not found");
        
	return self;
}

//-----------------------------------------------------------------------
-(id)init
{
    // We do not support initialization without a TMX file.
    [self dealloc];
    @throw [NSException exceptionWithName:@"BadInitCall" reason:@"Initialize TileMapInfo with initWithTMXFile:" userInfo:nil];
    return nil;
}

//-----------------------------------------------------------------------
- (void) dealloc
{
    [objects release];
    [tileMap release];
	
	// don't forget to call "super dealloc"
	[super dealloc];
}

//-----------------------------------------------------------------------
-(CGPoint)toSpritePosition:(CGPoint)tileCoord
{
    return ccp((tileCoord.x+0.5) * tileSize.width, (mapSize.height-tileCoord.y-0.5)*tileSize.height);
}

//-----------------------------------------------------------------------
-(CGPoint)toTileCoordinate:(CGPoint)spritePosition
{
    return ccp(floorf(spritePosition.x/tileSize.width), mapSize.height-floorf(spritePosition.y/tileSize.height)-1.0f);
}

@end
