gaug.es iOS Wrapper
=======

This is a *very* simple wrapper for gaug.es, so you can use it in an iOS mobile application.  It doesn't really support anything except for pageviews with a title, but I'll add more things as they're requested! 

## Installation

Just copy **GaugesHelper.h** and  **GaugesHelper.m** to your project and include them with Xcode.  Then fill in the line:

    static NSString * kGaugesSite = @"YOUR_GAUGES_ID";
    
you can find your ID easily by using the tracking code from the gaug.es website:

    t.setAttribute('data-site-id', 'ID');

## Usage

To use, include it in a UIViewController's **viewWillAppear** method:

    #import "GaugesHelper.h"
    
    - (void) viewWillAppear:(BOOL)animated
    {
        [GaugesHelper addView:@"Foo"];   
    }

Feel free to email me with any questions!  ralph@loupe.io
