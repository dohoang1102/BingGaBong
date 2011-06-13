//
//  GameScene.m
//  BingGaBong
//
//  Created by Michel Launier on 11-05-20.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GameScene.h"
#import "GameLoopLayer.h"
#import "Game.h"


@implementation GameScene

@synthesize gameLoopLayer;

-(id)init
{
    self= [super init];
    if(self == nil) return nil;
    
    // Instanciate gameloop
    gameLoopLayer= [GameLoopLayer createInstance];
    [self addChild:gameLoopLayer];
    
    // Load the backdrop
    [self loadBackDrop];
    [self playBackgroundMusic];
    
    return self;
}

+(GameScene*)createInstance
{
    return [[[GameScene alloc] init] autorelease];
}


-(NSString*)sceneName
{
    return NSStringFromClass([self class]);
}
-(void)loadBackDrop
{
    [[Game sharedInstance] loadBackDropForScene:self];
}
-(CCLayer*)getInGameMenu
{
    return [[Game sharedInstance] getInGameMenuForScene:self];
}
-(void)playBackgroundMusic
{
    [[Game sharedInstance] playBackgroundMusicForScene:self];
}

@end
