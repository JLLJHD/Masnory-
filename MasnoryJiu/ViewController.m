//
//  ViewController.m
//  MasnoryJiu
//
//  Created by 郑超杰 on 2018/8/22.
//  Copyright © 2018 ButterJie. All rights reserved.
//

#import "ViewController.h"
#import "NSArray+Sudoku.h"
#import <Masonry.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // TODO: 创建一个装载九宫格的容器
    UIView *containerView = [[UIView alloc] init];
    [self.view addSubview:containerView];
    containerView.backgroundColor = [UIColor whiteColor];
    containerView.layer.borderWidth = 1;
    containerView.layer.borderColor = [UIColor grayColor].CGColor;
    
    // TODO:给该容器添加布局代码
    [containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(15);
        make.top.offset(66);
        make.right.offset(-15);
        make.height.offset(300);
    }];
    
    // TODO:  为该容器添加宫格View
    for (int i = 0; i < 10; i++) {
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor redColor];
        [containerView addSubview:view];
    }
    
    // TODO: 执行九宫格布局
    
    /*
     一行代码，就可以实现九宫格布局
     
     -[NSArray mas_distributeSudokuViewsWithFixedItemWidth:fixedItemHeight:fixedLineSpacing:fixedInteritemSpacing:warpCount:topSpacing:bottomSpacing:leadSpacing:tailSpacing:]
     
     参数介绍：
     
     fixedItemWidth: 宫格的宽度，如果设置为0的话，则由父容器控制宽度，如果不为零，则可以控制父容器的宽度
     
     fixedItemHeight：与fixedItemWidth同理
     
     fixedLineSpacing：宫格之间行的间距，如果宫格只有一行，则不生效
     
     fixedInteritemSpacing：宫格之间列的间距，如果只有一列，则不生效
     
     warpCount：折行的位置，如果设置为3，则表示该九宫格需要布局3列，值得一提的是，如果NSArray本身的count如果小于warpCount，则该函数会用空的UIView填充到缺失区域。
     
     topSpacing：bottomSpacing：leadSpacing：tailSpacing：九宫格顶边距，底边距，左边距以及右边距
     */
//    
//    [containerView.subviews  mas_distributeSudokuViewsWithFixedItemWidth:0
//                                                         fixedItemHeight:0
//                                                        fixedLineSpacing:10
//                                                   fixedInteritemSpacing:20
//                                                               warpCount:3
//                                                              topSpacing:10
//                                                           bottomSpacing:10
//                                                             leadSpacing:10
//                                                             tailSpacing:10];
    
    /**
     *  九宫格布局 固定ItemSize 可变ItemSpacing
     *
     *  @param fixedItemWidth  固定宽度
     *  @param fixedItemHeight 固定高度
     *  @param warpCount       折行点
     *  @param topSpacing      顶间距
     *  @param bottomSpacing   底间距
     *  @param leadSpacing     左间距
     *  @param tailSpacing     右间距
     */
    /*
     - (void)mas_distributeSudokuViewsWithFixedItemWidth:(CGFloat)fixedItemWidth
     fixedItemHeight:(CGFloat)fixedItemHeight
     warpCount:(NSInteger)warpCount
     topSpacing:(CGFloat)topSpacing
     bottomSpacing:(CGFloat)bottomSpacing
     leadSpacing:(CGFloat)leadSpacing
     tailSpacing:(CGFloat)tailSpacing;
     */
    [containerView.subviews mas_distributeSudokuViewsWithFixedItemWidth:50
                                                        fixedItemHeight:50
                                                              warpCount:3
                                                             topSpacing:10
                                                          bottomSpacing:10
                                                            leadSpacing:10
                                                            tailSpacing:10];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
