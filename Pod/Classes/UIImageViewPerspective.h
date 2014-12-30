//
//  UIImageViewPerspective.h
//  Pods
//
//  Created by Eric Pinet on 2014-12-29.
//
//

#import <UIKit/UIKit.h>

@class CMMotionManager;


/**
 *  UIImageViewPerspective is a subclass of UIImageView for help you to hade perspective effect
 *  using core motion on the device.
 */
@interface UIImageViewPerspective : UIImageView

- (id) init;

- (id) initWithCoder:(NSCoder *)aDecoder;

- (id) initWithFrame:(CGRect)frame;

- (id) initWithImage:(UIImage *)image;

- (id) initWithImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage;

/**
 *  Set core motion manager for manage update postion of this view.
 *  The
 *
 *  @param motionManager MotionManager from CoreMotion.
 */
- (void) setMotionManger:(CMMotionManager*)motionManager;

/**
 *  Set maximum amplitude of motion for this view.
 *  Default value is: 20.
 *
 *  @param amplitude It's recommended to set amplitude between : 10 and 40.
 */
- (void) setMaximumAmplitude:(float)amplitude;

/**
 *  Set maximum angle of motion for this device. (0 to 3.0)
 *  Default value is 2.0.
 *
 *  @param angle It's recommended to set angle between 1.0 and 2.0.
 */
- (void) setMaximumAngle:(float)angle;

/**
 *  Set interval of time between the graphics interface.
 *  Default value is 0.01
 *
 *  @param interval It's recommended to set interval at 0.01 for maximum render or 0.1 for low cpu usage.
 */
- (void) setUpdateInterval:(NSTimeInterval)interval;

/**
 *  Start update display perspective.
 */
- (void)startUpdate;

/**
 *  Stop update display for perspective.
 */
- (void)stopUpdate;

@end
