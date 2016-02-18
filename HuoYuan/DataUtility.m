//
//  IndexUtility.m
//  PJ
//
//  Created by dj0708 on 15/4/27.
//  Copyright (c) 2015年 dj0708. All rights reserved.
//

#import "DataUtility.h"

@implementation DataUtility

+ (NSString *)userDefaultGetString:(NSString *)key
{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSString *value = [ud objectForKey:key];
    return value;
}

+ (void)userDefaultSetString:(NSString *)value withKey:(NSString *)key
{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setObject:value forKey:key];
    [ud synchronize];
}

+ (BOOL)userDefaultGetBool:(NSString *)key
{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    BOOL value = [ud boolForKey:key];
    return value;
}

+ (void)userDefaultSetBool:(BOOL)value withKey:(NSString *)key
{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setBool:value forKey:key];
    [ud synchronize];
}

+ (NSString *)getUserDefault:(NSString *)key type:(UsertDefaultValueType)type
{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    switch (type) {
        case UDValueBoolType: {
            BOOL value = [ud boolForKey:key];
            
            if (value) {
                return kUDValueTrue;
            } else {
                return kUDValueFalse;
            }
        }
        case UDValueStringType:
            return [ud objectForKey:key];
    }
}

+ (void)setUserDefault:(NSString *)value key:key type:(UsertDefaultValueType)type
{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    switch (type) {
        case UDValueBoolType: {
            BOOL boolValue = NO;
            
            if ([value isEqualToString:kUDValueTrue]) {
                boolValue = YES;
            } else if ([value isEqualToString:kUDValueFalse]) {
                boolValue = NO;
            }
                
            [ud setBool:boolValue forKey:key];
            break;
        }
        case UDValueStringType:
            [ud setObject:value forKey:key];
            break;
    }
    [ud synchronize];
}

@end
