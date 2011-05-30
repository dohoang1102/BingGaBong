//
//  Level.m
//  BingGaBong
//
//  Created by Michel Launier on 11-05-25.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Level.h"


@implementation Level

@synthesize isCompleted;

-(id)init
{
    self= [super init];
    if(!self) return nil;
    
    isCompleted= false;
    
    return self;
}

-(BOOL)isEnabled
{
    return YES;
}

@end
