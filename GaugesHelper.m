//
//  GaugesHelper.m
//  PlanGrid
//
//  Created by Ralph Gootee on 1/23/12.
//  Copyright (c) 2012 Loupe. All rights reserved.
//

#import "GaugesHelper.h"

@implementation GaugesHelper

static NSString * kGaugesSite = @"";

static NSString * kGaugesTracking = @""
"<html><body><head><title>%@</title></head>"
"<script type=\"text/javascript\">"
    "var _gauges = _gauges || [];"
    "(function() {"
    "var t   = document.createElement('script');"
    "t.type  = 'text/javascript';"
    "t.async = true;"
    "t.id    = 'gauges-tracker';"
    "t.setAttribute('data-site-id', '%@');"
    "t.src = 'http://secure.gaug.es/track.js';"
    "var s = document.getElementsByTagName('script')[0];"
    "s.parentNode.insertBefore(t, s);"
"})();"
"</script></body></html>";

// Seemingly, this is the proper way to do a singleton on ios :/
+(GaugesHelper *)sharedInstance 
{
    static dispatch_once_t pred;
    static GaugesHelper *shared = nil;
    dispatch_once(&pred, ^{
        shared = [[GaugesHelper alloc] init];
    });
    return shared;
}

- (id) init
{
    self = [super init];
    if (self) {
        _web = [[UIWebView alloc] init];
    }
    return self;
}

+(void) addView: (NSString*) title
{
    [[self sharedInstance] addView:title];
}

- (void) addView: (NSString*) title
{
    NSString * js = [NSString stringWithFormat:kGaugesTracking, title, kGaugesSite];
    NSURL * url = [NSURL URLWithString: [NSString stringWithFormat:@"file://ios/%@",title]];
    
    [_web loadHTMLString:js baseURL:url];

    NSLog(@"GAUGE.ES: Added view for %@!", title);
}

@end
