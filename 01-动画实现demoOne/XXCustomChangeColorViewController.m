//
//  XXCustomChangeColorViewController.m
//  01-动画实现demoOne
//
//  Created by shine on 2017/6/5.
//  Copyright © 2017年 shine. All rights reserved.
//

#import "XXCustomChangeColorViewController.h"


#define XXRamdomColor [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1]


@interface XXCustomChangeColorViewController ()

//colorLayer
@property (nonatomic, strong) CALayer *colorLayer;

@end

@implementation XXCustomChangeColorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"自定义改变颜色";
    
    //用layer实现
    self.colorLayer = [CALayer layer];
    self.colorLayer.frame = CGRectMake(100, 100, 100, 100);
    self.colorLayer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:self.colorLayer];
    
    //加入转场动画
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromLeft;
    
    
    self.colorLayer.actions = @{@"backgroundColor": transition};
    

    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.colorLayer.backgroundColor = XXRamdomColor.CGColor;
}

@end
