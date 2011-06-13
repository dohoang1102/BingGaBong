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
@class GameScene;
@class SimpleAudioEngine;

@interface Game : NSObject {
    GameSettings        *gameSettings;
    NSArray             *chapters;
    NSString            *backgroundMusic;
    SimpleAudioEngine   *audioEngine;
}

@property (readonly,nonatomic)GameSettings *gameSettings;

+(Game*)sharedInstance;
+(float)xRatioToPixel:(float)xRatio;
+(float)yRatioToPixel:(float)yRatio;
+(float)xPixelToRatio:(float)xPixel;
+(float)yPixelToRatio:(float)yPixel;
+(CGPoint)ratioToPixel:(CGPoint)ratio;
+(CGPoint)pixelToRatio:(CGPoint)pixel;

-(CCScene*)createFirstScene;
-(CCScene*)createNextScene:(CCScene*)currentScene;

-(void)loadBackDropForScene:(GameScene*)scene;
-(CCLayer*)getInGameMenuForScene:(GameScene*)scene;
-(void)playBackgroundMusicForScene:(GameScene*)scene;

@end
