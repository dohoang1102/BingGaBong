//
//  OptionsScene.m
//  BingGaBong
//
//  Created by Michel Launier on 11-05-24.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "OptionsScene.h"
#import "MainMenuScene.h"
#import "Game.h"
#import "GameSettings.h"


@implementation OptionsScene

+(OptionsScene*)createInstance
{
    return [[[OptionsScene alloc] init] autorelease];
}

-(id)init
{
    self= [super init];
    if(self == nil) return nil;

    // Display title
    CCLabelTTF *title= [CCLabelTTF labelWithString:@"Settings" fontName:@"Marker Felt" fontSize:48];
    CGSize size = [[CCDirector sharedDirector] winSize];
    title.position = ccp( size.width /2, 0.8*size.height );
    [self addChild: title];

    // Menu
    CCMenuItem *doneItem= [CCMenuItemFont itemFromString:@"Done" target:self selector:@selector(onDone)];
    CCMenu *menu= [CCMenu menuWithItems:doneItem, nil];
    [menu alignItemsVertically];
    [self addChild:menu];

    return self;
}

-(void)dealloc
{
    [super dealloc];
}


// ===================================================================================
-(void)onDone
{
    [[CCDirector sharedDirector] popScene];
}


@end
