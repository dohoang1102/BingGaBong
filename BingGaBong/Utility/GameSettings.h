//
//  GameSettings.h
//  BingGaBong
//
//  Created by Michel Launier on 11-05-25.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

// -----------------------------------------------------------------------
// Setting key values.
extern NSString * const keySfxVolume;
extern NSString * const keyMusicVolume;
extern NSString * const keyBrightness;


@interface GameSettings : NSObject {
    float sfxVolume;
    float musicVolume;
    float brightness;
}

@property (readwrite,nonatomic)float sfxVolume;
@property (readwrite,nonatomic)float musicVolume;
@property (readwrite,nonatomic)float brightness;

+(GameSettings*)createInstance;

@end
