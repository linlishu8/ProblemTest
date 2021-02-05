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

//考题选择
@property (nonatomic, strong) UITextField *startNumberTextField;//开始
@property (nonatomic, strong) UITextField *endNumberTextField;//结束

@property (nonatomic, strong) UITextField *totleTimeTextField;//考试时间

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
    
    [self.view addSubview:self.startNumberTextField];
    [self.view addSubview:self.endNumberTextField];
    
    UILabel *lineLabel = [[UILabel alloc] init];
    lineLabel.text = @"-";
    lineLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:lineLabel];
    
    self.startNumberTextField.frame = CGRectMake(startBtn.left, checkBtn.bottom + 20, (HPScreenWidth - 40)/3, startBtn.height);
    lineLabel.frame = CGRectMake(self.startNumberTextField.right, self.startNumberTextField.top, self.startNumberTextField.width, self.startNumberTextField.height);
    self.endNumberTextField.frame = CGRectMake(lineLabel.right, self.startNumberTextField.top, self.startNumberTextField.width, self.startNumberTextField.height);
    
    UILabel *timeLabel = [[UILabel alloc] init];
    timeLabel.text = @"考试时间：";
    timeLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:timeLabel];
    
    [self.view addSubview:self.totleTimeTextField];
    
    timeLabel.frame = CGRectMake(startBtn.left, self.startNumberTextField.bottom + 20, self.startNumberTextField.width, self.startNumberTextField.height);
    self.totleTimeTextField.frame = CGRectMake(timeLabel.right, timeLabel.top, (HPScreenWidth - 40)/3 * 2, startBtn.height);
}

- (void)btnAction:(UIButton *)btn {
    
    if (btn.tag == 200) {
        PTestFuncViewController *vc = [[PTestFuncViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (btn.tag == 201) {
        //开始测试清空错题
        NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *path = [pathArray objectAtIndex:0];
            //获取文件的完整路径
        NSString *filePatch = [path stringByAppendingPathComponent:@"TestWrong.plist"];
        NSMutableArray *wrongList = [NSMutableArray array];//错题集
        [wrongList writeToFile:filePatch atomically:YES];
        
        PTQuestionViewController *vc = [[PTQuestionViewController alloc] initWithStartNumber:self.startNumberTextField.text endNumber:self.endNumberTextField.text totleTime:self.totleTimeTextField.text];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (btn.tag == 202) {
        PTWrongViewController *vc = [[PTWrongViewController alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

#pragma mark - getters and setters

- (UITextField *)startNumberTextField {
    if (!_startNumberTextField) {
        _startNumberTextField  = [[UITextField alloc] init];
        _startNumberTextField.textAlignment = NSTextAlignmentCenter;
        _startNumberTextField.backgroundColor = [UIColor hex:@"cccccc"];
        _startNumberTextField.text = @"0";
        
    }
    return _startNumberTextField;
}

- (UITextField *)endNumberTextField {
    if (!_endNumberTextField) {
        _endNumberTextField  = [[UITextField alloc] init];
        _endNumberTextField.textAlignment = NSTextAlignmentCenter;
        _endNumberTextField.backgroundColor = [UIColor hex:@"cccccc"];
        _endNumberTextField.text = @"30";
        
    }
    return _endNumberTextField;
}

- (UITextField *)totleTimeTextField {
    if (!_totleTimeTextField) {
        _totleTimeTextField  = [[UITextField alloc] init];
        _totleTimeTextField.textAlignment = NSTextAlignmentCenter;
        _totleTimeTextField.backgroundColor = [UIColor hex:@"cccccc"];
        _totleTimeTextField.text = @"30";
        
    }
    return _totleTimeTextField;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
