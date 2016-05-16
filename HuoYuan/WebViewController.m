//
//  WebViewController.m
//  HuoYuan
//
//  Created by dj0708 on 16/2/24.
//  Copyright © 2016年 dj0708. All rights reserved.
//

#import "WebViewController.h"
#import "UMSocial.h"

@interface WebViewController ()

@property (nonatomic, strong) NSString               *urlStr;
@property (nonatomic, strong) NSString               *titleStr;
@property (nonatomic, strong) UIWebView              *webView;

@end

@implementation WebViewController

- (id)init
{
    self = [super init];
    
    if (self) {
        self.urlStr = @"";
        self.titleStr = @"";
    }
    
    return self;
}

- (id)initWithUrlString:(NSString *)urlStr title:(NSString *)title
{
    self = [self init];
    self.urlStr = urlStr;
    self.titleStr = title;
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = self.titleStr;
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:kBlackColor}];
    [self addWebView];
    [self addShareButton];
}

- (void)addWebView
{
    self.webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, kMSScreenWidth, kMSScreenHeight)];
    self.webView.scalesPageToFit = YES;
    self.webView.scrollView.bounces = NO;
    [self.webView loadRequest:[[NSURLRequest alloc] initWithURL:[NSURL URLWithString:self.urlStr]]];
    [self.view addSubview:self.webView];
}

- (void)addShareButton
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 50, 44);
    [button addTarget:self action:@selector(actionShare:) forControlEvents:UIControlEventTouchUpInside];
    
//   无合适的图片 用文字代替
//    [button setImage:[UIImage imageNamed:@"share_btn"] forState:UIControlStateNormal];
    [button setTitle:@"分享" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithRed:0/255.0 green:122/255.0 blue:255/255.0 alpha:1.0] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithRed:194/255.0 green:220/255.0 blue:246/255.0 alpha:1.0] forState:UIControlStateHighlighted];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
}

#pragma mark action
- (void)actionShare:(id)sender
{
    NSString *result = @"http://www.pj.com";
    [UMSocialSnsService presentSnsIconSheetView:self
                                         appKey:kUMAPPKey
                                      shareText:@"分享的文字"
                                     shareImage:[UIImage imageNamed:@"share_app_icon.png"]
                                shareToSnsNames:[NSArray arrayWithObjects:UMShareToWechatSession,UMShareToWechatTimeline,UMShareToWechatFavorite, UMShareToRenren, UMShareToTencent, UMShareToSms, UMShareToEmail, UMShareToDouban, UMShareToLWSession, UMShareToLWTimeline, nil]
                                       delegate:nil];
    [UMSocialData defaultData].extConfig.wechatSessionData.shareText = [NSString stringWithFormat:@"【任性送金条】下载注册“票据宝金融”，金银红包满地跑！真的还有金条！你要红包还是金条？！%@", result];
    [UMSocialData defaultData].extConfig.wechatFavoriteData.shareText = [NSString stringWithFormat:@"【任性送金条】下载注册“票据宝金融”，金银红包满地跑！真的还有金条！你要红包还是金条？！%@", result];
    [UMSocialData defaultData].extConfig.smsData.shareText = [NSString stringWithFormat:@"【票据宝金融壕送金条】我试过了,真的能拿好多现金红包! 还有可能拿金条! 赶紧下载APP一起来! 赚翻了! %@", result];
    [UMSocialData defaultData].extConfig.wechatSessionData.shareImage = [UIImage imageNamed:@"share_app_icon.png"];
    [UMSocialData defaultData].extConfig.wechatTimelineData.shareImage = [UIImage imageNamed:@"share_app_icon.png"];
    [UMSocialData defaultData].extConfig.wechatFavoriteData.shareImage = [UIImage imageNamed:@"share_app_icon.png"];
    [UMSocialData defaultData].extConfig.smsData.shareImage = nil;
    [UMSocialData defaultData].extConfig.wechatSessionData.title = @"票据宝金融";
    [UMSocialData defaultData].extConfig.wechatTimelineData.title = @"【任性送金条】下载注册“票据宝金融”，金银红包满地跑！真的还有金条！";
    [UMSocialData defaultData].extConfig.wechatSessionData.url = result;
    [UMSocialData defaultData].extConfig.wechatTimelineData.url = result;
}

@end
