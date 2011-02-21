//
//  SpaceChangedAppDelegate.m
//  SpaceChanged
//
//  Created by Patrick Chamelo on 28/05/2010.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "SpaceChangedAppDelegate.h"

@implementation SpaceChangedAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {

	[window setContentBorderThickness:20.0f forEdge:NSMinYEdge];
	[window setShowsResizeIndicator:FALSE];
	[window setCollectionBehavior: NSWindowCollectionBehaviorCanJoinAllSpaces];
	[window setLevel:kCGFloatingWindowLevel];
	[window center];
}

- (void)awakeFromNib {
	
	CGSRegisterConnectionNotifyProc( _CGSDefaultConnection(), spacesNotificationCallback, CGSWorkspaceChangedEvent, self );
	[self activeSpaceDidChange];
	 
}

-(int)CGSSpaceNumber {
	int spaceNumber = -1;
	CGSGetWorkspace(_CGSDefaultConnection(), &spaceNumber);
	return spaceNumber;
}

void spacesNotificationCallback( int data1, int data2, int data3, void* userParameter ){
	SpaceChangedAppDelegate *anInstance = (SpaceChangedAppDelegate *)userParameter;
	[anInstance activeSpaceDidChange];
}

-(void)activeSpaceDidChange{
	
	int i = [self CGSSpaceNumber]; 
	NSLog(@"The space number is %i",i);
	[textField setStringValue:[NSString	stringWithFormat:@"The space number is %i",i]];
}

@end

