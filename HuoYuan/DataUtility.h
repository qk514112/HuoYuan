//
//  IndexUtility.h
//  PJ
//
//  Created by dj0708 on 15/4/27.
//  Copyright (c) 2015年 dj0708. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
#import "AppDelegate.h"


@interface DataUtility : NSObject

+ (NSString *)convertNSNumber:(NSNumber *)number;
+ (NSArray *)convertToString:(NSArray *)array;
+ (NSArray *)convertToStringContainArray:(NSArray *)array;
+ (NSArray *)convertStringToNumbersArray:(NSString *)str;
+ (NSMutableAttributedString *)attributeTextTargetRate:(id)rateNum;
+ (NSMutableAttributedString *)attributeColor:(NSString *)text;
+ (NSString *)formatTargetPeriod:(id)days;
+ (BOOL)isShouldLogin;
+ (BOOL)isNetworkReachability;
+ (NSString *)indexUrlString;
+ (NSString *)requestTimes:(NSInteger)total itemNumbers:(NSInteger)itemNum;
+ (NSArray *)parseResponseObject:(id)responseObject;
+ (AFHTTPRequestOperationManager *)requestManager;
+ (NSIndexPath *)loadMoreRowIndexPath:(NSArray *)datasArr;
+ (UIImage *)imageWithTargetStatus:(NSInteger)intValue;
+ (void)demostrateLogin;
+ (void)demostrateLogout;
+ (NSString *)jsonString:(NSString *)keyStr value:(NSString *)valueStr;
+ (AppDelegate *)getAppdelegate;
+ (NSString *)errorMessage:(NSError *)error;
+ (UIButton *)redBackGroundButton:(CGRect)frame withAction:(SEL)action target:(id)target;
+ (UILabel *)labelOnRedBackGround:(CGRect)frame withText:(NSString *)text;
+ (UILabel *)underLineLabel:(CGRect)frame withText:(NSString *)text;
+ (NSString *)formatDate:(NSString *)date;
+ (NSString *)formatMoney:(id)money;
+ (NSString *)formatTargetRemainedMoney:(id)money;
+ (CGSize)labelSize:(UILabel *)label withText:(NSString *)text;
+ (NSString *)formatProgressText:(NSString *)remainMoney;
//+ (float)progress:(float)total remain:(float)remain;
+ (CGRect)progressTextFame:(UILabel *)label;
+ (CGRect)progressFrame:(UILabel *)label total:(float)total remain:(float)remain;
+ (void)hideMoneyLabel:(UILabel *)money;
+ (void)customLeftBarItem:(UIViewController *)target selctor:(SEL)selector;
+ (AFHTTPRequestOperation *)httpUrlOperation:(void(^)(AFHTTPRequestOperation *operation, id responseObject))succussBlock
                                failureBlock:(void(^)(AFHTTPRequestOperation *operation, NSError *error))failureBlock
                                     request:(NSURLRequest *)request;
+ (NSMutableDictionary *)dictionaryConvertToString:(NSDictionary *)dic;
+ (NSString *)httpBody:(NSDictionary *)dic;
+ (NSString *)formatBankCard:(NSString *)str;
+ (NSString *)formatMobilePhone:(NSString *)str;
+ (NSString *)formatName:(NSString *)nameStr;
+ (NSString *)formatIdentifier:(NSString *)idStr;
+ (NSArray *)plistBankList;
+ (NSMutableDictionary *)mutableDictionaryAddObjects:(NSDictionary *)dic;
+ (NSString *)loginAuthorization;
+ (NSString *)userDefaultGetString:(NSString *)key;
+ (void)userDefaultSetString:(NSString *)value withKey:(NSString *)key;
+ (BOOL)userDefaultGetBool:(NSString *)key;
+ (void)userDefaultSetBool:(BOOL)value withKey:(NSString *)key;
+ (NSString *)bundleApplicationVersion;
+ (NSString *)revenueMoneyFrom:(NSString *)invest annualRate:(NSString *)rate deadLine:(NSString *)deadLine;
+ (NSString *)appVersion;

@end
