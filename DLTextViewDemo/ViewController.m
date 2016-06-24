//
//  ViewController.m
//  DLTextViewDemo
//
//  Created by 邹道利 on 21/6/16.
//  Copyright © 2016年 www.visualogies.com. All rights reserved.
//

#import "ViewController.h"

#import "DLTextView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    DLTextView *textView = [[DLTextView alloc]initWithFrame:CGRectMake(50, 50, 200, 160)];
    textView.backgroundColor = [UIColor cyanColor];
    textView.placeholder = @"写点什么吧。。。";
    //textView.placeholderColor = [UIColor redColor];
    textView.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:textView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
