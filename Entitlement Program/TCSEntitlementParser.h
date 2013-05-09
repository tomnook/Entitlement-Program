//
//  TCSEntitlementParser.h
//  Entitlement Program
//
//  Created by Twocanoes Software
//  Copyright (c) 2013 Twocanoes Software, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>


#define kCodesignPath  @"/usr/bin/codesign"

@interface TCSEntitlementParser : NSObject

- (NSDictionary *)listEntitlementsForAppPath:(NSString *)appURL;

@end
