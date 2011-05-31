//
//  LevelInfo.m
//  BingGaBong
//
//  Created by Michel Launier on 11-05-30.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "LevelInfo.h"
#import "cocos2d.h"

@implementation LevelInfo

-(id)initWithSceneClass:(Class)scene
{
    self= [super init];
    if(!self) return nil;

    NSAssert([scene respondsToSelector:@selector(createInstance)] == YES, @"createInstance not supported");
    sceneClass= [scene retain];
    
    return self;
}
+(LevelInfo*)createInstanceWithSceneClass:(Class)scene
{
    return [[[LevelInfo alloc] initWithSceneClass:scene] autorelease];
}

-(void)dealloc
{
    [sceneClass release];
    
    [super dealloc];
}

-(CCScene*)createScene
{
    SEL creator= @selector(createInstance);
    return [sceneClass performSelector:creator];
}

// ======================================================================================
-(id) init
{
    [self dealloc];
    @throw [NSException exceptionWithName:@"BadInitCall" reason:@"Please use initWithName to initialize the LevelScene object." userInfo:nil];
    return nil;
}


@end
