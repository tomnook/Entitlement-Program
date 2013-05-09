//
//  AppDelegate.m
//  Entitlement Program
//
//  Created by Twocanoes Software on 1/9/13.
//  Copyright (c) 2013 Twocanoes Software, Inc. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()
@property TCSEntitlementParser *task;
@end


@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dropHasOcurred:) name:DropHasOccurred object:nil];
    
}


- (void)dropHasOcurred:(NSNotification *)notif {
    
    if (!self.task) self.task = [[TCSEntitlementParser alloc] init];
    self.entitlementList = [self.task listEntitlementsForAppPath:[notif userInfo][@"path"]];
}

@end
