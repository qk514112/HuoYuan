//
//  SettingDefaultPage.m
//  HuoYuan
//
//  Created by dj0708 on 16/1/12.
//  Copyright © 2016年 dj0708. All rights reserved.
//

#import "SettingDefaultPage.h"

#define kMSScreenWith          CGRectGetWidth([UIScreen mainScreen].applicationFrame)
#define kMSScreenHeight        CGRectGetHeight([UIScreen mainScreen].bounds)

@interface SettingDefaultPage ()

@end

@implementation SettingDefaultPage

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"设置默认页";
    self.view.backgroundColor = [UIColor whiteColor];
    [self addQRCodeRow];
    [self addMobilePhoneRow];
    [self addAPITestPageRow];
}

- (void)addQRCodeRow
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(15, 64 + 15, kMSScreenWith - 30, 44)];
    [view.layer setCornerRadius:5.0f];
    [view.layer setBorderColor:[UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1.0].CGColor];
    [view.layer setBorderWidth:0.5f];
    view.clipsToBounds = YES;
    [self.view addSubview:view];

    UIButton *qrcodeRowBtn = [[UIButton alloc] initWithFrame:CGRectMake(0.5, 0, view.frame.size.width - 1, 44)];
    [qrcodeRowBtn setBackgroundImage:[self imageWithColor:[UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0]] forState:UIControlStateHighlighted];
    [qrcodeRowBtn setBackgroundImage:[self imageWithColor:[UIColor clearColor]] forState:UIControlStateNormal];
    [qrcodeRowBtn addTarget:self action:@selector(actionQRCode:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:qrcodeRowBtn];
    
    [self addQRCodeLabel:view];
}

- (void)addQRCodeLabel:(UIView *)view
{
    UIButton *bankCardImage = [[UIButton alloc] initWithFrame:CGRectMake(8.5, 7, 30, 30)];
    [bankCardImage setImage:[UIImage imageNamed:@"icon_qrcode"] forState:UIControlStateNormal];
    [view addSubview:bankCardImage];
    
    UILabel *note = [[UILabel alloc] initWithFrame:CGRectMake(45, 0, kMSScreenWith - 75, 44)];
    note.text = @"扫描二维码或条形码";
    note.font = [UIFont systemFontOfSize:15];
    note.textColor = [UIColor colorWithRed:97/255.0 green:100/255.0 blue:109/255.0 alpha:1.0];
    [view addSubview:note];
    
    UIButton *rightIcon = [[UIButton alloc] initWithFrame:CGRectMake(view.frame.size.width - 30, 0, 30, 44)];
    [rightIcon setImage:[UIImage imageNamed:@"icon_row_right"] forState:UIControlStateNormal];
    [view addSubview:rightIcon];
}

- (void)addMobilePhoneRow
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(15, 64 + 74, kMSScreenWith - 30, 44)];
    [view.layer setCornerRadius:5.0f];
    [view.layer setBorderColor:[UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1.0].CGColor];
    [view.layer setBorderWidth:0.5f];
    view.clipsToBounds = YES;
    [self.view addSubview:view];
    
    UIButton *mobilePhoneBtn = [[UIButton alloc] initWithFrame:CGRectMake(0.5, 0, view.frame.size.width - 1, 44)];
    [mobilePhoneBtn setBackgroundImage:[self imageWithColor:[UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0]] forState:UIControlStateHighlighted];
    [mobilePhoneBtn setBackgroundImage:[self imageWithColor:[UIColor clearColor]] forState:UIControlStateNormal];
    [mobilePhoneBtn addTarget:self action:@selector(actionQRCode:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:mobilePhoneBtn];
    
    [self addMobilePhoneLabel:view];
}

- (void)addMobilePhoneLabel:(UIView *)view
{
    UIButton *bankCardImage = [[UIButton alloc] initWithFrame:CGRectMake(8.5, 7, 30, 30)];
    [bankCardImage setImage:[UIImage imageNamed:@"icon_mobile_phone"] forState:UIControlStateNormal];
    [view addSubview:bankCardImage];
    
    UILabel *note = [[UILabel alloc] initWithFrame:CGRectMake(45, 0, kMSScreenWith - 75, 44)];
    note.text = @"使用注册的手机号码定位首页";
    note.font = [UIFont systemFontOfSize:15];
    note.textColor = [UIColor colorWithRed:97/255.0 green:100/255.0 blue:109/255.0 alpha:1.0];
    [view addSubview:note];
    
    UIButton *rightIcon = [[UIButton alloc] initWithFrame:CGRectMake(view.frame.size.width - 30, 0, 30, 44)];
    [rightIcon setImage:[UIImage imageNamed:@"icon_row_right"] forState:UIControlStateNormal];
    [view addSubview:rightIcon];
}

- (void)addAPITestPageRow
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(15, 64 + 133, kMSScreenWith - 30, 44)];
    [view.layer setCornerRadius:5.0f];
    [view.layer setBorderColor:[UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1.0].CGColor];
    [view.layer setBorderWidth:0.5f];
    view.clipsToBounds = YES;
    [self.view addSubview:view];
    
    UIButton *mobilePhoneBtn = [[UIButton alloc] initWithFrame:CGRectMake(0.5, 0, view.frame.size.width - 1, 44)];
    [mobilePhoneBtn setBackgroundImage:[self imageWithColor:[UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0]] forState:UIControlStateHighlighted];
    [mobilePhoneBtn setBackgroundImage:[self imageWithColor:[UIColor clearColor]] forState:UIControlStateNormal];
    [mobilePhoneBtn addTarget:self action:@selector(actionQRCode:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:mobilePhoneBtn];
    
    [self addAPITestPageLabel:view];
}

- (void)addAPITestPageLabel:(UIView *)view
{
    UIButton *bankCardImage = [[UIButton alloc] initWithFrame:CGRectMake(8.5, 7, 30, 30)];
    [bankCardImage setImage:[UIImage imageNamed:@"icon_api_test"] forState:UIControlStateNormal];
    [view addSubview:bankCardImage];
    
    UILabel *note = [[UILabel alloc] initWithFrame:CGRectMake(45, 0, kMSScreenWith - 75, 44)];
    note.text = @"网页接口测试页面";
    note.font = [UIFont systemFontOfSize:15];
    note.textColor = [UIColor colorWithRed:97/255.0 green:100/255.0 blue:109/255.0 alpha:1.0];
    [view addSubview:note];
    
    UIButton *rightIcon = [[UIButton alloc] initWithFrame:CGRectMake(view.frame.size.width - 30, 0, 30, 44)];
    [rightIcon setImage:[UIImage imageNamed:@"icon_row_right"] forState:UIControlStateNormal];
    [view addSubview:rightIcon];
}

- (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

#pragma mark action

- (void)actionQRCode:(id)sender
{
    
}

@end
