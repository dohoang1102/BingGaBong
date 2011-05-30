//
//  GameSettings.m
//  BingGaBong
//
//  Created by Michel Launier on 11-05-25.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GameSettings.h"

// -----------------------------------------------------------------------
// Setting key values.
NSString * const keySfxVolume  = @"sfxVolume";
NSString * const keyMusicVolume= @"musicVolume";
NSString * const keyBrightness = @"brightness";


@implementation GameSettings

@synthesize sfxVolume;
@synthesize musicVolume;
@synthesize brightness;

-(id)init
{
    self= [super init];
    if(self == nil) return nil;

    // Initialize game settings with default values.
    sfxVolume= musicVolume= 0.8;
    brightness= 0.8;
    
    return self;
}

+(GameSettings*)createInstance
{
    return [[[GameSettings alloc] init] autorelease];
}

@end
