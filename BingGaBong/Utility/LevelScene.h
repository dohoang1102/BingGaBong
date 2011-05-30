//
//  LevelScene.h
//  BingGaBong
//
//  Created by Michel Launier on 11-05-30.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameScene.h"


@interface LevelScene : GameScene {
    NSString *levelName;
}


@property (readonly,nonatomic)NSString *levelName;

+(LevelScene*)createInstanceWithName:(NSString*)levelName;

-(id)initWithName:(NSString*)levelName;

@end
