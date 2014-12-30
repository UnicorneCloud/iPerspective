//
//  UIImageViewPerspective.m
//  Pods
//
//  Created by Eric Pinet on 2014-12-29.
//
//

#import "UIImageViewPerspective.h"

#import <CoreMotion/CoreMotion.h>

#define PERSPECTIVE_AMPLITUDE 20
#define PERSPECTIVE_ANGLE_LIMIT 2
#define PERSPECTIVE_INTERVAL 0.01

@interface UIImageViewPerspective()
{
    float _amplitude;
    float _angleLimit;
    NSTimeInterval _interval;
    CMMotionManager* _motionManager;
    CGRect _initialFrame;
}
@end

@implementation UIImageViewPerspective


- (id) init
{
    [self initDefaultValue];
    return [super init];
}

- (id) initWithCoder:(NSCoder *)aDecoder
{
    [self initDefaultValue];
    return [super initWithCoder:aDecoder];
}

- (id) initWithFrame:(CGRect)frame
{
    [self initDefaultValue];
    return [super initWithFrame:frame];
}

- (id) initWithImage:(UIImage *)image
{
    [self initDefaultValue];
    return [super initWithImage:image];
}

- (id) initWithImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage
{
    [self initDefaultValue];
    return [super initWithImage:image highlightedImage:highlightedImage];
}


/**
 *  Initialize default value.
 */
- (void) initDefaultValue
{
    _amplitude = PERSPECTIVE_AMPLITUDE;
    _angleLimit = PERSPECTIVE_ANGLE_LIMIT;
    _interval = PERSPECTIVE_INTERVAL;
    _motionManager = nil;
}

/**
 *  Set core motion manager for manage update postion of this view.
 *  The
 *
 *  @param motionManager MotionManager from CoreMotion.
 */
- (void) setMotionManger:(CMMotionManager*)motionManager
{
    if (motionManager) {
        _motionManager = motionManager;
    }
}

/**
 *  Set maximum amplitude of motion for this view.
 *  Default value is: 20.
 *
 *  @param amplitude It's recommended to set amplitude between : 10 and 40.
 */
- (void) setMaximumAmplitude:(float)amplitude
{
    if (amplitude>0 && amplitude<1000) {
        _amplitude = amplitude;
    }
}

/**
 *  Set maximum angle of motion for this device. (0 to 3.0)
 *  Default value is 2.0.
 *
 *  @param angle It's recommended to set angle between 1.0 and 2.0.
 */
- (void) setMaximumAngle:(float)angle
{
    if (angle>=0 && angle<=3) {
        _angleLimit = angle;
    }
}

/**
 *  Set interval of time between the graphics interface.
 *  Default value is 0.01
 *
 *  @param interval It's recommended to set interval at 0.01 for maximum render or 0.1 for low cpu usage.
 */
- (void) setUpdateInterval:(NSTimeInterval)interval
{
    if (interval>0.001) {
        _interval = interval;
    }
}

/**
 *  Start update display perspective.
 */
- (void)startUpdate
{
    if (_initialFrame.size.height == 0 &&
        _initialFrame.size.width == 0) {
        _initialFrame = self.frame;
    }
    
    if (_motionManager) {
        if ([_motionManager isDeviceMotionAvailable] == YES) {
            [_motionManager setDeviceMotionUpdateInterval:_interval];
            [_motionManager startDeviceMotionUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMDeviceMotion *deviceMotion, NSError *error) {
                
                if (deviceMotion.attitude.roll > -_angleLimit &&
                    deviceMotion.attitude.roll < _angleLimit  &&
                    deviceMotion.attitude.pitch > -_angleLimit &&
                    deviceMotion.attitude.pitch < _angleLimit) {
                    
                    CGRect frame = _initialFrame;
                    frame.origin.x = _initialFrame.origin.x + (_amplitude*deviceMotion.attitude.roll);
                    frame.origin.y = _initialFrame.origin.y + (_amplitude*deviceMotion.attitude.pitch);
                    
                    self.frame = frame;
                    
                    self.translatesAutoresizingMaskIntoConstraints = YES;
                }
            }];
        }
    }
    else{
        NSLog(@" %s - %@\n", __PRETTY_FUNCTION__, @"MotionManager not set in UIImageViewPerspective. Set MotionManager before call startUpdate");
    }
}

/**
 *  Stop update display for perspective.
 */
- (void)stopUpdate
{
    if (_motionManager) {
        
        if ([_motionManager isDeviceMotionActive] == YES) {
            [_motionManager stopDeviceMotionUpdates];
        }
    }
    else{
        NSLog(@" %s - %@\n", __PRETTY_FUNCTION__, @"MotionManager not set in UIImageViewPerspective. Set MotionManager before call stopUpdate");
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
