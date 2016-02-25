//
//  APITestTableViewController.m
//  HuoYuan
//
//  Created by dj0708 on 16/2/25.
//  Copyright © 2016年 dj0708. All rights reserved.
//

#import "APITestTableViewController.h"


@interface APITestTableViewController ()

@property (nonatomic, strong) NSArray             *apiNameArr;

@end


@implementation APITestTableViewController

- (id)init
{
    self = [super init];
    
    if (self) {
        self.apiNameArr = [[NSArray alloc] initWithObjects:@"上传图片", nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    cell.textLabel.text = [self.apiNameArr objectAtIndex:indexPath.row];
    cell.textLabel.textColor ;
    return cell;
}

@end
