//
//  PTQuestionCell.h
//  ProblemTest
//
//  Created by Celia on 2017/10/24.
//  Copyright © 2017年 Hopex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PTTestTopicModel.h"
#import "PTQuestionChoiceView.h"

@class PTQuestionCell;
@protocol PTQuestionCellDelegate <NSObject>

/** 上一题 */
- (void)PTQuestionCellTapLastQuestion:(PTQuestionCell *)cell;
/** 下一题 */
- (void)PTQuestionCellTapNextQuestion:(PTQuestionCell *)cell;
/** 更新选中的选项数据 */
- (void)PTQuestionCellUpdateSelectChoices:(NSArray *)choiceArray cell:(PTQuestionCell *)cell;

@end

@interface PTQuestionCell : UICollectionViewCell

/** 题目模型 */
@property (nonatomic, strong) PTTestTopicModel *model;

/** 第一个 没有上一题按钮 */
@property (nonatomic, assign) BOOL isFirst;

/** 代理 */
@property (nonatomic, weak) id <PTQuestionCellDelegate>delegate;

/** 之前选中的选项 */
@property (nonatomic, strong) NSArray *haveSelectChoices;

/** 之前的正确选项 */
@property (nonatomic, strong) NSArray *haveCorrectChoices;

@property (nonatomic, strong) PTQuestionChoiceView *choiceView;     // 选项视图

@end
