//
//  GameScene.m
//  BingGaBong
//
//  Created by Michel Launier on 11-05-20.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GameScene.h"
#import "GameLoopLayer.h"


@implementation GameScene

@synthesize gameLoopLayer;

-(id)init
{
    self= [super init];
    if(self == nil) return nil;
    
    gameLoopLayer= [GameLoopLayer createInstance];
    [self addChild:gameLoopLayer];
    
    return self;
}

+(GameScene*)createInstance
{
    return [[[GameScene alloc] init] autorelease];
}

-(void)dealloc
{
    [super dealloc];
}

@end
