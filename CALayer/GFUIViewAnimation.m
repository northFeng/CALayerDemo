//
//  GFUIViewAnimation.m
//  CALayer
//
//  Created by gaoyafeng on 2019/4/28.
//  Copyright © 2019 north_feng. All rights reserved.
//

#import "GFUIViewAnimation.h"

@interface GFUIViewAnimation ()


@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UIImageView *imageViewTwo;

@end

@implementation GFUIViewAnimation

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}



- (IBAction)onBtnOne:(id)sender {
    [self layerAnimation];//特效动画效果
}

- (IBAction)onBtnTwo:(id)sender {
    
    [self zuniDongHua];//弹簧动画
}

- (IBAction)onBtnThr:(id)sender {
    
    [self Keyframes];//帧动画
}

- (IBAction)onBtnFor:(id)sender {
    
    [self transitionAnimation];//两个视图一个移除，一个添加 过渡动画
}

#pragma mark - CGAffineTransform进行旋转，缩放，frame变形的动画
- (void)frameTransitionAnimation{
    
    /*
     /// 用来连接两个变换效果并返回。返回的t = t1 * t2
     CGAffineTransformConcat(CGAffineTransform t1, CGAffineTransform t2)
     
     /// 矩阵初始值。[ 1 0 0 1 0 0 ]
     CGAffineTransformIdentity
     
     /// 自定义矩阵变换，需要掌握矩阵变换的知识才知道怎么用。参照(x, y, 1 ) --> (ax + cy + tx, bx + dy + ty, 1)
     CGAffineTransformMake(CGFloat a, CGFloat b, CGFloat c, CGFloat d, CGFloat tx, CGFloat ty)
     
     /// 旋转视图。传入参数为 角度 * (M_PI / 180)。等同于 CGAffineTransformRotate(self.transform, angle)
     CGAffineTransformMakeRotation(CGFloat angle)
     CGAffineTransformRotate(CGAffineTransform t, CGFloat angle)
     
     /// 缩放视图。等同于CGAffineTransformScale(self.transform, sx, sy)
     CGAffineTransformMakeScale(CGFloat sx, CGFloat sy)
     CGAffineTransformScale(CGAffineTransform t, CGFloat sx, CGFloat sy)
     
     /// 缩放视图。等同于CGAffineTransformTranslate(self.transform, tx, ty)
     CGAffineTransformMakeTranslation(CGFloat tx, CGFloat ty)
     CGAffineTransformTranslate(CGAffineTransform t, CGFloat tx, CGFloat ty)
     
     */
    
}

#pragma mark - CATransition使视图的layer进行动画特效
- (void)layerAnimation{
    
    /*fade交叉淡化过渡
     
     push 新视图把旧视图推出去
     moveIn 新视图移到旧视图上
     reveal 将旧视图移开，显示下面的新视图
     cube立方体翻转
     oglFlip上下左右翻转
     suckEffect收缩效果，一块布被抽走
     rippleEffect水滴效果
     pageCurl向上翻页
     pageUnCurl向下翻页
     cameraIrisHollowOpen相机镜头打开
     cameraIrisHollowClose相机镜头关闭
     */
    NSArray *array = @[@"fade",@"push",@"moveIn",@"reveal",@"cube",@"oglFlip",@"suckEffect",@"rippleEffect",@"pageCurl",@"pageUnCurl",@"cameraIrisHollowOpen",@"cameraIrisHollowClose"];
    CATransition *anim = [CATransition animation];
    anim.type = array[arc4random()%array.count];//rippleEffect
    anim.repeatCount = 1;
    anim.duration = 1.0;
    anim.timingFunction = UIViewAnimationCurveEaseInOut;//计时函数，从头到尾的流畅度
    //    anim.type = kCATransitionPush;//动画类型
    anim.subtype = kCATransitionFromRight;//控制动画方向
    [_imageViewTwo.layer addAnimation:anim forKey:nil];
    
}


#pragma mark - UIView的API自带动画

#pragma mark - 1.弹簧动画
///弹簧动画
- (void)zuniDongHua{
    
    /**
     * duration:动画持续时间
     *
     * delay:动画延迟执行的时间
     *
     * dampingRatio:震动效果，范围0~1，数值越小震动效果越明显
     *
     * velocity:初始速度，数值越大初始速度越快
     *
     * (UIViewAnimationOptions)options:动画的过渡效果
     *
     */
    //+ (void)animateWithDuration:(NSTimeInterval)duration delay:(NSTimeInterval)delay usingSpringWithDamping:(CGFloat)dampingRatio initialSpringVelocity:(CGFloat)velocity options:(UIViewAnimationOptions)options animations:(void (^)(void))animations completion:(void (^ __nullable)(BOOL finished))completion NS_AVAILABLE_IOS(7_0);
    [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.5 initialSpringVelocity:10 options:UIViewAnimationOptionLayoutSubviews animations:^{
        
        _imageView.frame = CGRectMake(arc4random()%100, arc4random()%500, 200, 100);
        
    } completion:^(BOOL finished) {
        
    }];
    
}


#pragma mark - 2.关键帧动画，支持属性关键帧，不支持路径关键帧
///关键帧动画，支持属性关键帧，不支持路径关键帧
- (void)Keyframes{
    
    [UIView animateKeyframesWithDuration:8 delay:0 options:UIViewKeyframeAnimationOptionCalculationModeLinear animations:^{
        
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.25 animations:^{
            _imageView.frame = CGRectMake(0, 0,200, 100);
        }];
        [UIView addKeyframeWithRelativeStartTime:0.25 relativeDuration:0.25 animations:^{
            _imageView.frame = CGRectMake(50,100, 200, 100);
        }];
        [UIView addKeyframeWithRelativeStartTime:0.5 relativeDuration:0.25 animations:^{
            _imageView.frame = CGRectMake(100,150, 200, 100);
        }];
        [UIView addKeyframeWithRelativeStartTime:0.75 relativeDuration:0.25 animations:^{
            _imageView.frame = CGRectMake(150,200, 200, 100);
        }];
    } completion:nil];
    
    /*
     iOS7.0后新增关键帧动画，支持属性关键帧，不支持路径关键帧
     
     [UIView animateKeyframesWithDuration:(NSTimeInterval)//动画持续时间
     delay:(NSTimeInterval)//动画延迟执行的时间
     options:(UIViewKeyframeAnimationOptions)//动画的过渡效果
     animations:^{
     //执行的关键帧动画
     }
     completion:^(BOOL finished) {
     //动画执行完毕后的操作
     }];
     UIViewKeyframeAnimationOptions的枚举值如下，可组合使用：
     
     UIViewAnimationOptionLayoutSubviews           //进行动画时布局子控件
     UIViewAnimationOptionAllowUserInteraction     //进行动画时允许用户交互
     UIViewAnimationOptionBeginFromCurrentState    //从当前状态开始动画
     UIViewAnimationOptionRepeat                   //无限重复执行动画
     UIViewAnimationOptionAutoreverse              //执行动画回路
     UIViewAnimationOptionOverrideInheritedDuration //忽略嵌套动画的执行时间设置
     UIViewAnimationOptionOverrideInheritedOptions //不继承父动画设置
     
     UIViewKeyframeAnimationOptionCalculationModeLinear     //运算模式 :连续
     UIViewKeyframeAnimationOptionCalculationModeDiscrete   //运算模式 :离散
     UIViewKeyframeAnimationOptionCalculationModePaced      //运算模式 :均匀执行
     UIViewKeyframeAnimationOptionCalculationModeCubic      //运算模式 :平滑
     UIViewKeyframeAnimationOptionCalculationModeCubicPaced //运算模式 :平滑均匀
     
     增加关键帧的方法：
     
     [UIView addKeyframeWithRelativeStartTime:(double)//动画开始的时间（占总时间的比例）
     relativeDuration:(double) //动画持续时间（占总时间的比例）
     animations:^{
     //执行的动画
     }];
     
     */
    
}




/*
 
 3.过渡动画
 + (void)transitionWithView:(UIView *)view duration:(NSTimeInterval)duration options:(UIViewAnimationOptions)options animations:(void (^ __nullable)(void))animations completion:(void (^ __nullable)(BOOL finished))completion
 •    参数详情:
 view       :   需要进行转场动画的视图
 options    :   转场动画的类型
 + (void)transitionFromView:(UIView *)fromView toView:(UIView *)toView duration:(NSTimeInterval)duration options:(UIViewAnimationOptions)options completion:(void (^ __nullable)(BOOL finished))completion
 •    参数详情:
 方法调用完毕后，相当于执行了下面两句代码：
 // 添加toView到父视图
 [fromView.superview addSubview:toView];
 // 把fromView从父视图中移除
 [fromView removeFromSuperview];
 
 */

#pragma mark - 3.过渡动画
///过渡动画
- (void)transitionAnimation{
    //CALayer
    //****************************************************************************************************
    //在需要视图更改时
    //这是一个便捷的视图过渡 API，在动画过程中，首先将 fromView 从父视图中删除，然后将 toView 添加，就是做了一个替换操作。在需要视图更改时，这个将变得特别有用。
    [UIView transitionFromView:_imageView toView:_imageViewTwo duration:2 options:UIViewAnimationOptionTransitionCurlDown completion:^(BOOL finished) {
        
        self.view.backgroundColor = [UIColor redColor];
        _imageViewTwo.alpha = 1;
    }];
    
    
    //****************************************************************************************************
    
    //当一个视图的内容需要变化时，比如删除或增加子视图，可以使用过渡动画。
    //    [UIView transitionWithView:self.view duration:2 options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
    //
    //        _imageView.frame = CGRectMake(arc4random()%100, arc4random()%200, 200, 100);
    //
    //        self.view.backgroundColor = [UIColor redColor];
    //
    //    } completion:^(BOOL finished) {
    //
    //    }];
    
}

@end
