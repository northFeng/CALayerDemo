//
//  OneVC.m
//  CALayer
//
//  Created by gaoyafeng on 2019/3/26.
//  Copyright © 2019 north_feng. All rights reserved.
//

#import "OneVC.h"

#import "GFLayerFuntionDemoVC.h"

@interface OneVC ()

@end

@implementation OneVC
{
    NSArray *_arrayData;
    
    NSArray *_arrayTitle;
}

#pragma mark - 页面初始化 && 基本页面设置
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"QuartzCore框架";
    
    [self initData];
    
    //创建其他视图
    [self createView];
    
    
}


- (void)initData{
    
    //https://www.kancloud.cn/manual/ios/97798  核心动画高级技巧系列
    
    /**
     CALayer 以及所有的继承类 在使用时， 第一步初始化 [CALayer layer];
                                    第二步设置frame： 必须设置frame
                                    第三步添加到view上！！或者其他layer上
     
     */
    _arrayData = @[
                   @"0  CAAnimation 核心动画",//依赖 CAMediaTiming协议 ，CAMediaTimingFunction自带动画线性函数
                   
                   @"1  CADisplayLink openGL刷屏计时器",
                   @"2  CAEAGLLayer openGL相关",//依赖OpenGL框架
                   @"3  CAMetalLayer 3D处理绘制",//依赖Metal框架
                   
                   @"4  CAEmitterCell 粒子动画",
                   @"5  CAEmitterLayer 粒子动画",//依赖CAEmitterCell进行烟雾，火，雨等等这些效果
                   
                   @"6  CAGradientLayer 混合颜色->渐变颜色",//进行多个颜色过渡渐变
                   
                   @"7  CALayer 图层",//基类 ——>可对layer 外观特征、3D属性 进行基础动画
                   
                   @"8  CAMediaTiming 动画协议 控制动画时间属性",//动画时间协议
                   @"9  CAMediaTimingFunction 动画线性变化时间控制函数",//动画线性控制函数
                   
                   @"10 CAReplicatorLayer 复制多个图层,让多个图层进行动画",//实现多个类似的layer进行控制进行动画效果，静态效果
                   
                   @"11 CAScrollLayer 滚动图层",//该图层类 带有滚动API 但layer不带有事件功能
                   
                   @"12 CAShapeLayer 控制 绘制的线条 样式",//线条拐角样式、线条终端样式、线条宽度颜色、线条虚线、线条内填充颜色
                   
                   @"13 CATextLayer 绘制文字图层",//用图层来绘制文字
                   
                   @"14 CATiledLayer 绘制超大图片",//CATiledLayer为载入大图造成的性能问题提供了一个解决方案：将大图分解成小片然后将他们单独按需载入。
                   
                   @"15 CATransaction 控制动画过程中修改动画属性是否显示",
                   
                   @"16 CATransform3D ——>3DCA矩阵属性",
                   
                   @"17 CATransformLayer 做3DLayer效果",
                   
                   @"18 CAValueFunction 动画属性Value—>keyPath",
                   ];
    
    _arrayTitle = @[
                   @"动画",
                   @"openGL刷屏计时器",
                   @"CAEAGLLayer",
                   @"CAMetalLayer",
                   @"CAEmitterCell",
                   @"CAEmitterLayer",
                   @"颜色平滑渐变",
                   @"CALayer",
                   @"精确控制动画时间",
                   @"CAMediaTimingFunction",
                   @"绘制子图层",
                   @"CAScrollLayer呈现大的内容",
                   @"用CGPath渲染图层",
                   @"文字渲染",
                   @"CATiledLayer",
                   @"CATransaction",
                   @"CATransform3D",
                   @"CATransformLayer",
                   @"CAValueFunction",
                   ];
    
}



#pragma mark - UITableView&&代理
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _arrayData.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];

    cell.textLabel.text = _arrayData[indexPath.row];

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    GFLayerFuntionDemoVC *demoVC = [[GFLayerFuntionDemoVC alloc] init];
    demoVC.title = _arrayTitle[indexPath.row];
    demoVC.typeLayer = indexPath.row;
    [self.navigationController pushViewController:demoVC animated:YES];
}

#pragma mark - cell的回调处理


#pragma mark - 按钮点击事件


#pragma mark - 逻辑处理



#pragma mark - Init View  初始化一些视图之类的
- (void)createView{
    
    //创建tableView  UITableViewStyleGrouped:cell的组头视图不会吸顶（会被压）  UITableViewStylePlain:组头视图会吸顶（不会被压）
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, APP_NaviBarHeight, kScreenWidth, kScreenHeight-APP_NaviBarHeight) style:UITableViewStyleGrouped];
    //背景颜色
    self.tableView.backgroundColor = [UIColor lightGrayColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.sectionHeaderHeight = 0;
    self.tableView.sectionFooterHeight = 0;
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.view addSubview:self.tableView];
    
    //防止UITableView被状态栏压下20
    self.automaticallyAdjustsScrollViewInsets = NO;
    if (@available(iOS 11.0, *)) {
        self.tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        //self.tableView.adjustedContentInset =
    }
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];//非Xib
    
}




@end
