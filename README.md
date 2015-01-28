iPerspective
============

iPerspective is a iOS librarie of control with augmented reality. 

- **UIImageViewPerspective**: UIImageView with perspective when user move device.
- **UIImageView+Perspective**: Category for UIImageView and permit to create UIImageView with perspective when user move device.
- **UIViewPerspective**: UIView with perspective when user move device. _(Under construction)_
- **UIView+Perspective**: Category for UIView and permit to create UIView with perspective when user move device. _(Under construction)_

Documentation: [iPerspectiveDocs](http://cocoadocs.org/docsets/iPerspective)

# iPerspective

[![CI Status](http://img.shields.io/travis/Eric Pinet/iPerspective.svg?style=flat)](https://travis-ci.org/Eric Pinet/iPerspective)
[![Version](https://img.shields.io/cocoapods/v/iPerspective.svg?style=flat)](http://cocoadocs.org/docsets/iPerspective)
[![License](https://img.shields.io/cocoapods/l/iPerspective.svg?style=flat)](http://cocoadocs.org/docsets/iPerspective)
[![Platform](https://img.shields.io/cocoapods/p/iPerspective.svg?style=flat)](http://cocoadocs.org/docsets/iPerspective)


![iPerspective](https://github.com/ericpinet/iPerspective/blob/develop/images/iPerspective.gif)

## Requirements

N/A

## Installation

iPerspective is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod 'iPerspective'

And execute this command in your project folder:

    pod install

## Usage of 'UIImageViewPerspective'.

See the sample project iPerspective in 'Exemple' directory.

### Prepare 'CMMotionManager'

All control in iPerspective use 'CoreMotion'. It's prefered to create a single instance of CMMotionManager for all control in your app. 

    #import <CoreMotion/CoreMotion.h>
    ...
    @interface EPViewController2 ()
    {
        CMMotionManager *motionmanager;
    }
    ...
    - (CMMotionManager *)sharedManager
    {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            motionmanager = [[CMMotionManager alloc] init];
        });
        return motionmanager;
    }

### Use UIImageViewPerspective in your application.

UIImageViewPerspective is a subclass of UIImageView. You can use that to replace your UIImageView. 

Import :

    #import <iPerspective/UIImageViewPerspective.h>

Setup UIImageViewPerspective:

    // initialize _imagePerspective
    [_imagePerspective setMotionManger:[self sharedManager]]; // (Mandatory) set motion manager
    
    [_imagePerspective setMaximumAmplitude:20.0];   // (Optional) maximum move of UIImageView
    [_imagePerspective setMaximumAngle:2.0];        // (OPtional) maximum angle managed
    [_imagePerspective setUpdateInterval:0.01];     // (Optional) interval of refresh

Start image motion with core motion:

    // start image motion with core motion
    [_imagePerspective startUpdate];


Stop image motion:

    // stop image motion
    [_imagePerspective stopUpdate];

## Usage of 'UIImageView+Perspective'.

See the sample project iPerspective in 'Exemple' directory.

### Use UIImageView+Perspective in your application.

UIImageView+Perspective is a category. You can use that to replace your UIImageView. 

Import :

    #import <iPerspective/UIImageView+Perspective.h>

Start image motion with core motion:

    // start image motion with core motion
    [_imagePerspective startUpdate:0.01 manager:[self sharedManager]];


Stop image motion:

    // stop image motion
    [_imagePerspective stopUpdate:[self sharedManager]];


## Author

Eric Pinet, pineri01@gmail.com

## License

iPerspective is available under the MIT license. See the LICENSE file for more info.
