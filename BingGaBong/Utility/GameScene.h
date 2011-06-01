//
//  GameScene.h
//  BingGaBong
//
//  Created by Michel Launier on 11-05-20.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@class GameLoopLayer;

@interface GameScene : CCScene {
    GameLoopLayer   *gameLoopLayer;
}

@property (readonly,nonatomic)GameLoopLayer *gameLoopLayer;

+(GameScene*)createInstance;

-(NSString*)sceneName;
-(void)loadBackDrop;
-(CCLayer*)getInGameMenu;

@end
