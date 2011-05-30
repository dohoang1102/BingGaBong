//
//  GameTimerProtocol.h
//  BingGaBong
//
//  Created by Michel Launier on 11-05-19.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"


@protocol GameTimerProtocol <NSObject>

-(void)update:(ccTime)dt;

@optional
-(void)update250ms;
-(void)update1sec;

@end
