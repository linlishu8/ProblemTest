//
//  PTHomeViewController.m
//  ProblemTest
//
//  Created by Celia on 2017/10/24.
//  Copyright © 2017年 Hopex. All rights reserved.
//

#import "PTHomeViewController.h"
#import "PTestFuncViewController.h"
#import "PTQuestionViewController.h"
#import "PTWrongViewController.h"

@interface PTHomeViewController ()

@end

@implementation PTHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *addBtn = [UIButton initButtonTitleFont:18 titleColor:[UIColor whiteColor] titleName:@"添加试题" backgroundColor:[UIColor darkGrayColor] radius:3.0];
    addBtn.tag = 200;
    addBtn.frame = CGRectMake(20, 64 + 50, HPScreenWidth - 40, 50);
    [addBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addBtn];
    
    UIButton *startBtn = [UIButton initButtonTitleFont:18 titleColor:[UIColor whiteColor] titleName:@"开始测试" backgroundColor:[UIColor darkGrayColor] radius:3.0];
    startBtn.tag = 200+1;
    startBtn.frame = CGRectMake(addBtn.left, addBtn.bottom + 20, addBtn.width, addBtn.height);
    [startBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:startBtn];
    
    UIButton *checkBtn = [UIButton initButtonTitleFont:18 titleColor:[UIColor whiteColor] titleName:@"查看错题" backgroundColor:[UIColor darkGrayColor] radius:3.0];
    checkBtn.tag = 200+2;
    checkBtn.frame = CGRectMake(startBtn.left, startBtn.bottom + 20, startBtn.width, startBtn.height);
    [checkBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:checkBtn];
}

- (void)btnAction:(UIButton *)btn {
    
    if (btn.tag == 200) {
        PTestFuncViewController *vc = [[PTestFuncViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (btn.tag == 201) {
        PTWrongViewController *vc = [[PTWrongViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (btn.tag == 201) {
        PTWrongViewController *vc = [[PTWrongViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
