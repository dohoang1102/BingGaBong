//
//  C1L1Scene.m
//  BingGaBong
//
//  Created by Michel Launier on 11-05-30.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "C1L1Scene.h"

@implementation C1L1Scene

-(id)init
{
    self= [super initWithName:@"C1L1"];
    if(!self) return nil;
    
    return self;
}

+(LevelScene*)createInstance
{
    return [[[C1L1Scene alloc] init] autorelease];
}

@end
