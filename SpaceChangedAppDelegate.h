//
//  SpaceChangedAppDelegate.h
//  SpaceChanged
//
//  Created by Patrick Chamelo on 28/05/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "CGSPrivate.h"


@interface SpaceChangedAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
	IBOutlet NSTextField *textField;
}

@property (assign) IBOutlet NSWindow *window;

- (int)CGSSpaceNumber;
- (void)activeSpaceDidChange;
void spacesNotificationCallback( int data1, int data2, int data3, void* userParameter );

@end
