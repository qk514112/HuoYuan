//
//  DealPasswordView.m
//  PJ
//
//  Created by dj0708 on 15/12/24.
//  Copyright © 2015年 dj0708. All rights reserved.
//

#import "DealPasswordView.h"

#import "DataUtility.h"

@interface DealPasswordView ()

@property (nonatomic, strong) UIView                 *dealPwdInput;
@property (nonatomic, strong) UIButton               *dealPwdInputBg;
@property (nonatomic, strong) UITextField            *textField;

@end

@implementation DealPasswordView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addBlackTranslucentBackground];
        [self addDealPwdInput];
        [self dealPasswordViewDisplay:NO];
    }
    return self;
}

- (void)dealPasswordViewDisplay:(BOOL)isShow
{
    if (isShow) {
        self.dealPwdInput.hidden = NO;
        self.dealPwdInputBg.hidden = NO;
        self.textField.text = @"";
        [self.textField becomeFirstResponder];
    } else {
        self.dealPwdInput.hidden = YES;
        self.dealPwdInputBg.hidden = YES;
        [self.textField resignFirstResponder];
    }
}

- (void)addBlackTranslucentBackground
{
    self.dealPwdInputBg = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, kMSScreenWidth, kMSScreenHeight)];
    self.dealPwdInputBg.alpha = 0.4;
    [self.dealPwdInputBg addTarget:self action:@selector(actionTranslucentButton:) forControlEvents:UIControlEventTouchUpInside];
    self.dealPwdInputBg.backgroundColor = [UIColor blackColor];
    [[[DataUtility getAppdelegate] window] addSubview:self.dealPwdInputBg];
}

- (void)addDealPwdInput
{
    self.dealPwdInput = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 270, 165)];
    self.dealPwdInput.center = CGPointMake(kMSScreenWidth/2, kMSScreenHeight/2 - 65);
    self.dealPwdInput.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.95];
    self.dealPwdInput.layer.cornerRadius = 5.0;
    [[[DataUtility getAppdelegate] window] addSubview:self.dealPwdInput];
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 121, 270, 0.5)];
    line.backgroundColor = [UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1.0];
    [self.dealPwdInput addSubview:line];
    
    UIButton *okBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 121.5, 270, 43.5)];
    [okBtn setTitle:@"确认" forState:UIControlStateNormal];
    [okBtn setTitleColor:[UIColor colorWithRed:208/255.0 green:16/255.0 blue:44/255.0 alpha:1.0] forState:UIControlStateNormal];
    [okBtn setTitleColor:[UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    [okBtn addTarget:self action:@selector(actionPasswordOkButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.dealPwdInput addSubview:okBtn];
    
    // Version -- No title icon.
//    UIImageView *phoneImgView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 23.5, 16, 17)];
//    phoneImgView.image = [UIImage imageNamed:@"phone_alert_title_icon"];
//    [self.dealPwdInput addSubview:phoneImgView];
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 15.5, 270, 34)];
    title.textAlignment = NSTextAlignmentCenter;
    title.textColor = kBlackColor;
    title.font = [UIFont systemFontOfSize:17];
    title.text = @"请输入手机号码";
    [self.dealPwdInput addSubview:title];
    
    UIButton *closeBtn = [[UIButton alloc] initWithFrame:CGRectMake(226.5, 5.5, 45, 30)];
    [closeBtn setImage:[UIImage imageNamed:@"bankcardclose"] forState:UIControlStateNormal];
    [closeBtn addTarget:self action:@selector(actionPasswordCloseButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.dealPwdInput addSubview:closeBtn];
    
    UIView *inputBg = [[UIView alloc] initWithFrame:CGRectMake(15, 54, 240, 44)];
    inputBg.layer.cornerRadius = 5.0;
    inputBg.layer.borderWidth = 0.5;
    inputBg.layer.borderColor = [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1.0].CGColor;
    [self.dealPwdInput addSubview:inputBg];
    
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 0, 230, 44)];
    self.textField.textColor = kBlackColor;
    self.textField.tintColor = [UIColor colorWithRed:208/255.0 green:16/255.0 blue:44/255.0 alpha:1.0];
    self.textField.keyboardType = UIKeyboardTypePhonePad;
    [inputBg addSubview:self.textField];
}

- (void)showDealPassword:(BOOL)show
{
    [self dealPasswordViewDisplay:show];
}

- (void)removeDealPasswordView
{
    [self.dealPwdInput removeFromSuperview];
    [self.dealPwdInputBg removeFromSuperview];
}

- (NSString *)getDealPassword
{
    return self.textField.text;
}

#pragma mark action

- (void)actionTranslucentButton:(id)sender
{
    [self dealPasswordViewDisplay:NO];
}

- (void)actionPasswordOkButton:(id)sender
{
    [self dealPasswordViewDisplay:NO];

    if ( [self.delegate respondsToSelector:@selector(callBackDealPasswordOKButton)] ) {
        [self.delegate callBackDealPasswordOKButton];
    }
}

- (void)actionPasswordCloseButton:(id)sender
{
    [self dealPasswordViewDisplay:NO];
}

@end
