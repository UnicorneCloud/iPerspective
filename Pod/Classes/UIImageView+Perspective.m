//
//  UIImageView+Perspective.m
//  MusicPutt
//
//  Created by Eric Pinet on 2014-12-23.
//  Copyright (c) 2014 Eric Pinet. All rights reserved.
//

#import "UIImageView+Perspective.h"

#import <CoreMotion/CoreMotion.h>

#define AMPLITUDE 20
#define LIMIT_ANGLE 2

@implementation UIImageView (Perspective)

/**
 *  Start update display perspective with interval value of time (float).
 *
 *  @param intervalValue time in miliseconde
 *  @param motionManager motion manager (AppDelegate)
 */
- (void)startUpdate:(NSTimeInterval)intervalValue manager:(CMMotionManager*)motionManager;
{
    CMMotionManager *mManager = motionManager;
    CGRect initialFrame = self.frame;
    
    if ([mManager isDeviceMotionAvailable] == YES) {
        [mManager setDeviceMotionUpdateInterval:intervalValue];
        [mManager startDeviceMotionUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMDeviceMotion *deviceMotion, NSError *error) {
            
            if (deviceMotion.attitude.roll > -LIMIT_ANGLE &&
                deviceMotion.attitude.roll < LIMIT_ANGLE  &&
                deviceMotion.attitude.pitch > -LIMIT_ANGLE &&
                deviceMotion.attitude.pitch < LIMIT_ANGLE) {
                
                CGRect frame = initialFrame;
                frame.origin.x = initialFrame.origin.x + (AMPLITUDE*deviceMotion.attitude.roll);
                frame.origin.y = initialFrame.origin.y + (AMPLITUDE*deviceMotion.attitude.pitch);
                
                self.frame = frame;
                
                self.translatesAutoresizingMaskIntoConstraints = YES;
            }
        }];
    }
}

/**
 *  Stop update display for perspective.
 *
 *  @param motionManager motion manager (AppDelegate)
 */
- (void)stopUpdate:(CMMotionManager*)motionManager
{
    if ([motionManager isDeviceMotionActive] == YES) {
        [motionManager stopDeviceMotionUpdates];
    }
}

/**
 *  (DEPRECATED) Start update display perspective with interval value of time (float).
 *
 *  @deprecated
 *  @param intervalValue time in miliseconde
 *  @param motionManager motion manager (AppDelegate)
 */
- (void)startUpdatesWithValue:(NSTimeInterval)intervalValue manager:(CMMotionManager*)motionManager;
{
    [self startUpdate:intervalValue manager:motionManager];
}

/**
 *  (DEPRECATED) Stop update display for perspective.
 *
 *  @deprecated
 *  @param motionManager motion manager (AppDelegate)
 */
- (void)stopUpdateManager:(CMMotionManager*)motionManager
{
    if ([motionManager isDeviceMotionActive] == YES) {
        [motionManager stopDeviceMotionUpdates];
    }
}



@end
