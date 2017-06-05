//
//  XXTableViewController.m
//  01-动画实现demoOne
//
//  Created by shine on 2017/6/5.
//  Copyright © 2017年 shine. All rights reserved.
//

#import "XXTableViewController.h"

@interface XXTableViewController ()

//titleArr
@property (nonatomic, strong) NSArray *titleArr;

//跳转的控制器的名称
@property (nonatomic, strong) NSArray *controllerArr;

@end

@implementation XXTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    //
    self.title = @"动画";
    
    self.titleArr = @[@"改变颜色",@"自定义改变颜色",@"跟随手指移动及改变颜色"];
    self.controllerArr = @[@"XXChangeColorViewController",@"XXCustomChangeColorViewController",@"XXChangeColorAndFrameViewController"];
    
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    
    static NSString *reuseID = @"cellID";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID ];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID];
    }
    
    cell.textLabel.text = self.titleArr[indexPath.row];
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *stringVC = self.controllerArr[indexPath.row];
    
    [self.navigationController pushViewController:[NSClassFromString(stringVC) new] animated:YES];
}



@end
