//
//  Chapter.h
//  BingGaBong
//
//  Created by Michel Launier on 11-05-25.
//  Copyright 2011 Infaunier Enr.. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Level;

@interface Chapter : NSObject {
    BOOL                isCompleted;
    NSMutableDictionary *levels;
}

@property (readwrite,nonatomic)BOOL isCompleted;

-(BOOL)isEnabled;
-(void)addLevel:(Level*)level withName:(NSString*)name;
-(Level*)levelWithName:(NSString*)name;

@end
