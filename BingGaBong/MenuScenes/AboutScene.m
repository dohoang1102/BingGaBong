//
//  AboutScene.m
//  BingGaBong
//
//  Created by Michel Launier on 11-05-24.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AboutScene.h"
#import "MainMenuScene.h"


@implementation AboutScene

+(AboutScene*)createInstance
{
    return [[AboutScene alloc] init];
}

-(id)init
{
    self= [super init];
    if(self == nil) return nil;
    
    // display title
    CCLabelTTF *title= [CCLabelTTF labelWithString:@"About" fontName:@"Marker Felt" fontSize:48];
    CGSize size = [[CCDirector sharedDirector] winSize];
    title.position = ccp( size.width /2, 0.8*size.height );
    
    // add the label as a child to this Layer
    [self addChild: title];

    // Menu
    CCMenuItem *doneItem= [CCMenuItemFont itemFromString:@"Done" target:self selector:@selector(onDone)];
    CCMenu *menu= [CCMenu menuWithItems:doneItem, nil];
    [menu alignItemsVertically];
    [self addChild:menu];
    
    return self;
}
-(void)onDone
{
    [[CCDirector sharedDirector] replaceScene:[MainMenuScene createInstance]];
}

@end
