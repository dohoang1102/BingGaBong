//
//  TileMapLayer.h
//  BingGaBong
//
//  Created by Michel Launier on 11-05-18.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "TileMapInfo.h"


@interface TileMapLayer : CCLayer {
    TileMapInfo *tileMapInfo;
}

@property (readonly,nonatomic)TileMapInfo *tileMapInfo;

+(TileMapLayer*)createInstanceWithTMXFile:(NSString*)fileName;
+(TileMapLayer*)createInstanceWithTMXFile:(NSString*)fileName z:(int)depth;

@end
