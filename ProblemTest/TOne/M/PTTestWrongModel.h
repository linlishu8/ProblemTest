//
//  PTTestWrongModel.h
//  ProblemTest
//
//  Created by Celia on 2017/11/8.
//  Copyright © 2017年 Hopex. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PTTestWrongModel : NSObject
@property (nonatomic, copy) NSString *error_id;
@property (nonatomic, copy) NSString *test_id;
@property (nonatomic, copy) NSString *number;
@property (nonatomic, copy) NSString *title;          //题目
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSArray *option;         //选项
@property (nonatomic, copy) NSString *answer;         //正确答案
@property (nonatomic, copy) NSString *score;
@property (nonatomic, copy) NSString *select_answer;
@end
