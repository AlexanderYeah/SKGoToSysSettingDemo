//
//  ViewController.m
//  SKGoToSysSetting
//
//  Created by AY on 2017/8/3.
//  Copyright © 2017年 AlexanderYeah. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

/** 跳转按钮*/
@property (nonatomic,strong)UIButton *goBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	UIButton *goBtn = [UIButton buttonWithType:UIButtonTypeCustom];
	[goBtn setTitle:@"去跳转" forState:UIControlStateNormal];
	goBtn.frame  =CGRectMake(100, 100, 100, 30);
	[goBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
	[goBtn addTarget:self action:@selector(goBtnClick) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:goBtn];
	
	
}



/** iOS 系统版本大于 8.0的时候 支持跳转到自己应用设置，不支持跳转到系统设置 */

- (void)goBtnClick
{
	
	NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
	
	NSLog(@"version %@",[UIDevice currentDevice].systemVersion);
	if ([[UIApplication sharedApplication] canOpenURL:url]) {
		[[UIApplication sharedApplication] openURL:url options:@{} completionHandler:^(BOOL success) {
			// 打开成功
			
		}];
	}

}




- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


@end
