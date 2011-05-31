//
//  LevelInfo.h
//  BingGaBong
//
//  Created by Michel Launier on 11-05-30.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CCScene;

@interface LevelInfo : NSObject {
    Class       sceneClass;
}

+(LevelInfo*)createInstanceWithSceneClass:(Class)sceneClass;

-(CCScene*)createScene;

@end
