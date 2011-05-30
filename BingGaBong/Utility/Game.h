//
//  Game.h
//  BingGaBong
//
//  Created by Michel Launier on 11-05-25.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameSettings.h"

@class MainMenuScene;
@class Chapter;

@interface Game : NSObject {
    GameSettings        *gameSettings;
    NSMutableDictionary *chapters;
}

@property (readonly,nonatomic)GameSettings *gameSettings;

+(Game*)sharedInstance;

-(void)addChapter:(Chapter*)chapter withName:(NSString*)name;
-(Chapter*)chapterWithName:(NSString*)name;

@end
