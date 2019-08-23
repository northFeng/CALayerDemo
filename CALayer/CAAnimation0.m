//
//  CAAnimation0.m
//  CALayer
//
//  Created by gaoyafeng on 2019/3/30.
//  Copyright © 2019 north_feng. All rights reserved.
//

#import "CAAnimation0.h"

@interface CAAnimation0 ()<CAAnimationDelegate>

///
@property (nonatomic,strong) UIView *animationView;

@end

@implementation CAAnimation0

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btnOne = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnOne setTitle:@"开始" forState:UIControlStateNormal];
    [btnOne setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btnOne addTarget:self action:@selector(statrAnimation) forControlEvents:UIControlEventTouchUpInside];
    btnOne.frame = CGRectMake(100, 200, 50, 30);
    [self.view addSubview:btnOne];
    
    UIButton *btnTwo = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnTwo setTitle:@"停止" forState:UIControlStateNormal];
    [btnTwo setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btnTwo addTarget:self action:@selector(startFail) forControlEvents:UIControlEventTouchUpInside];
    btnTwo.frame = CGRectMake(250, 200, 50, 30);
    [self.view addSubview:btnTwo];
    
    _animationView = [[UIView alloc] initWithFrame:CGRectMake(100, 350, 50, 50)];
    _animationView.backgroundColor = [UIColor redColor];
    //[self.view addSubview:_animationView];
    
    
}

- (void)animationDidStart:(CAAnimation *)anim{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self->_animationView removeFromSuperview];
    });
    
}

/* Called when the animation either completes its active duration or
 * is removed from the object it is attached to (i.e. the layer). 'flag'
 * is true if the animation reached the end of its active duration
 * without being removed. */

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    
}

///开始
- (void)statrAnimation{
    
    NSArray *array = @[@"fade",@"push",@"moveIn",@"reveal",@"cube",@"oglFlip",@"suckEffect",@"rippleEffect",@"pageCurl",@"pageUnCurl",@"cameraIrisHollowOpen",@"cameraIrisHollowClose"];
    CATransition *anim = [CATransition animation];
    anim.repeatCount = 1;
    anim.duration = 1.0;
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];//计时函数，从头到尾的流畅度
    anim.type = array[arc4random()%array.count];//layer动画效果
    anim.subtype = kCATransitionFromRight;//动画控制动画方向
    anim.delegate = self;
    
    [self.navigationController.view.layer addAnimation:anim forKey:nil];

    //[self.view addSubview:_animationView];
    
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController pushViewController:vc animated:NO];
    
    /**
    CATransition *transition = [CATransition animation];
    transition.duration = 0.25;
    transition.type = kCATransitionMoveIn;
    transition.subtype = kCATransitionFromRight;
    [containerView.layer addAnimation:transition forKey:nil];
    //只能操作自视图的layer
    [containerView exchangeSubviewAtIndex:0 withSubviewAtIndex:1];//containerView必须包括两个以上的自视图
    //进行跳转
    [self.navigationController.view.layer addAnimation:transition forKey:nil];
    [self.navigationController pushViewController:"你要跳转的页面" animated:NO];
     */
}

///停止
- (void)startFail{
    
    
    
}

///0CAAnimation
- (void)CAAnimation{
    
    
    /**
     
                  <——   CAPropertyAnimation <—— CABasicAnimation(基础动画) <—— CASpringAnimation(弹簧动画)
                  <——   CAKeyframeAnimation(帧动画)
     CAAnimation
                  <——   CATransition(转场动画)
                  <——   CAAnimationGroup(动画组)
     */
    
    
    
    /**
     
     CAMediaTiming控制属性：动画开始时间、速度、持续时间、是否重复执行repeatCount = MAXFLOAT、执行完后layer展示外观 (执行动画之前 duration属性 必须设置！！)
     
     *************************************** 动画基类 ！！！！CAMediaTiming这个协议可以控制动画一些属性  ***************************************
     @interface CAAnimation : NSObject
     
     + (instancetype)animation;//初始化
     
     + (nullable id)defaultValueForKey:(NSString *)key;//KVC访问属性
     - (BOOL)shouldArchiveValueForKey:(NSString *)key;//判断属性呢是否可以归档
     
     @property(nullable, strong) CAMediaTimingFunction *timingFunction;//定义动画帧时间函数 速度控制函数，控制动画运行的节奏
     
     @property(nullable, strong) id <CAAnimationDelegate> delegate;//动画代理
     
     //默认为YES，代表动画执行完毕后就从图层上移除，图形会恢复到动画执行前的状态。如果想让图层保持显示动画执行后的状态，那就设置为NO，不过还要设置fillMode为kCAFillModeForwards
     @property(getter=isRemovedOnCompletion) BOOL removedOnCompletion;//动画执行完是否删除
     
     
     @end
     
     *************************************** 动画代理 ***************************************
     @protocol CAAnimationDelegate <NSObject>
     @optional
     
     - (void)animationDidStart:(CAAnimation *)anim;//动画开始时调用
     - (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag;//动画结束后调用
     
     @end
     
     *************************************** CAPropertyAnimation 操作动画基类 ***************************************
     @interface CAPropertyAnimation : CAAnimation
     
     + (instancetype)animationWithKeyPath:(nullable NSString *)path;//path为layer的属性，能实现动画的属性，KVC路径
     
     @property(nullable, copy) NSString *keyPath;
     
     @property(getter=isAdditive) BOOL additive;//如何处理多个动画在同一时间段执行的结果，若为true，同一时间段的动画合成为一个动画，默认为false。（使用 CAKeyframeAnimation 时必须将该属性指定为 true ，否则不会出现期待的结果）
     
     @property(getter=isCumulative) BOOL cumulative;//下一次动画执行是否接着刚才的动画，默认为false
     
     @property(nullable, strong) CAValueFunction *valueFunction;//动画属性value
     
     @end
     
     *************************************** CABasicAnimation 基本动画 ***************************************
     @interface CABasicAnimation : CAPropertyAnimation
     //以下三个值 均为ID 类型 layer的 外观(颜色、大小、位置) 特征(3D属性)  任何可动画的属性都可以放进来
     
     //+ (instancetype)animationWithKeyPath:(nullable NSString *)path; 进行创建对象，初始化什么值类型，设置什么类型的值
     @property(nullable, strong) id fromValue;//keyPath相应属性的初始值
     @property(nullable, strong) id toValue;//keyPath相应属性的结束值
     @property(nullable, strong) id byValue;//keyPaht相应属性的相对插值 (中间值 可以不设置)
     
     fromValue和toValue不为nil，keyPath属性值在fromValue与toValue之间渐变
     fromValue和byValue不为nil，keyPath属性值在fromValue与(fromValue+byValue)之间渐变
     byValue和toValue不为nil，keyPath属性值在(toValue-byValue)与toValue之间渐变
     fromValue不为nil，keyPath属性值在fromValue与图层对应当前值之间渐变
     toValue不为nil，keyPath属性值在图层对应当前值与toValue之间渐变
     byValue不为nil，keyPath属性值在图层对应当前值与(图层对应当前值+toValue)之间渐变
     
     @end
     例子：
     //默认是绕着z轴旋转，也可指定绕某个轴旋转：transform.rotation.x
     CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
     //只设置toValue，动画会在图层对应当前值与toValue之间渐变
     animation.toValue = M_PI * 2
     //设置动画重复次数
     animation.repeatCount = MAXFLOAT
     //设置动画执行时间
     animation.duration = 1
     //添加动画到layer
     redView.layer.addAnimation(animation, forKey: nil)
     
     *************************************** CAKeyframeAnimation 关键帧动画 ***************************************
     
     关键帧动画  CAKeyframeAnimation常用的两个属性是values和duration，这两个属性就可以简单的设置动画了，其余属性提供了更加细致化，更加强大的功能！
     @interface CAKeyframeAnimation : CAPropertyAnimation
     
     @property(nullable, copy) NSArray *values;//关键帧动画值的数组，当path为nil时设置有效，否则优先选择属性path做动画
     
     @property(nullable) CGPathRef path;//动画执行的点路径（通过Core Graphics提供的API来绘制路径），设置了path，values将被忽略
     
     @property(nullable, copy) NSArray<NSNumber *> *keyTimes;//设置关键帧动画每帧的执行时间，这里不设置也行，默认平均分配时间
     关键帧动画每帧动画开始执行时间点的数组，取值范围为0~1，数组中相邻两个值必须遵循后一个值大于或等于前一个值，并且最后的值不能为大于1。
     设置的时候与calculationMode有关，具体请查看文档。未设置时默认每帧动画执行时间平均（公式：总时间/(总帧数-1)）。
     例如，如果你指定了一个5帧，10秒的动画，那么每帧的时间就是2.5秒钟：10 /(5-1)=2.5
     
     
     @property(nullable, copy) NSArray<CAMediaTimingFunction *> *timingFunctions;//动画执行效果数组
     
     @property(copy) CAAnimationCalculationMode calculationMode;//设置相邻动画过渡方式 关键帧时间计算方法，每帧动画之间如何过渡，类似与UIView的keyframeAnimation
     kCAAnimationLinear  kCAAnimationDiscrete  kCAAnimationPaced  kCAAnimationCubic  kCAAnimationCubicPaced
     
     
     @property(nullable, copy) NSArray<NSNumber *> *tensionValues;
     @property(nullable, copy) NSArray<NSNumber *> *continuityValues;
     @property(nullable, copy) NSArray<NSNumber *> *biasValues;
     
     @property(nullable, copy) CAAnimationRotationMode rotationMode;//设置路径旋转，当设置path有不同角度时，会自动旋转layer角度与path相切
     kCAAnimationRotateAuto//自动
     kCAAnimationRotateAutoReverse//自动逆向
     
     
     *************************************** CASpringAnimation 弹簧动画 ***************************************
     @interface CASpringAnimation : CABasicAnimation
     
     @property CGFloat mass;////质量，影响图层运动时的弹簧惯性，质量越大，弹簧拉伸和压缩的幅度越大 默认值：1
     
     @property CGFloat stiffness;//刚度系数(劲度系数/弹性系数)，刚度系数越大，形变产生的力就越大，运动越快 默认值： 100
     
     @property CGFloat damping;//阻尼系数，阻止弹簧伸缩的系数，阻尼系数越大，停止越快 默认值：10
     
     @property CGFloat initialVelocity;//初始速率，动画视图的初始速度大小 Defaults to zero  默认值：0
     //速率为正数时，速度方向与运动方向一致，速率为负数时，速度方向与运动方向相反
     
     @property(readonly) CFTimeInterval settlingDuration;//估算时间 返回弹簧动画到停止时的估算时间，根据当前的动画参数估算
     
     @end
     
     *************************************** CATransition 转场动画 ***************************************
     
     CATransition通常用于  通过CALayer 控制 UIView内 子控件 的  过渡动画，比如 删除子控件、添加子控件、切换两个子控件等。
     这个转场动画很强大！！可以进行 视图与视图之间的UI交互动画使用
     @interface CATransition : CAAnimation
     
     kCATransitionFade 渐变
     kCATransitionMoveIn 覆盖
     kCATransitionPush 推出
     kCATransitionReveal 揭开
     cube 立方体旋转
     suckEffect  收缩动画
     oglFlip  翻转
     rippleEffect  水波动画
     pageCurl  页面揭开
     pageUnCurl 放下页面
     cemeraIrisHollowOpen  镜头打开
     cameraIrisHollowClose 镜头关闭
     @property(copy) CATransitionType type;
     
     
     kCATransitionFromRight
     kCATransitionFromLeft
     kCATransitionFromTop
     kCATransitionFromBottom
     @property(nullable, copy) CATransitionSubtype subtype;
     
     如果不需要动画执行整个过程(动画执行到中间部分就停止)，可以指定
     @property float startProgress;//动画开始进度 0-1
     @property float endProgress;//动画结束进度 0-1
     
     @end
     例子：
     CATransition *transition = [CATransition animation];
     transition.duration = 0.25;
     transition.type = kCATransitionMoveIn;
     transition.subtype = kCATransitionFromRight;
     [containerView.layer addAnimation:transition forKey:nil];
     //只能操作自视图的layer
     [containerView exchangeSubviewAtIndex:0 withSubviewAtIndex:1];//containerView必须包括两个以上的自视图
     //进行跳转
     [self.navigationController.view.layer addAnimation:transition forKey:nil];
     [self.navigationController pushViewController:"你要跳转的页面" animated:NO];
     
     //对应UIView中的此方法
     + (void)transitionWithView:(UIView *)view duration:(NSTimeInterval)duration options:(UIViewAnimationOptions)options animations:(void (^ __nullable)(void))animations completion:(void (^ __nullable)(BOOL finished))completion NS_AVAILABLE_IOS(4_0);
     
     + (void)transitionFromView:(UIView *)fromView toView:(UIView *)toView duration:(NSTimeInterval)duration options:(UIViewAnimationOptions)options completion:(void (^ __nullable)(BOOL finished))completion NS_AVAILABLE_IOS(4_0); // toView added to fromView.superview, fromView removed from its superview
     
     *************************************** CAAnimationGroup 动画组 ***************************************
     //默认组动画当中的动画是 同时! 进行的 ——>先执行了第一个动画,在执行第二个动画 ,我让第二个动画的 beginTime!! 从第一个动画结束后的时间执行,这个就可以做到按顺序执行了,
     @interface CAAnimationGroup : CAAnimation
     
     @property(nullable, copy) NSArray<CAAnimation *> *animations;
     
     @end
     */
    
}

#pragma mark - 基本动画
- (void)addBaseAnimation{
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position.x"];
    //只设置toValue，动画会在图层对应当前值与toValue之间渐变
    animation.fromValue = @100;
    animation.toValue = @300;
    //设置动画重复次数
    animation.repeatCount = 3;
    //设置动画执行时间
    animation.duration = 1;
    //是否接着返回
    animation.autoreverses = NO;
    //停止后样式
    animation.fillMode = kCAFillModeBoth;
    
    CALayer *layer = [CALayer layer];
    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.frame = CGRectMake(100, 350, 50, 50);
    [self.view.layer addSublayer:layer];
    
    //添加动画到layer
    [layer addAnimation:animation forKey:@"positon"];
}


@end
