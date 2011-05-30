//
//  TouchProtocol.h
//  BingGaBong
//
//  Created by Michel Launier on 11-05-19.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TouchProtocol <NSObject>

-(void)touchBegan:(UITouch*)touch withEvent:(UIEvent*)event;
-(void)touchEnded:(UITouch*)touch withEvent:(UIEvent*)event;
-(void)touchMoved:(UITouch*)touch withEvent:(UIEvent*)event;

@end
