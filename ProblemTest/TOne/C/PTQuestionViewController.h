//
//  PTQuestionViewController.h
//  ProblemTest
//
//  Created by Celia on 2017/10/24.
//  Copyright © 2017年 Hopex. All rights reserved.
//

#import "PTBaseViewController.h"

@interface PTQuestionViewController : PTBaseViewController

@property (nonatomic, strong) NSString *length_time;
@property (nonatomic, strong) NSString *total_topic;


/// 初始化考题
/// @param startNumber 开始编号
/// @param endNumber 结束编号
/// @param totleTime 考试时间
- (instancetype)initWithStartNumber:(NSString *)startNumber
                          endNumber:(NSString *)endNumber
                          totleTime:(NSString *)totleTime;

@end
