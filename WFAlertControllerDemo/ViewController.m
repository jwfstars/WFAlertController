//
//  ViewController.m
//  WFAlertControllerDemo
//
//  Created by 江文帆 on 2017/2/21.
//  Copyright © 2017年 江文帆. All rights reserved.
//

#import "ViewController.h"
#import "WFAlertController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"Show" forState:UIControlStateNormal];
    button.frame = CGRectMake(100, 200, 80, 40);
    [button addTarget:self action:@selector(onTapButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)onTapButton
{
    [WFAlertController alertWithTitle:@"Title" message:@"Message" destructiveTitle:@"Delete" destructiveAction:^(UIAlertAction *action) {
        NSLog(@"onTapDestructive");
    } cancelTitle:@"Cancel" cancelAction:^(UIAlertAction *action) {
        NSLog(@"onTapCancel");
    } otherTitles:@[@"button1",@"button2"] handler:^(NSInteger index) {
        NSLog(@"onTapOther - %@",@(index));
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
