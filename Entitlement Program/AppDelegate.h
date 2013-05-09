//
//  AppDelegate.h
//  Entitlement Program
//
//  Created by Twocanoes Software on 1/9/13.
//  Copyright (c) 2013 Twocanoes Software, Inc. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "TCSEntitlementParser.h"
#import "DropView.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property NSDictionary *entitlementList;

@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSDictionaryController *dictController;


@end
