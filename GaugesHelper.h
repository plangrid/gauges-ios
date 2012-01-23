//
//  GaugesHelper.h
//  PlanGrid
//
//  Created by Ralph Gootee on 1/23/12.
//  Copyright (c) 2012 Loupe. All rights reserved.
//
//  This code comes with no warranty, free to use for any purpose

#import <Foundation/Foundation.h>

@interface GaugesHelper : NSObject
{
    // This webview actually does the posting of the view
    UIWebView *_web;
}

// Gets the singleton, you don't need this, just |addView|
+(GaugesHelper *)sharedInstance;

// Adds a view to gaug.es with the given title
+(void) addView: (NSString*) title;

// Non staic method for adding the view
-(void) addView: (NSString*) title;
@end
