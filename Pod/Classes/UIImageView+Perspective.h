//
//  UIImageView+Perspective.h
//  MusicPutt
//
//  Created by Eric Pinet on 2014-12-23.
//  Copyright (c) 2014 Eric Pinet. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CMMotionManager;

@interface UIImageView (Perspective)

/**
 *  Start update display perspective with interval value of time (float).
 *
 *  @param intervalValue time in miliseconde
 *  @param motionManager motion manager (AppDelegate)
 */
- (void)startUpdate:(NSTimeInterval)intervalValue manager:(CMMotionManager*)motionManager;



/**
 *  Start update display perspective with interval value of time (float).
 *
 *  @deprecated
 *  @param intervalValue time in miliseconde
 *  @param motionManager motion manager (AppDelegate)
 */
- (void)startUpdatesWithValue:(NSTimeInterval)intervalValue manager:(CMMotionManager*)motionManager;


/**
 *  Stop update display for perspective.
 *
 *  @param motionManager motion manager (AppDelegate)
 */
- (void)stopUpdateManager:(CMMotionManager*)motionManager;

@end
