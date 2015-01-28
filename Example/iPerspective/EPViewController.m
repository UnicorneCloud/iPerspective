//
//  EPViewController.m
//  iPerspective
//
//  Created by Eric Pinet on 12/24/2014.
//  Copyright (c) 2014 Eric Pinet. All rights reserved.
//

#import "EPViewController.h"
#import "EPAppDelegate.h"

#import <iPerspective/UIImageView+Perspective.h>
#import <CoreMotion/CoreMotion.h>


@interface EPViewController ()
{
    CMMotionManager *motionmanager;
}

@property (weak, nonatomic) IBOutlet UIImageView* imagePerspective;

@end

@implementation EPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewDidAppear:(BOOL)animated
{
    // setup UIImageView+Perspective
    [_imagePerspective startUpdate:0.01 manager:[self sharedManager]];
}

- (void) viewWillDisappear:(BOOL)animated
{
    // setup UIImageView+Perspective
    [_imagePerspective stopUpdateManager:[self sharedManager]];
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
