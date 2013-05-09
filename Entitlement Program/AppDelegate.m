//
//  AppDelegate.m
//  Entitlement Program
//
//  Created by Twocanoes Software
//  Copyright (c) 2013 Twocanoes Software, Inc. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()
@property TCSEntitlementParser *task;
@property BOOL hintHidden;
@end


@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    
    self.hintHidden = FALSE;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dropHasOcurred:) name:DropHasOccurred object:nil];
    
}


- (void)dropHasOcurred:(NSNotification *)notif {
    
    self.hintHidden = YES;
    if (!self.task) self.task = [[TCSEntitlementParser alloc] init];
    self.entitlementList = [self.task listEntitlementsForAppPath:[notif userInfo][@"path"]];
}

@end
