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
@class TileMapLayer;

@interface Game : NSObject {
    GameSettings    *gameSettings;
    NSArray         *chapters;
}

@property (readonly,nonatomic)GameSettings *gameSettings;

+(Game*)sharedInstance;

-(CCScene*)createFirstScene;
-(CCScene*)createNextScene:(CCScene*)currentScene;

-(void)loadBackDropForScene:(CCScene*)scene;
-(CCLayer*)getInGameMenuForScene:(CCScene*)scene;

@end
