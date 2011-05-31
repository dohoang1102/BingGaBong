//
//  Game.h
//  BingGaBong
//
//  Created by Michel Launier on 11-05-25.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@class GameSettings;
@class LevelInfo;

@interface Game : NSObject {
    GameSettings        *gameSettings;
    NSMutableDictionary *levels;
}

@property (readonly,nonatomic)GameSettings *gameSettings;

+(Game*)sharedInstance;
+(int)chapterIndexFromSceneId:(int)sceneId;
+(int)levelIndexFromSceneId:(int)sceneId;

-(CCScene*)createSceneFromSceneId:(int)sceneId;

@end
