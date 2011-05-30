//
//  Chapter.m
//  BingGaBong
//
//  Created by Michel Launier on 11-05-25.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Chapter.h"


@implementation Chapter

@synthesize isCompleted;

-(id)init
{
    self= [super init];
    if(!self) return nil;

    isCompleted= false;
    levels= [[NSMutableDictionary alloc] init];
    
    return self;
}

-(void)dealloc
{
    [levels release];
    [super dealloc];
}

-(BOOL)isEnabled
{
    return YES;
}

-(void)addLevel:(Level*)level withName:(NSString*)name
{
    [levels setObject:level forKey:name];
}
-(Level*)levelWithName:(NSString*)name
{
    return [levels objectForKey:name];
}

@end
