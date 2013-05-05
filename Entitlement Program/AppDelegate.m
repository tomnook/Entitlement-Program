//
//  AppDelegate.m
//  Entitlement Program
//
//  Created by Twocanoes Software on 1/9/13.
//  Copyright (c) 2013 Twocanoes Software, Inc. All rights reserved.
//

#import "AppDelegate.h"


@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    
    NSString *appPath = @"/Applications/The Unarchiver.app";
    
    TCSEntitlementParser *task = [[TCSEntitlementParser alloc] init];
    
    self.entitlementList = [task listEntitlementsForAppPath:appPath];

}

- (IBAction)refreshButton:(id)sender {
    
    NSString *appPath = @"/Applications/Safari.app";
    
    TCSEntitlementParser *task = [[TCSEntitlementParser alloc] init];
    
    self.entitlementList = [task listEntitlementsForAppPath:appPath];
}
@end
