//
//  SceneDef.h
//  BingGaBong
//
//  Created by Michel Launier on 11-05-31.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#define SCENE_PER_CHAPTER   100

enum {
    // Chapter 0
    kChapter0Id= 0,
    kMainMenuSceneId= kChapter0Id,
    kOptionsSceneId,
    kLevelSelectionSceneId,
    kAboutSceneId,
    
    // Chapter 1
    kChapter1Id= SCENE_PER_CHAPTER,

    // Chapter 2
    kChapter2Id= 2*SCENE_PER_CHAPTER,

    // Chapter 3
    kChapter3Id= 3*SCENE_PER_CHAPTER,

    // Chapter 4
    kChapter4Id= 4*SCENE_PER_CHAPTER,
    
};
