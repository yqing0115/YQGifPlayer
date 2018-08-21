//
//  ViewController.m
//  YQGifPlayer
//
//  Created by 杨清 on 2018/8/20.
//  Copyright © 2018年 Soargift. All rights reserved.
//

#import "ViewController.h"
#import "YQGifView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UILabel *titleLab = [[UILabel alloc] initWithFrame:CGRectMake(20, 50, [UIScreen mainScreen].bounds.size.width-40, 22)];
    titleLab.text = @"gif播放";
    titleLab.textColor = UIColor.blackColor;
    titleLab.font = [UIFont boldSystemFontOfSize:18];
    titleLab.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:titleLab];

    //方法一
    {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"YQ" ofType:@"gif"];
        YQGifView *gifView = [[YQGifView alloc] initWithFrame:CGRectMake(20, 100, 150, 100) filePath:path];
        [self.view addSubview:gifView];
        gifView.layer.borderColor = UIColor.orangeColor.CGColor;
        gifView.layer.borderWidth = 0.667;
        [gifView resumeWithSpeed:3.5];
        
        UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(20, 200, 150, 22)];
        lab.text = @"快速播放";
        lab.textColor = UIColor.blackColor;
        lab.font = [UIFont systemFontOfSize:16];
        lab.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:lab];
    }
    //方法2
    {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"YQ" ofType:@"gif"];
        NSData *data = [NSData dataWithContentsOfFile:path];
        YQGifView *gifView = [[YQGifView alloc] initWithFrame:CGRectMake(20, 240, 150, 100) data:data];
        [self.view addSubview:gifView];
        gifView.layer.borderColor = UIColor.orangeColor.CGColor;
        gifView.layer.borderWidth = 0.667;
        [gifView resumeWithSpeed:0.8];
        
        UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(20, 340, 150, 22)];
        lab.text = @"慢速播放";
        lab.textColor = UIColor.blackColor;
        lab.font = [UIFont systemFontOfSize:16];
        lab.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:lab];
    }

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
