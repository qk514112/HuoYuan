//
//  DealPasswordView.h
//  PJ
//
//  Created by dj0708 on 15/12/24.
//  Copyright © 2015年 dj0708. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DealPasswordDelegate <NSObject>

- (void)callBackDealPasswordOKButton;

@end

@interface DealPasswordView : UIView

@property (nonatomic, assign) id<DealPasswordDelegate>         delegate;

- (void)showDealPassword:(BOOL)show;
- (void)removeDealPasswordView;

- (NSString *)getDealPassword;

@end
