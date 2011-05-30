//
//  AccelerationProtocol.h
//  BingGaBong
//
//  Created by Michel Launier on 11-05-19.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol AccelerometerProtocol <NSObject>

-(void)accelerometer:(UIAccelerometer*)accelerometer didAccelerate:(UIAcceleration*)acceleration;

@end
