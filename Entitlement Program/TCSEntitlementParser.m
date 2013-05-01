//
//  TCSEntitlementParser.m
//  Entitlement Program
//
//  Created by Twocanoes Software on 1/9/13.
//  Copyright (c) 2013 Twocanoes Software, Inc. All rights reserved.
//

#import "TCSEntitlementParser.h"

@interface TCSEntitlementParser ()

@property NSString *tempPath;

@end


@implementation TCSEntitlementParser

#pragma mark - Private Methods

// 10.7 Compatible method to get a UUID
- (NSString *)getUUID {
    CFUUIDRef theUUID = CFUUIDCreate(NULL);
    CFStringRef string = CFUUIDCreateString(NULL, theUUID);
    CFRelease(theUUID);
    return (__bridge_transfer NSString *)string;
}

// This method will create a temp folder in the user's current temp directory
// The new temp folder will be named with the current process GUID.
- (void)createTempFolder {
    // Find out temp path and save it
    self.tempPath = [NSTemporaryDirectory() stringByAppendingPathComponent: [[NSProcessInfo processInfo] globallyUniqueString]];
    
    // Create our temp folder
    NSError *theError = nil;
    if (![[NSFileManager defaultManager] createDirectoryAtPath:self.tempPath withIntermediateDirectories:NO attributes:nil error:&theError]) {
        NSLog(@"Couldn't make the temp directory: %@", [theError localizedDescription]);
    }
}

#pragma mark - Public Methods



// Override init and create a temp folder if it isn't there
- (id)init {
    self = [super init];
    if (self) {
        
        [self createTempFolder];
        
        return self;
    }
    
    return nil;
}

- (NSDictionary *)listEntitlementsForAppPath:(NSString *)appPath {
    
    // Create a task
    NSTask *codesign = [[NSTask alloc] init];
 
    // Get the temp file
    NSString *tempFile = [NSString stringWithFormat:@"%@/%@.plist", self.tempPath, [self getUUID]];
    
    // Configure the task
    [codesign setLaunchPath:kCodesignPath];
    [codesign setArguments:@[@"--display", @"--entitlements", [NSString stringWithFormat:@":%@", tempFile], appPath]];
    
    
    // Launch the task
    [codesign launch];
    [codesign waitUntilExit];
  
    // Build and return our dictionary if we made it.
    if (tempFile) {
        NSDictionary *entitlementDict = [NSDictionary dictionaryWithContentsOfFile:tempFile];
        NSDictionary *entitlementKeys = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"entitlementKeys" ofType:@"plist" ]];
        
        
    } else {
        NSLog(@"%@ is not sandboxed", [appPath lastPathComponent]);
        return nil;
    }


    
}

@end