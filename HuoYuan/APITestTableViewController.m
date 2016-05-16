//
//  APITestTableViewController.m
//  HuoYuan
//
//  Created by dj0708 on 16/2/25.
//  Copyright © 2016年 dj0708. All rights reserved.
//

#import "APITestTableViewController.h"
#import "WebViewController.h"

@interface APITestTableViewController ()

@property (nonatomic, strong) NSArray             *apiNameArr;

@end


@implementation APITestTableViewController

- (id)init
{
    self = [super init];
    
    if (self) {
        self.apiNameArr = [[NSArray alloc] initWithObjects:@"分享", @"上传图片", nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"接口测试";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:kBlackColor}];
    self.view.backgroundColor = [UIColor whiteColor];

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.apiNameArr count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"reuseIdentifier"];
    }
    cell.textLabel.text = [self.apiNameArr objectAtIndex:indexPath.row];
    cell.textLabel.textColor = kBlackColor;
    return cell;
}

#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0: {
            WebViewController *ctr = [[WebViewController alloc] initWithUrlString:@"http://pj.com" title:@"分享"];
            [self.navigationController pushViewController:ctr animated:YES];
            break;
        }
        case 1: {
            
        }
        default:
            break;
    }
}

@end
