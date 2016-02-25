//
//  SettingDefaultPage.m
//  HuoYuan
//
//  Created by dj0708 on 16/1/12.
//  Copyright © 2016年 dj0708. All rights reserved.
//

#import "SettingDefaultPage.h"

#import "ZBarSDK.h"

#import "ViewUtility.h"

#import "DealPasswordView.h"
#import "WebViewController.h"

@interface SettingDefaultPage () <DealPasswordDelegate, ZBarReaderDelegate>

@property (nonatomic, strong) UIView                 *rememberOperationView;
@property (nonatomic, strong) UIButton               *rememberBtn;
@property (nonatomic, strong) DealPasswordView       *dealPwdView;

@end

@implementation SettingDefaultPage

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"设置默认页";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:kBlackColor}];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addQRCodeRow];
    [self addMobilePhoneRow];
    [self addAPITestPageRow];
    [self addRememberOperationView];
    [self addCopyRightLabel];
    [self addDealPwdInput];
}

- (void)addQRCodeRow
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(15, 64 + 15, kMSScreenWidth - 30, 44)];
    [view.layer setCornerRadius:5.0f];
    [view.layer setBorderColor:[UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1.0].CGColor];
    [view.layer setBorderWidth:0.5f];
    view.clipsToBounds = YES;
    [self.view addSubview:view];

    UIButton *qrcodeRowBtn = [[UIButton alloc] initWithFrame:CGRectMake(0.5, 0, view.frame.size.width - 1, 44)];
    [qrcodeRowBtn setBackgroundImage:[ViewUtility imageWithColor:[UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0]] forState:UIControlStateHighlighted];
    [qrcodeRowBtn setBackgroundImage:[ViewUtility imageWithColor:[UIColor clearColor]] forState:UIControlStateNormal];
    [qrcodeRowBtn addTarget:self action:@selector(actionQRCode:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:qrcodeRowBtn];
    
    [self addQRCodeLabel:view];
}

- (void)addQRCodeLabel:(UIView *)view
{
    UIButton *bankCardImage = [[UIButton alloc] initWithFrame:CGRectMake(8.5, 7, 30, 30)];
    [bankCardImage setImage:[UIImage imageNamed:@"icon_qrcode"] forState:UIControlStateNormal];
    [view addSubview:bankCardImage];
    
    UILabel *note = [[UILabel alloc] initWithFrame:CGRectMake(45, 0, kMSScreenWidth - 75, 44)];
    note.text = @"扫描二维码或条形码";
    note.font = [UIFont systemFontOfSize:15];
    note.textColor = kBlackColor;
    [view addSubview:note];
    
    UIButton *rightIcon = [[UIButton alloc] initWithFrame:CGRectMake(view.frame.size.width - 30, 0, 30, 44)];
    [rightIcon setImage:[UIImage imageNamed:@"icon_row_right"] forState:UIControlStateNormal];
    [view addSubview:rightIcon];
}

- (void)addMobilePhoneRow
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(15, 64 + 74, kMSScreenWidth - 30, 44)];
    [view.layer setCornerRadius:5.0f];
    [view.layer setBorderColor:[UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1.0].CGColor];
    [view.layer setBorderWidth:0.5f];
    view.clipsToBounds = YES;
    [self.view addSubview:view];
    
    UIButton *mobilePhoneBtn = [[UIButton alloc] initWithFrame:CGRectMake(0.5, 0, view.frame.size.width - 1, 44)];
    [mobilePhoneBtn setBackgroundImage:[ViewUtility imageWithColor:[UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0]] forState:UIControlStateHighlighted];
    [mobilePhoneBtn setBackgroundImage:[ViewUtility imageWithColor:[UIColor clearColor]] forState:UIControlStateNormal];
    [mobilePhoneBtn addTarget:self action:@selector(actionMobilePhone:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:mobilePhoneBtn];
    
    [self addMobilePhoneLabel:view];
}

- (void)addMobilePhoneLabel:(UIView *)view
{
    UIButton *mobilePhoneBtn = [[UIButton alloc] initWithFrame:CGRectMake(8.5, 7, 30, 30)];
    [mobilePhoneBtn setImage:[UIImage imageNamed:@"icon_mobile_phone"] forState:UIControlStateNormal];
    [view addSubview:mobilePhoneBtn];
    
    UILabel *note = [[UILabel alloc] initWithFrame:CGRectMake(45, 0, kMSScreenWidth - 75, 44)];
    note.text = @"使用注册的手机号码定位首页";
    note.font = [UIFont systemFontOfSize:15];
    note.textColor = kBlackColor;
    [view addSubview:note];
    
    UIButton *rightIcon = [[UIButton alloc] initWithFrame:CGRectMake(view.frame.size.width - 30, 0, 30, 44)];
    [rightIcon setImage:[UIImage imageNamed:@"icon_row_right"] forState:UIControlStateNormal];
    [view addSubview:rightIcon];
}

- (void)addAPITestPageRow
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(15, 64 + 133, kMSScreenWidth - 30, 44)];
    [view.layer setCornerRadius:5.0f];
    [view.layer setBorderColor:[UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1.0].CGColor];
    [view.layer setBorderWidth:0.5f];
    view.clipsToBounds = YES;
    [self.view addSubview:view];
    
    UIButton *mobilePhoneBtn = [[UIButton alloc] initWithFrame:CGRectMake(0.5, 0, view.frame.size.width - 1, 44)];
    [mobilePhoneBtn setBackgroundImage:[ViewUtility imageWithColor:[UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0]] forState:UIControlStateHighlighted];
    [mobilePhoneBtn setBackgroundImage:[ViewUtility imageWithColor:[UIColor clearColor]] forState:UIControlStateNormal];
    [mobilePhoneBtn addTarget:self action:@selector(actionAPITestPage:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:mobilePhoneBtn];
    
    [self addAPITestPageLabel:view];
}

- (void)addAPITestPageLabel:(UIView *)view
{
    UIButton *bankCardImage = [[UIButton alloc] initWithFrame:CGRectMake(8.5, 7, 30, 30)];
    [bankCardImage setImage:[UIImage imageNamed:@"icon_api_test"] forState:UIControlStateNormal];
    [view addSubview:bankCardImage];
    
    UILabel *note = [[UILabel alloc] initWithFrame:CGRectMake(45, 0, kMSScreenWidth - 75, 44)];
    note.text = @"网页接口测试页面";
    note.font = [UIFont systemFontOfSize:15];
    note.textColor = kBlackColor;
    [view addSubview:note];
    
    UIButton *rightIcon = [[UIButton alloc] initWithFrame:CGRectMake(view.frame.size.width - 30, 0, 30, 44)];
    [rightIcon setImage:[UIImage imageNamed:@"icon_row_right"] forState:UIControlStateNormal];
    [view addSubview:rightIcon];
}

- (void)addRememberOperationView
{
    float width = 120;
    self.rememberOperationView = [[UIView alloc] initWithFrame:CGRectMake((kMSScreenWidth - width)/2, kMSScreenHeight - 60, width, 30)];
    [self.view addSubview:self.rememberOperationView];
    
    [self addRememberIconButton:self.rememberOperationView];
    [self addRememberNoteView:self.rememberOperationView];
}

- (void)addRememberIconButton:(UIView *)superView
{
    self.rememberBtn = [[UIButton alloc] initWithFrame:CGRectMake(17.5, 0, 22, superView.frame.size.height)];
    [self.rememberBtn setImage:[UIImage imageNamed:@"cardcheck_selected"] forState:UIControlStateSelected];
    [self.rememberBtn setImage:[UIImage imageNamed:@"cardcheck_normor"] forState:UIControlStateNormal];
    [self.rememberBtn addTarget:self action:@selector(actionRememberButton:) forControlEvents:UIControlEventTouchUpInside];
    self.rememberBtn.selected = YES;
    [superView addSubview:self.rememberBtn];
}

- (void)addRememberNoteView:(UIView *)superView
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(47.5, 0, 90, superView.frame.size.height)];
    label.text = @"记住操作";
    label.textColor = kBlackColor;
    label.font = [UIFont systemFontOfSize:14];
    [superView addSubview:label];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(47.5, 0, 90, superView.frame.size.height)];
    btn.backgroundColor = [UIColor clearColor];
    [btn addTarget:self action:@selector(actionRememberButton:) forControlEvents:UIControlEventTouchUpInside];
    [superView addSubview:btn];
}

- (void)addCopyRightLabel
{
    float height = 180;
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake( (kMSScreenWidth - height)/2, kMSScreenHeight - 30, height, 30)];
    label.text = @"CopyRight HuoYuan.Mobi";
    label.textColor = kBlackColor;
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:11];
    [self.view addSubview:label];
}

- (void)addDealPwdInput
{
    self.dealPwdView = [[DealPasswordView alloc] initWithFrame:CGRectZero];
    self.dealPwdView.delegate = self;
    [self.dealPwdView showDealPassword:NO];
}

#pragma mark action

- (void)actionQRCode:(id)sender
{
    ZBarReaderViewController *codeReader = [ZBarReaderViewController new];
    codeReader.readerDelegate=self;
    codeReader.supportedOrientationsMask = ZBarOrientationMaskAll;
    
    ZBarImageScanner *scanner = codeReader.scanner;
    [scanner setSymbology: ZBAR_I25 config: ZBAR_CFG_ENABLE to: 0];
    
    [self presentViewController:codeReader animated:YES completion:nil];
}

- (void)actionMobilePhone:(id)sender
{
    [self.dealPwdView showDealPassword:YES];
}

- (void)actionRememberButton:(id)sender
{
    self.rememberBtn.selected = !self.rememberBtn.selected;
}

- (void)actionAPITestPage:(id)sender
{
    WebViewController *ctr = [[WebViewController alloc] initWithUrlString:@"http://web.huoyuan.mobi/sample/openapp.aspx" title:@"移动货源接口测试"];
    [self.navigationController pushViewController:ctr animated:YES];
}

#pragma mark DealPasswordDelegate
- (void)callBackDealPasswordOKButton
{
    
}

#pragma mark - ZBar's Delegate method

- (void) imagePickerController: (UIImagePickerController*) reader didFinishPickingMediaWithInfo: (NSDictionary*) info
{
    //  get the decode results
    id<NSFastEnumeration> results = [info objectForKey: ZBarReaderControllerResults];
    
    ZBarSymbol *symbol = nil;
    for(symbol in results)
        // just grab the first barcode
        break;
    
    // dismiss the controller
    [reader dismissViewControllerAnimated:YES completion:nil];
}

@end
