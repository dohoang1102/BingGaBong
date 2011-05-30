//
//  GameLoopLayer.m
//  BingGaBong
//
//  Created by Michel Launier on 11-05-18.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GameLoopLayer.h"
#import "TouchProtocol.h"
#import "AccelerometerProtocol.h"
#import "GameTimerProtocol.h"

@implementation GameLoopLayer

-(id)init
{
    self= [super init];
    if(self == nil) return nil;
    
    touchObserver= nil;
    accelerometerObserver= nil;
    gameTimerObserver= nil;
    
    return self;
}

/**
 Creates an autorelease GameLoopLayer.
 */
+(GameLoopLayer*)createInstance
{
    return [[[GameLoopLayer alloc] init] autorelease];
}

/**
 Creates an autorelease GameLoopLayer initializing the touch, acceleration, and game
 timer oberservers.
 */
 +(GameLoopLayer*)createInstanceWithTouchProtocol:(id<TouchProtocol>)touchProtocolObj
                       withAccelerometerProtocol:(id<AccelerometerProtocol>)accelerometerObj
                           withGameTimerProtocol:(id<GameTimerProtocol>)gameTimerObj
{
    GameLoopLayer* me= [self createInstance];
    if(me == nil) return nil;

    [me setTouchObserver:touchProtocolObj];
    [me setAccelerometerObserver:accelerometerObj];
    [me setGameTimerObserver:gameTimerObj];
    
    return me;
}

-(void)dealloc
{
    [touchObserver release];
    [accelerometerObserver release];
    [gameTimerObserver release];
    
    [super dealloc];
}


/**
 Sets an observer for the iOS touch events.  Pass "nil" to remove
 the existing observer.
 @see: TouchProtocol
 */
-(void)setTouchObserver:(id<TouchProtocol>)touchProtocolObj
{
    [touchProtocolObj retain];
    [touchObserver release];
    touchObserver= touchProtocolObj;
    self.isTouchEnabled= touchObserver != nil;
}

/**
 Sets an observer for the iOS accelerometer events.  Pass "nil" to remove
 the existing observer.
 @see: AccelerometerProtocol
 */
-(void)setAccelerometerObserver:(id<AccelerometerProtocol>)accelerometerProtocolObj
{
    [accelerometerProtocolObj retain];
    [accelerometerObserver release];
    accelerometerObserver= accelerometerProtocolObj;
    self.isAccelerometerEnabled= accelerometerObserver != nil;
}

/**
 Sets an observer for the iOS game timer events.  Pass "nil" to remove
 the existing observer.
 @see: GameTimerProtocol
 */
-(void)setGameTimerObserver:(id<GameTimerProtocol>)gameTimerProtocolObj
{
    [gameTimerProtocolObj retain];
    [self unscheduleAllSelectors];
    if(gameTimerProtocolObj != nil) {;
        [self scheduleUpdate];
        if([gameTimerProtocolObj respondsToSelector:@selector(update250ms)]) {
            [self schedule: @selector(update250ms) interval:0.25];            
        }
        if([gameTimerProtocolObj respondsToSelector:@selector(update1sec)]) {
            [self schedule: @selector(update1sec)  interval:1.0];            
        }
    }
    [gameTimerObserver release];
    gameTimerObserver= gameTimerProtocolObj;
}

/**
 Removes all installed observers.
 */
-(void)removeAllObservers
{
    [self setTouchObserver:nil];
    [self setAccelerometerObserver:nil];
    [self setGameTimerObserver:nil];
}

// ===================================================================================
// Process touch events.
- (void)ccTouchesBegan:(NSSet*)touches withEvent:(UIEvent*)event
{
    UITouch* touch = [touches anyObject];
    if(touch == nil) return;
    [touchObserver touchBegan:touch withEvent:event];
}

- (void)ccTouchesEnded:(NSSet*)touches withEvent:(UIEvent*)event
{
    UITouch* touch = [touches anyObject];
    if(touch == nil) return;
    
    [touchObserver touchEnded:touch withEvent:event];
}

-(void)ccTouchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch* touch = [touches anyObject];
    if(touch == nil) return;
    [touchObserver touchMoved:touch withEvent:event];
}


// ===================================================================================
// Process accelerometer
-(void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration
{
    [accelerometerObserver accelerometer:accelerometer didAccelerate:acceleration];
}

// ===================================================================================
// Process game timer updates
-(void)update:(ccTime)dt
{
    [gameTimerObserver update:dt];
}

-(void)update250ms
{
    [gameTimerObserver update250ms];
}

-(void)update1sec
{
    [gameTimerObserver update1sec];
}

@end
