//
//  LevelScene.h
//  BingGaBong
//
//  Created by Michel Launier on 11-05-30.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameScene.h"

/**
 Base class for level scenes in the game.
 */
@interface LevelScene : GameScene {
    NSString    *sceneName;
    int         sceneId;
}


@property (readonly,nonatomic)NSString *sceneName;
@property (readonly,nonatomic)int       sceneId;

+(LevelScene*)createInstanceWithSceneId:(int)sceneId;
+(LevelScene*)createInstanceWithSceneId:(int)sceneId withSceneName:(NSString*)sceneName;

-(id)initWithSceneId:(int)sceneId;
-(id)initWithSceneId:(int)sceneId withSceneName:(NSString*)sceneName;

@end
