//
//  XXChangeColorViewController.m
//  01-动画实现demoOne
//
//  Created by shine on 2017/6/5.
//  Copyright © 2017年 shine. All rights reserved.
//

#import "XXChangeColorViewController.h"

#define XXRamdomColor [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1]

@interface XXChangeColorViewController ()

//显示颜色的layer
@property (nonatomic, strong) CALayer *colorLayer;

//colorView
@property (nonatomic, strong) UIView *colorView;

@end

@implementation XXChangeColorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"点击屏幕改变颜色";
    
    //用layer实现
    self.colorLayer = [CALayer layer];
    self.colorLayer.frame = CGRectMake(100, 100, 100, 100);
    self.colorLayer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:self.colorLayer];
    
    //用view实现
    UIView *colorView = [[UIView alloc] init];
    self.colorView = colorView;
    colorView.frame = CGRectMake(100, 300, 100, 100);
    colorView.backgroundColor = [UIColor redColor];
    [self.view addSubview:colorView];
    
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.colorLayer.backgroundColor = XXRamdomColor.CGColor;
    
    
    self.colorView.backgroundColor = XXRamdomColor;
}



@end
