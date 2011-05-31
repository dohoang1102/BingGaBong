//
//  MainMenuScene.m
//  BingGaBong
//
//  Created by Michel Launier on 11-05-18.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "MainMenuScene.h"
#import "GameLoopLayer.h"
#import "OptionsScene.h"
#import "LevelSelectionScene.h"
#import "AboutScene.h"

@implementation MainMenuScene

+(MainMenuScene*)createInstance {
    NSDate *elapse= [NSDate dateWithTimeInterval:3 sinceDate:[NSDate date]];
    while([elapse compare:[NSDate date]] == NSOrderedDescending);
    return [[[MainMenuScene alloc] init] autorelease];
}

-(id)init {
    self= [super init];
    if(self == nil) return nil;
    
    // Create menu
    CCMenuItem *playItem= [CCMenuItemFont itemFromString:@"Play" target:self selector:@selector(onPlay)];
    CCMenuItem *settingItem= [CCMenuItemFont itemFromString:@"Options" target:self selector:@selector(onOptions)];
    CCMenuItem *levelItem= [CCMenuItemFont itemFromString:@"Levels" target:self selector:@selector(onLevelSelect)];
    CCMenuItem *aboutItem= [CCMenuItemFont itemFromString:@"About" target:self selector:@selector(onAbout)];
    CCMenuItem *exitItem= [CCMenuItemFont itemFromString:@"ByeBye" target:self selector:@selector(onExit)];
    CCMenu *menu= [CCMenu menuWithItems:playItem, settingItem, levelItem, aboutItem, exitItem, nil];
    [menu alignItemsVertically];
    [self addChild:menu];
    
    return self;
}



// ===================================================================================
-(void)onPlay
{
    NSLog(@"Play");
}
-(void)onOptions
{
    [[CCDirector sharedDirector] pushScene:[OptionsScene createInstance]];
}
-(void)onLevelSelect
{
    [[CCDirector sharedDirector] replaceScene:[LevelSelectionScene createInstance]];
}
-(void)onAbout
{
    [[CCDirector sharedDirector] replaceScene:[AboutScene createInstance]];
}
-(void)onExit
{
    exit(0);
}

@end
