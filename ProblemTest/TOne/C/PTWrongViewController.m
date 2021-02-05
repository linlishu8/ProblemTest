//
//  PTWrongViewController.m
//  ProblemTest
//
//  Created by Celia on 2017/10/24.
//  Copyright © 2017年 Hopex. All rights reserved.
//

#import "PTWrongViewController.h"
#import "PTWrongView.h"
#import "PTTestWrongModel.h"
#import "HPProgressHUD.h"

@interface PTWrongViewController ()
@property (nonatomic, strong) PTWrongView *mainView;
@end

@implementation PTWrongViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"我的错题";
    
    [self.view addSubview:self.mainView];
    
    [self requestWrongData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 数据请求 / 数据处理
- (void)requestWrongData {
    
    NSArray *pathArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [pathArray objectAtIndex:0];
        //获取文件的完整路径
    NSString *filePatch = [path stringByAppendingPathComponent:@"TestWrong.plist"];
    NSArray *dataList = [[NSMutableArray alloc] initWithContentsOfFile:filePatch];
    
    NSArray *tempArray = [PTTestWrongModel mj_objectArrayWithKeyValuesArray:dataList];
    self.mainView.dataArray = tempArray;
    
    if (tempArray.count == 0) {
        [HPProgressHUD showMessage:@"您当前没有错题"];
    }
    
}


#pragma mark - 懒加载
- (PTWrongView *)mainView {
    
    if (!_mainView) {
        _mainView = [[PTWrongView alloc] initWithFrame:CGRectMake(0, 0, HPScreenWidth, HPScreenHeight)];
    }
    return _mainView;
}

@end
