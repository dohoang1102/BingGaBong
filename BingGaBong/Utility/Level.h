//
//  Level.h
//  BingGaBong
//
//  Created by Michel Launier on 11-05-25.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Level : NSObject {
    BOOL    isCompleted;
}

@property (readwrite,nonatomic)BOOL isCompleted;

-(BOOL)isEnabled;

@end
