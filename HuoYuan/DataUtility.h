//
//  IndexUtility.h
//  PJ
//
//  Created by dj0708 on 15/4/27.
//  Copyright (c) 2015年 dj0708. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"

typedef enum : NSUInteger {
    UDValueBoolType,
    UDValueStringType,
} UsertDefaultValueType;

#define kUDValueTrue            @"true"
#define kUDValueFalse           @"false"

@interface DataUtility : NSObject

+ (NSString *)getUserDefault:(NSString *)key type:(UsertDefaultValueType)type;
+ (void)setUserDefault:(NSString *)value key:(NSString *)key type:(UsertDefaultValueType)type;
+ (AppDelegate *)getAppdelegate;

@end
