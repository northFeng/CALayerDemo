//
//  CAShapeLayer12.m
//  CALayer
//
//  Created by gaoyafeng on 2019/4/1.
//  Copyright © 2019 north_feng. All rights reserved.
//

#import "CAShapeLayer12.h"

#import "ChangeAnimationView.h"

@interface CAShapeLayer12 ()

@property (strong , nonatomic) ChangeAnimationView *animationView;


@end

@implementation CAShapeLayer12
{
    CAShapeLayer *_shapeLayer;
    
    GFLabel *_labelTxt;
    
    CGFloat _process;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    _animationView = [[ChangeAnimationView alloc] initWithFrame:CGRectMake(0, 150, self.view.bounds.size.width, 120)];
    //[self.view addSubview:_animationView];
    
    
    
    UIButton *startButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    startButton.frame = CGRectMake(10, 300, 100, 50);
    [startButton addTarget:self action:@selector(startAnimation:) forControlEvents:UIControlEventTouchUpInside];
    [startButton setTitle:@"启动动画" forState:UIControlStateNormal];
    [self.view addSubview:startButton];
    
    UIButton *stopButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    stopButton.frame = CGRectMake(110, 300, 100, 50);
    [stopButton addTarget:self action:@selector(stopAnimation:) forControlEvents:UIControlEventTouchUpInside];
    [stopButton setTitle:@"暂停动画" forState:UIControlStateNormal];
    [self.view addSubview:stopButton];
    
    UIButton *resumeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    resumeButton.frame = CGRectMake(210, 300, 100, 50);
    [resumeButton addTarget:self action:@selector(resumeAnimation:) forControlEvents:UIControlEventTouchUpInside];
    [resumeButton setTitle:@"恢复动画" forState:UIControlStateNormal];
    [self.view addSubview:resumeButton];
    
    
    _labelTxt = [[GFLabel alloc] init];
    _labelTxt.text = @"哈哈哈哈哈哈哈哈";
    _labelTxt.font = [UIFont systemFontOfSize:15];
    _labelTxt.frame = CGRectMake(50, 200, 200, 50);
    _labelTxt.textColor = [UIColor redColor];
    [self.view addSubview:_labelTxt];
    
    _process = 0.;
}

-(void)startAnimation:(UIButton *)sender
{
    //[_animationView startAnimation];
    
    _labelTxt.progress = (_process += 0.3);
    
    /**
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.duration = 2;
    animation.fromValue = @0.8;
    animation.toValue = @0.2;
    animation.fillMode = kCAFillModeForwards;//显示最后的时刻
    animation.removedOnCompletion = NO;//动画结束后不移除
    
    CABasicAnimation *animationTwo = [CABasicAnimation animationWithKeyPath:@"transform"];
    animationTwo.beginTime = 2;
    animationTwo.duration = 2;
    animationTwo.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.5, 0.5, 0.5)];
    animationTwo.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.2, 1.2, 1.2)];
    animationTwo.fillMode = kCAFillModeForwards;//显示最后的时刻
    animationTwo.removedOnCompletion = NO;//动画结束后不移除
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[animation,animationTwo];
    group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    group.duration = 4;
    group.removedOnCompletion = NO;
    
    [_shapeLayer addAnimation:group forKey:@"strokeEnd"];
     */
}


-(void)stopAnimation:(UIButton *)sender
{
    [_animationView stopAnimation];
}

-(void)resumeAnimation:(UIButton *)sender
{
    [_animationView resumeAnimation];
}

///添加一个layer
- (void)addShapLayer {
    
    //创建一个layer
    _shapeLayer = [CAShapeLayer layer];
    //虚线的颜色
    _shapeLayer.strokeColor = [UIColor redColor].CGColor;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(10, 10, 100, 100) cornerRadius:50];
    
    //设置路径
    _shapeLayer.path = path.CGPath;//用CoreGraphics 或者 贝塞尔曲线 进行绘制
    
    _shapeLayer.fillColor = [UIColor yellowColor].CGColor;//路径填充颜色，默认黑色，可动画属性
    
    //kCAFillRuleNonZero    kCAFillRuleEvenOdd
    _shapeLayer.fillRule = kCAFillRuleNonZero;//路径填充规则，奇偶或者非零，默认是非零
    
    _shapeLayer.strokeColor = [UIColor greenColor].CGColor;// 描边颜色，默认为nil，可动画属性 (线条颜色)
    
    /** 描边的起点和终点 ——> 做动画使用
     @property CGFloat strokeStart;// 它表示描线开始的地方占总路径的百分比
     @property CGFloat strokeEnd;// 表示绘制结束的地方站总路径的百分比
     */
    _shapeLayer.lineWidth = 3;//描边的宽，默认为1，可动画属性
    
    /**
     最大斜接长度。斜接长度指的是在两条线交汇处和外交之间的距离。只有lineJoin属性为kCALineJoinMiter时miterLimit才有效。边角的角度越小，斜接长度就会越大。为了避免斜接长度过长，我们可以使用miterLimit属性。如果斜接长度超过miterLimit的值，边角会以lineJoin的“bevel”即kCALineJoinBevel类型来显示
     */
    //@property CGFloat miterLimit;// 最大斜街长度
    
    /**
     kCALineCapButt:线端点类似屁股 线的中间内凹
     kCALineCapRound:线端点 半圆
     kCALineCapSquare:线端点 方行
     */
    _shapeLayer.lineCap = kCALineCapRound;//线端点的样式
    
    
    /**
     kCALineJoinMiter:拐角三角
     kCALineJoinRound:拐角圆角
     kCALineJoinBevel:拐角切平
     */
    _shapeLayer.lineJoin = kCALineJoinMiter;// 线拐点的样式
    
    //@property CGFloat lineDashPhase;// 边线模版的起点 默认为0 线条虚线样式 开始起点位置
    
    _shapeLayer.frame = CGRectMake(50, 500, 250, 150);
    
    //设置线条的样式
    //border.lineCap = @"square";
    //第一个是 线条长度   第二个是间距
    //_shapeLayer.lineDashPattern = @[@2, @1];
    [self.view.layer addSublayer:_shapeLayer];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

#pragma mark - 自定义文字
@implementation GFLabel

- (void)setProgress:(CGFloat)progress{
    _progress = progress;
    
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect{
    
    [[UIColor greenColor] set];
    
    CGRect setRect = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width * _progress, rect.size.height);
    
    UIRectFillUsingBlendMode(setRect, kCGBlendModeSourceIn);
}


@end
