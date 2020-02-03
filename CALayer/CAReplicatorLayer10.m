//
//  CAReplicatorLayer10.m
//  CALayer
//
//  Created by gaoyafeng on 2019/3/30.
//  Copyright © 2019 north_feng. All rights reserved.
//

#import "CAReplicatorLayer10.h"

@interface CAReplicatorLayer10 ()

///
@property (nonatomic,strong,nullable) UIView *containerView;

///
@property (nonatomic,strong,nullable) UIView *bgView;

@property(nonatomic, strong) GFWavePulsLayer *waveLayer;

@end

@implementation CAReplicatorLayer10

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //[self createSomeLayer];//创建多个静态图层
    
    [self createOneAnimationn];//创建条形
    
    [self addWavePulsLayer];//创建水波
}

///创建多个方行layer成圆形分布
- (void)createSomeLayer{
    
    self.containerView = [[UIView alloc] initWithFrame:CGRectMake(50,100,300,300)];
    [self.view addSubview:self.containerView];
    
    CAReplicatorLayer *replicator = [CAReplicatorLayer layer];
    replicator.frame = self.containerView.bounds;
    [self.containerView.layer addSublayer:replicator];
    
    //configure the replicator
    replicator.instanceCount = 10;
    
    //apply a transform for each instance 设置 复制图层动画属性 后一个复制图层 相对前一个图层 进行变化
    CATransform3D transform = CATransform3DIdentity;
    transform = CATransform3DTranslate(transform, 0, 200, 0);
    transform = CATransform3DRotate(transform, M_PI / 5.0, 0, 0, 1);
    transform = CATransform3DTranslate(transform, 0, -200, 0);
    replicator.instanceTransform = transform;
    
    //apply a color shift for each instance
    replicator.instanceBlueOffset = -0.1;
    replicator.instanceGreenOffset = -0.1;
    
    //create a sublayer and place it inside the replicator
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(100.0f, 100.0f, 100.0f, 100.0f);
    layer.backgroundColor = [UIColor whiteColor].CGColor;
    [replicator addSublayer:layer];
    
}


///创建一个CAReplicatorLayer动画 类似音乐播放竖条上下动
- (void)createOneAnimationn{
    
    // 1.创建一个复制图层对象，设置复制层的属性
    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
    
    // 1.1.设置复制图层中子层总数：这里包含原始层
    replicatorLayer.instanceCount = 8;
    // 1.2.设置复制子层偏移量，不包含原始层，这里是相对于原始层的x轴的偏移量
    replicatorLayer.instanceTransform = CATransform3DMakeTranslation(45, 0, 0);
    // 1.3.设置复制层的动画延迟事件
    replicatorLayer.instanceDelay = 0.1;
    // 1.4.设置复制层的背景色，如果原始层设置了背景色，这里设置就失去效果
    replicatorLayer.instanceColor = [UIColor greenColor].CGColor;
    // 1.5.设置复制层颜色的偏移量
    replicatorLayer.instanceGreenOffset = -0.1;
    
    // 2.创建一个图层对象  单条柱形 (原始层)!!!!!!!!!!!!!!!!!!!!!!!
    CALayer *layer = [CALayer layer];
    // 2.1.设置layer对象的位置
    layer.position = CGPointMake(15, 200);
    // 2.2.设置layer对象的锚点
    layer.anchorPoint = CGPointMake(0, 1);
    // 2.3.设置layer对象的位置大小
    layer.bounds = CGRectMake(0, 0, 30, 150);
    // 2.5.设置layer对象的颜色
    layer.backgroundColor = [UIColor whiteColor].CGColor;
    
    // 3.创建一个基本动画 设置原始图层的动画属性！！！！！！！！！！！
    CABasicAnimation *basicAnimation = [CABasicAnimation animation];
    // 3.1.设置动画的属性
    basicAnimation.keyPath = @"transform.scale.y";
    // 3.2.设置动画的属性值
    basicAnimation.toValue = @0.1;
    // 3.3.设置动画的重复次数
    basicAnimation.repeatCount = MAXFLOAT;
    // 3.4.设置动画的执行时间
    basicAnimation.duration = 0.5;
    // 3.5.设置动画反转
    basicAnimation.autoreverses = YES;
    
    // 4.将动画添加到layer层上
    [layer addAnimation:basicAnimation forKey:nil];
    
    // 5.将layer层添加到复制层上
    [replicatorLayer addSublayer:layer];
    
    // 6.将复制层添加到view视图层上
    [self.view.layer addSublayer:replicatorLayer];
    
}

- (void)addWavePulsLayer {
    
    self.bgView = [[UIView alloc] initWithFrame:CGRectMake(10, 350, 300, 300)];
    self.bgView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.bgView];
    
    [self.bgView.layer addSublayer:self.waveLayer];
    self.waveLayer.position = self.bgView.center;
    [self.waveLayer start];
}

///水波圆角大小设置
- (void)radiusChanged:(UISlider *)sender {
    self.waveLayer.radius = sender.value;
}

///水波动画持续时间设置
- (void)durationChanged:(UISlider *)sender {
    self.waveLayer.animationDuration = sender.value;
}

///水波颜色设置
- (void)colorChanged:(UISlider *)sender {
    float value = sender.value;
    UIColor *bgColor = [UIColor colorWithRed:value green:0 blue:0 alpha:1];
    self.waveLayer.backgroundColor = bgColor.CGColor;
}

///水波图层数量设置
- (void)countChanged:(UISlider *)sender {
    self.waveLayer.haloLayerNumber = sender.value;
}

- (GFWavePulsLayer *)waveLayer {
    if (_waveLayer == nil) {
        _waveLayer = [GFWavePulsLayer layer];
        _waveLayer.animationDuration = 6;
        _waveLayer.haloLayerNumber = 5;
        _waveLayer.fromValueForRadius = 0.0;
        _waveLayer.backgroundColor = [UIColor redColor].CGColor;
        _waveLayer.radius = 90;
    }
    return _waveLayer;
    
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


@interface GFWavePulsLayer()<CAAnimationDelegate>

@property (nonatomic, strong) CALayer *effect;
@property (nonatomic, strong) CAAnimationGroup *animationGroup;

@end

@implementation GFWavePulsLayer
@dynamic repeatCount;

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.effect = [CALayer new];
        //self.effect.contentsScale = [UIScreen mainScreen].scale;
        self.effect.frame = CGRectMake(100, 100, 30, 150);
        self.effect.opacity = 0;
        [self addSublayer:self.effect];
        
        [self _setupDefaults];
    }
    return self;
}



#pragma mark - private mathod

- (void)_setupDefaults {
    _fromValueForRadius = 0.0;
    _fromValueForAlpha = 0.45;
    _keyTimeForHalfOpacity = 0.2;
    _animationDuration = 3;
    _pulseInterval = 0;
    _useTimingFunction = YES;
    
    self.repeatCount = INFINITY;
    self.radius = 100;
    self.haloLayerNumber = 5;
    self.startInterval = 1;
    self.backgroundColor = [[UIColor colorWithRed:0.7052 green:0.7052 blue:0.7052 alpha:1.0] CGColor];
}

- (void)_setupAnimationGroup {
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.duration = self.animationDuration + self.pulseInterval;
    animationGroup.repeatCount = self.repeatCount;
    if (self.useTimingFunction) {
        CAMediaTimingFunction *defaultCurve = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
        animationGroup.timingFunction = defaultCurve;
    }
    
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale.xy"];
    scaleAnimation.fromValue = @(self.fromValueForRadius);
    scaleAnimation.toValue = @1.0;
    scaleAnimation.duration = self.animationDuration;
    
    //添加线性变化
    CAKeyframeAnimation *opacityAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.duration = self.animationDuration;
    opacityAnimation.values = @[@(self.fromValueForAlpha), @0.45, @0];
    opacityAnimation.keyTimes = @[@0, @(self.keyTimeForHalfOpacity), @1];
    
    NSArray *animations = @[scaleAnimation, opacityAnimation];
    
    animationGroup.animations = animations;
    
    self.animationGroup = animationGroup;
    self.animationGroup.delegate = self;
}


#pragma mark - CAAnimationDelegate

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
    if ([self.effect.animationKeys count]) {
        [self.effect removeAllAnimations];
    }
    //    [self.effect removeFromSuperlayer];
    //    [self removeFromSuperlayer];
}


#pragma mark - getter setter

- (void)start {
    if (self.animationGroup == nil) {
        [self _setupAnimationGroup];
    }
    
    [self.effect addAnimation:self.animationGroup forKey:@"pulse"];//脉冲
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    self.effect.frame = frame;
}

- (void)setBackgroundColor:(CGColorRef)backgroundColor {
    [super setBackgroundColor:backgroundColor];
    self.effect.backgroundColor = backgroundColor;
}

- (void)setRadius:(CGFloat)radius {
    
    _radius = radius;
    
    CGFloat diameter = self.radius * 2;
    
    self.effect.bounds = CGRectMake(0, 0, diameter, diameter);
    self.effect.cornerRadius = self.radius;
}

- (void)setPulseInterval:(NSTimeInterval)pulseInterval {
    
    _pulseInterval = pulseInterval;
    
    if (_pulseInterval == INFINITY) {
        [self.effect removeAnimationForKey:@"pulse"];
    }
}

- (void)setHaloLayerNumber:(NSInteger)haloLayerNumber {
    
    _haloLayerNumber = haloLayerNumber;
    self.instanceCount = haloLayerNumber;
    self.instanceDelay = (self.animationDuration + self.pulseInterval) / haloLayerNumber;
    
}

- (void)setStartInterval:(NSTimeInterval)startInterval {
    
    _startInterval = startInterval;
    self.instanceDelay = startInterval;
}

- (void)setAnimationDuration:(NSTimeInterval)animationDuration {
    
    _animationDuration = animationDuration;
    
    self.instanceDelay = (self.animationDuration + self.pulseInterval) / self.haloLayerNumber;
}


@end
