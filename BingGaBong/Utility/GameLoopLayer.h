//
//  GameLoopLayer.h
//  BingGaBong
//
//  Created by Michel Launier on 11-05-18.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@protocol TouchProtocol;
@protocol AccelerometerProtocol;
@protocol GameTimerProtocol;

@interface GameLoopLayer : CCLayer {
    id<TouchProtocol>           touchObserver;
    id<AccelerometerProtocol>   accelerometerObserver;
    id<GameTimerProtocol>       gameTimerObserver;
}

+(GameLoopLayer*)createInstance;
+(GameLoopLayer*)createInstanceWithTouchProtocol:(id<TouchProtocol>)touchProtocolObj
                       withAccelerometerProtocol:(id<AccelerometerProtocol>)accelerometerObj
                           withGameTimerProtocol:(id<GameTimerProtocol>)gameTimerObj;

-(void)setTouchObserver:(id<TouchProtocol>)touchProtocolObj;
-(void)setAccelerometerObserver:(id<AccelerometerProtocol>)accelerometerProtocolObj;
-(void)setGameTimerObserver:(id<GameTimerProtocol>)gameTimerProtocolObj;
-(void)removeAllObservers;

@end
