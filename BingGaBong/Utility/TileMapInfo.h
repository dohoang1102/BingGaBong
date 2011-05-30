//
//  TileMapInfo.h
//  BingGaBong
//
//  Created by Michel Launier on 11-05-11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"


@interface TileMapInfo : NSObject {
    CCTMXTiledMap       *tileMap;
    CCTMXObjectGroup    *objects;
    CGSize              mapSize;
    CGSize              tileSize;
}

@property (readonly,nonatomic) CCTMXTiledMap    *tileMap;
@property (readonly,nonatomic) CCTMXObjectGroup *objects;
@property (readonly,nonatomic) CGSize           mapSize;
@property (readonly,nonatomic) CGSize           tileSize;

+(TileMapInfo*)createInstanceWithTMXFile:(NSString*)tmxFile;
-(CGPoint)toTileCoordinate:(CGPoint)spritePosition;
-(CGPoint)toSpritePosition:(CGPoint)tileCoord;

@end
