//
//  IndexUtility.m
//  PJ
//
//  Created by dj0708 on 15/4/27.
//  Copyright (c) 2015年 dj0708. All rights reserved.
//

#import "DataUtility.h"
#import "Reachability.h"
#import "GTMBase64.h"


@implementation DataUtility

+ (NSString *)convertNSNumber:(NSNumber *)number
{
    NSString *str = nil;
    
    if (strcmp([number objCType], @encode(int)) == 0) {
        str = [NSString stringWithFormat:@"%d", [number intValue]];
    } else if (strcmp([number objCType], @encode(float)) == 0) {
        str = [NSString stringWithFormat:@"%.2f", [number floatValue]];
    }  else if (strcmp([number objCType], @encode(double)) == 0) {
        str = [NSString stringWithFormat:@"%.2f", [number doubleValue]];
    } else if (strcmp([number objCType], @encode(long)) == 0) {
        str = [NSString stringWithFormat:@"%ld", [number longValue]];
    } else if (strcmp([number objCType], @encode(short)) == 0) {
        str = [NSString stringWithFormat:@"%d", [number shortValue]];
    }
    
    return str;
}

+ (NSArray *)convertToString:(NSArray *)array
{
    NSMutableArray *stringValueArr = [[NSMutableArray alloc] init];
    
    for (NSDictionary *dic in array) {
        NSArray *dicKeys = [dic allKeys];
        NSMutableDictionary *stringValueDic = [[NSMutableDictionary alloc] init];
        
        for (NSString *key in dicKeys) {
            NSNumber *value = [dic objectForKey:key];
            
            if ([value isKindOfClass:[NSString class]]) {
                [stringValueDic setObject:value forKey:key];
            } else if ([value isKindOfClass:[NSNull class]]) {
                [stringValueDic setObject:@"" forKey:key];
            } else {
                [stringValueDic setObject:[value stringValue] forKey:key];
            }
        }
        
        [stringValueArr addObject:stringValueDic];
    }
    
    return stringValueArr;
}

+ (NSArray *)convertToStringContainArray:(NSArray *)array
{
    NSMutableArray *stringValueArr = [[NSMutableArray alloc] init];
    
    for (NSDictionary *dic in array) {
        NSArray *dicKeys = [dic allKeys];
        NSMutableDictionary *stringValueDic = [[NSMutableDictionary alloc] init];
        
        for (NSString *key in dicKeys) {
            id value = [dic objectForKey:key];
            
            if ([value isKindOfClass:[NSString class]]) {
                [stringValueDic setObject:value forKey:key];
            } else if ([value isKindOfClass:[NSNull class]]) {
                [stringValueDic setObject:@"" forKey:key];
            } else if ([value isKindOfClass:[NSNumber class]]) {
                [stringValueDic setObject:[value stringValue] forKey:key];
            } else if ([value isKindOfClass:[NSArray class]]) {
                [stringValueDic setObject:[DataUtility convertToString:value] forKey:key];
            } else {
                
            }
        }
        
        [stringValueArr addObject:stringValueDic];
    }
    
    return stringValueArr;
}

+ (NSArray *)convertStringToNumbersArray:(NSString *)str
{
    NSMutableArray *numberArr = [[NSMutableArray alloc] init];
    
    switch ([str length]) {
        case 1:
        {
            [numberArr addObject:@"0"];
            [numberArr addObject:@"0"];
            [numberArr addObject:str];
            break;
        }
        case 2:
        {
            [numberArr addObject:@"0"];
            [numberArr addObject:[str substringWithRange:NSMakeRange(0, 1)]];
            [numberArr addObject:[str substringWithRange:NSMakeRange(1, 1)]];
            break;
        }
        case 3:
        {
            [numberArr addObject:[str substringWithRange:NSMakeRange(0, 1)]];
            [numberArr addObject:[str substringWithRange:NSMakeRange(1, 1)]];
            [numberArr addObject:[str substringWithRange:NSMakeRange(2, 1)]];
            break;
        }
            
        default:
            break;
    }
    
    return numberArr;
}

+ (NSMutableAttributedString *)attributeTextTargetRate:(id)rateNum
{
    NSString *yourString = [[NSString alloc] initWithFormat:@"%.2f%@", [rateNum doubleValue], @"%"];
    UIFont *boldFontName = [UIFont systemFontOfSize:22];
    NSRange boldedRange = NSMakeRange([yourString length] - 1, 1);
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:yourString];
    
    [attrString beginEditing];
    [attrString addAttribute:NSFontAttributeName
                       value:boldFontName
                       range:boldedRange];
    [attrString endEditing];
    return attrString;
}

+ (NSMutableAttributedString *)attributeColor:(NSString *)text
{
    NSRange boldedRange = NSMakeRange(0, 4);
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:text];
    
    [attrString beginEditing];
    [attrString addAttribute:NSForegroundColorAttributeName
                       value:[UIColor colorWithRed:153/255.0 green:153/255.0 blue:153/255.0 alpha:1.0]
                       range:boldedRange];
    [attrString endEditing];
    return attrString;    
}

+ (NSString *)valueConvertToString:(id)value
{
    if ([value isKindOfClass:[NSString class]]) {
        return value;
    } else if ([value isKindOfClass:[NSNull class]]) {
        return @"0";
    } else if ([value isKindOfClass:[NSValue class]]) {
        return [value stringValue];
    }
    
    return @"";
}

+ (NSString *)formatTargetPeriod:(id)days
{
    NSString *str = [NSString stringWithFormat:@"期限 : %@ 天", [DataUtility valueConvertToString:days]];
    return str;
}

+ (BOOL)isShouldLogin
{
    if ([[[DataUtility getAppdelegate] tokenStr] isEqualToString:[DataUtility loginAuthorization]]) {
        return YES;
    } else {
        return NO;
    }
}

+ (BOOL)isNetworkReachability
{
    BOOL isWiFiReachability = [[Reachability reachabilityForLocalWiFi] currentReachabilityStatus] != NotReachable;
    BOOL isInternetConnection = [[Reachability reachabilityForInternetConnection] currentReachabilityStatus] != NotReachable;
    
    return (isWiFiReachability || isInternetConnection);
}

+ (NSString *)indexUrlString
{
    return [NSString stringWithFormat:@"%@%@", kExternalURL, kPost_ListSection_URL];
}

+ (NSString *)requestTimes:(NSInteger)total itemNumbers:(NSInteger)itemNum
{
    // 计算会发生错误。e.g.服务器上只有3条数据，第一次取到3条。
    // 因为3/5=0...3，所以第二次取时计算错来的次数为0，又会获取三条相同数据。
    // 同理在最后一次取数据时，数据不足5条也会出错。
    int times = (int)total/(int)itemNum;
    
    return [NSString stringWithFormat:@"%d", times];
}

+ (NSArray *)parseResponseObject:(id)responseObject
{
    NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:responseObject
                                                              options:NSJSONReadingMutableLeaves
                                                                error:nil];
    NSArray *result = [resultDic objectForKey:kResponse_ListSection_Result];
    
    return result;
}

+ (AFHTTPRequestOperationManager *)requestManager
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"application/javascript", nil]];
    
    return manager;
}

+ (NSIndexPath *)loadMoreRowIndexPath:(NSArray *)datasArr
{
    return [NSIndexPath indexPathForRow:[datasArr count] inSection:0];
}

+ (UIImage *)imageWithTargetStatus:(NSInteger)intValue
{
    UIImage *image = nil;
    
    switch (intValue) {
        case 1:
        case 2:
            image = [UIImage imageNamed:@"selling"];
            break;
        case 3:
            image = [UIImage imageNamed:@"target_returning"];
            break;
        case 4:
            image = [UIImage imageNamed:@"target_paying"];
            break;
        case 5:
        case 6:
            image = [UIImage imageNamed:@"target_paied"];
            break;
        default:
            break;
    }
    
    return image;
}

+ (void)demostrateLogin
{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setObject:@"yes" forKey:@"loginstate"];
    [ud synchronize];
}

+ (void)demostrateLogout
{
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setObject:@"no" forKey:@"loginstate"];
    [ud synchronize];

}

+ (NSString *)jsonString:(NSString *)keyStr value:(NSString *)valueStr
{
    NSString *str = [NSString stringWithFormat:@"\"%@\":\"%@\"", keyStr, valueStr];
    
    return str;
}

+ (AppDelegate *)getAppdelegate
{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

+ (NSString *)errorMessage:(NSError *)error
{
    NSData *errorMsgData = [[error userInfo] objectForKey:kKey_responseErrorData];
    if (errorMsgData) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:errorMsgData
                                                             options:NSJSONReadingMutableContainers
                                                               error:nil];
        NSString *invalidToken = [dict objectForKey:@"error"];
        NSString *errorMsg = [dict objectForKey:@"errorMessage"];

        if (invalidToken.length > 0)
            return @"invalid_token";
        
        if ([errorMsg isKindOfClass:[NSNull class]])
            return @"";
        
        if (errorMsg.length > 0) {
            return errorMsg;
        } else {
            return @"";
        }
    }
    
    return @"";
}

+ (UIButton *)redBackGroundButton:(CGRect)frame withAction:(SEL)action target:(id)target
{
    UIButton *btn = [[UIButton alloc] initWithFrame:frame];
    btn.userInteractionEnabled = NO;
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor = kColor_disableButton;
    btn.layer.cornerRadius = 5;
    return btn;
}

+ (UILabel *)labelOnRedBackGround:(CGRect)frame withText:(NSString *)text
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:17];
    label.text = text;
    return label;
}

+ (UILabel *)underLineLabel:(CGRect)frame withText:(NSString *)text
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:text];
    [attributeString addAttribute:NSUnderlineStyleAttributeName
                            value:[NSNumber numberWithInt:1]
                            range:(NSRange){0,[attributeString length]}];
    label.attributedText = attributeString;
    label.font = [UIFont systemFontOfSize:15];
    label.textColor = kColor_underLine;
    return label;
}

+ (NSString *)formatDate:(NSString *)date
{
    NSArray *componets = [date componentsSeparatedByString:@" "];
    if ([componets count] > 0)
        return [componets objectAtIndex:0];
    else
        return @"";
}

+ (NSString *)formatMoney:(id)money
{
    NSString *value = [DataUtility valueConvertToString:money];
    NSNumber *doubleNum = [[NSNumber alloc] initWithDouble:[value doubleValue]];
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    [numberFormatter setCurrencySymbol:@""];
    NSString *numberAsString = [numberFormatter stringFromNumber:doubleNum];
    [numberAsString stringByReplacingOccurrencesOfString:@" " withString:@""];
    return numberAsString;
}

+ (NSString *)formatTargetRemainedMoney:(id)money
{
    NSString *value = [DataUtility valueConvertToString:money];
    NSNumber* number = [[NSNumber alloc] initWithLongLong:[value longLongValue]];
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [numberFormatter setGroupingSeparator:@","];
    NSString *commaString = [numberFormatter stringForObjectValue:number];
    return commaString;
}

+ (CGSize)labelSize:(UILabel *)label withText:(NSString *)text
{
    CGSize expectedLabelSize = [text sizeWithFont:label.font
                                constrainedToSize:CGSizeMake(kMSScreenWith, 30)
                                    lineBreakMode:label.lineBreakMode];
    
    return expectedLabelSize;
}

+ (NSString *)formatProgressText:(NSString *)remainMoney
{
    if ([remainMoney isEqualToString:@"0.00"]) {
        return @"赚钱中 ...";
    } else {
        return @"仅剩 : ";
    }
}

+ (CGRect)progressTextFame:(UILabel *)label
{
    CGRect frame = label.frame;
    CGSize size = [DataUtility labelSize:label withText:label.text];
    return CGRectMake(frame.origin.x, frame.origin.y, size.width, frame.size.height);
}

+ (CGRect)progressFrame:(UILabel *)label total:(float)total remain:(float)remain
{
    CGRect frame = label.frame;
    
    if (remain/total == 1)
        label.hidden = YES;
    else
        label.hidden = NO;
    
    return CGRectMake(frame.origin.x, frame.origin.y, frame.size.width *  remain/total, frame.size.height);
}

+ (void)hideMoneyLabel:(UILabel *)money
{
    if ([money.text isEqualToString:@"0.00"])
        money.hidden = YES;
}

+ (void)customLeftBarItem:(UIViewController *)target selctor:(SEL)selector
{
    UIImage *buttonImage = [UIImage imageNamed:@"nav_back"];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:buttonImage forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 0, buttonImage.size.width, buttonImage.size.height);
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *customBarItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    target.navigationItem.leftBarButtonItem = customBarItem;
}

+ (AFHTTPRequestOperation *)httpUrlOperation:(void(^)(AFHTTPRequestOperation *operation, id responseObject))succussBlock
                                failureBlock:(void(^)(AFHTTPRequestOperation *operation, NSError *error))failureBlock
                                     request:(NSURLRequest *)request
{
    AFHTTPRequestOperation *op = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    op.responseSerializer = [AFJSONResponseSerializer serializer];
    [op setCompletionBlockWithSuccess:succussBlock
                              failure:failureBlock];
    return op;
}

+ (NSMutableDictionary *)dictionaryConvertToString:(NSDictionary *)dic
{
    NSMutableDictionary *stringValueDic = [[NSMutableDictionary alloc] init];

    for (id key in [dic allKeys]) {
        id value = [dic objectForKey:key];
        
        if ([value isKindOfClass:[NSString class]]) {
            [stringValueDic setObject:value forKey:key];
        } else if ([value isKindOfClass:[NSNull class]]) {
            [stringValueDic setObject:@"" forKey:key];
        } else {
            [stringValueDic setObject:[value stringValue] forKey:key];
        }
    }
    
    return stringValueDic;
}

+ (NSString *)httpBody:(NSDictionary *)dic
{
    NSString *body = @"{";
    NSMutableArray *jsonArr = [[NSMutableArray alloc] init];
    
    for (NSString *key in [dic allKeys]) {
        NSString *json_string = [DataUtility jsonString:key value:[dic objectForKey:key]];
        [jsonArr addObject:json_string];
    }
    
    for (int i = 0; i < [jsonArr count]; i++) {
        body = [body stringByAppendingString:[jsonArr objectAtIndex:i]];
        body = [body stringByAppendingString:@","];
        
        if (i == [jsonArr count] - 1) {
            body = [body substringToIndex:[body length] - 1];
            body = [body stringByAppendingString:@"}"];
        }
    }
    
    return body;
}

+ (NSString *)formatBankCard:(NSString *)str
{
    if (str.length < 8)
        return @"";
    NSString *headStr = [str substringWithRange:NSMakeRange(0, 4)];
    NSString *tailStr = [str substringWithRange:NSMakeRange([str length] - 4, 4)];
    
    return [NSString stringWithFormat:@"%@****%@", headStr, tailStr];
}

+ (NSString *)formatMobilePhone:(NSString *)str
{
    if (str.length < 7)
        return @"";
    NSString *headStr = [str substringWithRange:NSMakeRange(0, 3)];
    NSString *tailStr = [str substringWithRange:NSMakeRange([str length] - 4, 4)];
    
    return [NSString stringWithFormat:@"%@****%@", headStr, tailStr];
}

+ (NSString *)formatName:(NSString *)nameStr
{
    if (nameStr.length < 2)
        return nameStr;
    NSString *headStr = [nameStr substringWithRange:NSMakeRange(0, 1)];
    NSString *tailStr = @"";
    
    for (int i = 0; i < [nameStr length] - 1; i++) {
        tailStr = [tailStr stringByAppendingString:@"*"];
    }
    
    return [NSString stringWithFormat:@"%@%@", headStr, tailStr];
}

+ (NSString *)formatIdentifier:(NSString *)idStr
{
    if (idStr.length < 10)
        return idStr;
    NSString *headStr = [idStr substringWithRange:NSMakeRange(0, 6)];
    NSString *tailStr = [idStr substringWithRange:NSMakeRange([idStr length] - 4, 4)];
    return [NSString stringWithFormat:@"%@******%@", headStr, tailStr];
}

+ (NSArray *)plistBankList
{
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"bank_list" ofType:@"plist"];
    NSArray *contentArray = [NSArray arrayWithContentsOfFile:plistPath];
    return contentArray;
}

+ (NSMutableDictionary *)mutableDictionaryAddObjects:(NSDictionary *)dic
{
    NSMutableDictionary *mutableDic = [[NSMutableDictionary alloc] init];
    
    for (id key in [dic allKeys]) {
        [mutableDic setObject:[dic objectForKey:key] forKey:key];
    }
    
    return mutableDic;
}

+ (NSString *)loginAuthorization
{
    NSString *clientId = kLoginClientId;
    NSString *secret = kLoginSecret;
    NSString *originalStr = [NSString stringWithFormat:@"%@:%@", clientId, secret];
    NSString *encodedStr = [GTMBase64 stringByEncodingData:[originalStr dataUsingEncoding:NSUTF8StringEncoding]];
    return [NSString stringWithFormat:@"Basic %@", encodedStr];
}

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

+ (NSString *)bundleApplicationVersion
{
    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    return version;
}

+ (NSString *)revenueMoneyFrom:(NSString *)investMoney annualRate:(NSString *)rate deadLine:(NSString *)deadLine
{
    //    公式：年化收益*期限*金额/360/100;
    
    float revenue = [deadLine floatValue] * [rate floatValue] * [investMoney floatValue] / 360 / 100;
    NSString *revenueMoney = [DataUtility formatMoney:[NSString stringWithFormat:@"%.2f", roundf(revenue*100)/100]];
    return revenueMoney;
}

+ (NSString *)appVersion
{
    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    return version;
}

@end
