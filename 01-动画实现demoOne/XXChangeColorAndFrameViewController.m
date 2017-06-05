//
//  XXCustomChangeColorViewController.m
//  01-动画实现demoOne
//
//  Created by shine on 2017/6/5.
//  Copyright © 2017年 shine. All rights reserved.
//

#import "XXChangeColorAndFrameViewController.h"


#define XXRamdomColor [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1]


@interface XXChangeColorAndFrameViewController ()

//colorLayer
@property (nonatomic, strong) CALayer *colorLayer;

@end

@implementation XXChangeColorAndFrameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"改变颜色以及跟随手势改变位置";
    
    //用layer实现
    self.colorLayer = [CALayer layer];
    self.colorLayer.frame = CGRectMake(100, 100, 100, 100);
    self.colorLayer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:self.colorLayer];

    
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //获取到当前的触摸点
    CGPoint point = [[touches anyObject] locationInView:self.view];
    //如果触摸点在colorLayer范围内，则改变颜色，否则跟随手指改变位置
    if ([self.colorLayer.presentationLayer hitTest:point]) {
        self.colorLayer.backgroundColor = XXRamdomColor.CGColor;
    }else {
        [CATransaction begin];
        [CATransaction setAnimationDuration:4.0];
        self.colorLayer.position = point;
        [CATransaction commit];
    }
}

@end
