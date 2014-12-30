//
//  EPViewController2.m
//  iPerspective
//
//  Created by Eric Pinet on 2014-12-29.
//  Copyright (c) 2014 Eric Pinet. All rights reserved.
//

#import "EPViewController2.h"
#import "EPAppDelegate.h"

#import <iPerspective/UIImageViewPerspective.h>
#import <CoreMotion/CoreMotion.h>


@interface EPViewController2 ()
{
    CMMotionManager *motionmanager;
}

@property (weak, nonatomic) IBOutlet UIImageViewPerspective* imagePerspective;

@end

@implementation EPViewController2

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // initialize _imagePerspective
    [_imagePerspective setMotionManger:[self sharedManager]];
    [_imagePerspective setMaximumAmplitude:20.0];
    [_imagePerspective setMaximumAngle:2.0];
    [_imagePerspective setUpdateInterval:0.01];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewDidAppear:(BOOL)animated
{
    // start update
    [_imagePerspective startUpdate];
}

- (void) viewWillDisappear:(BOOL)animated
{
    // stop update
    [_imagePerspective stopUpdate];
}

- (CMMotionManager *)sharedManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        motionmanager = [[CMMotionManager alloc] init];
    });
    return motionmanager;
}

@end
