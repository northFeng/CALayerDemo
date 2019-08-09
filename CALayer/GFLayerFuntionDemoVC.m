//
//  GFLayerFuntionDemoVC.m
//  CALayer
//
//  Created by gaoyafeng on 2019/3/27.
//  Copyright © 2019 north_feng. All rights reserved.
//

#import "GFLayerFuntionDemoVC.h"

#import "CAAnimation0.h"

#import "CAEmitterLayer5.h"//粒子动画

#import "CALayer7.h"//图层基本属性

#import "CAReplicatorLayer10.h"//复制多个图层

#import "CAShapeLayer12.h"//控制绘制线条

#import "CATiledLayer14.h"//绘制超大图片

#import "CATransformLayer17.h"//绘制3D图层

#import "GFAnimationDemo.h"

#import "GFUIViewAnimation.h"

@interface GFLayerFuntionDemoVC ()

@end

@implementation GFLayerFuntionDemoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];

    switch (_typeLayer) {
        case 0:
            [self CAAnimation0];
            break;
        case 1:
            [self CADisplayLink1];
            break;
        case 2:
            [self CAEAGLLayer2];
            break;
        case 3:
            [self CAMetalLayer3];
            break;
        case 4:
            [self CAEmitterCell4];
            break;
        case 5:
            [self CAEmitterLayer5];
            break;
        case 6:
            [self CAGradientLayer6];
            break;
        case 7:
            [self CALayer7];
            break;
        case 8:
            [self CAMediaTiming8];
            break;
        case 9:
            [self CAMediaTimingFunction9];
            break;
        case 10:
            [self CAReplicatorLayer10];
            break;
        case 11:
            [self CAScrollLayer11];
            break;
        case 12:
            [self CAShapeLayer12];
            break;
        case 13:
            [self CATextLayer13];
            break;
        case 14:
            [self CATiledLayer14];
            break;
        case 15:
            [self CATransaction15];
            break;
        case 16:
            [self CATransform3D16];
            break;
        case 17:
            [self CATransformLayer17];
            break;
        case 18:
            [self CAValueFunction18];
            break;
        case 19:
            [self uiviewAnimation19];
            break;
            
        default:
            break;
    }
    
}

//https://www.kancloud.cn/manual/ios/97798  核心动画高级技巧系列
#pragma mark - 动画中keyPath 对应的属性
/**
 transform.rotation.x 绕着x轴旋转
 transform.rotation.y 绕着y轴旋转
 transform.rotation.z 绕着z轴旋转
 transform.rotation 默认绕着z轴旋转
 transform.scale.x x轴方向缩放
 transform.scale.y y轴方向缩放
 transform.scale.z z轴方向缩放
 transform.scale 默认x,y,z三个方向均等比缩放
 transform.translation.x 沿x轴方向平移
 transform.translation.y 沿y轴方向平移
 transform.translation.z 沿z轴方向平移
 transform.translation 默认沿x轴和y轴同时移动，设置值时应为NSSize或者CGSize
 */


///0CAAnimation
- (void)CAAnimation0{
    GFAnimationDemo *animationVC = [[GFAnimationDemo alloc] init];
    [self.navigationController pushViewController:animationVC animated:YES];
}

///1CADisplayLink
- (void)CADisplayLink1{
    
    //CADisplayLink
    //CADisplayLink 是用于同步屏幕刷新频率的计时器.
    
    /**
     
     + (CADisplayLink *)displayLinkWithTarget:(id)target selector:(SEL)sel;//初始化
     
     - (void)addToRunLoop:(NSRunLoop *)runloop forMode:(NSRunLoopMode)mode;//添加到runloop中
     每个计时器对象只能加入到一个runloop中,但是可以被添加到不同的模式中,当CADisplayLink被加入到runloop时,会被runloop隐式retain.如果想从所有的模式中移除计时器,需要执行-invalidate()方法.
     
     - (void)removeFromRunLoop:(NSRunLoop *)runloop forMode:(NSRunLoopMode)mode;//从runloop中移除
     - removeFromRunLoop: forMode:会将接收者从给定的模式中移除,这个方法会对计时器进行隐式的release.在调用removeFromRunloop方法,需要做判断,如果当期计时器不在runloop的话,会出现野指针的crash.出现crash的原因是runloop多次调用了release方法,进行了over-release.
     
     - (void)invalidate;//释放计时器 ——> 是从runloop所有模式中移除计时器,并取消计时器和target的关联关系.多次调用这个方法,不会出现crash.
     
     
     @property(readonly, nonatomic) CFTimeInterval timestamp;//这个属性用来返回上一次屏幕刷新的时间戳.如果视频播放的应用,可以通过时间戳来获取上一帧的具体时间,来计算下一帧.
     @property(readonly, nonatomic) CFTimeInterval duration;//属性用于提供屏幕最大刷新频率(maximumFramesPerSecond)下每一帧的时间间隔.这个属性可以用于在应用中获取帧率.
     
     @property(readonly, nonatomic) CFTimeInterval targetTimestamp
     
     @property(getter=isPaused, nonatomic) BOOL paused;//可以用于暂停通知. 控制事件触发 开启/暂停
     
     @property(nonatomic) NSInteger frameInterval;//帧间隔时间
     
     @property(nonatomic) NSInteger preferredFramesPerSecond
     
     修改帧率 : 如果在特定帧率内无法提供对象的操作,可以通过降低帧率解决.一个拥有持续稳定但是较慢帧率的应用要比跳帧的应用顺滑的多.
     可以通过preferredFramesPerSecond来设置每秒刷新次数.preferredFramesPerSecond默认值为屏幕最大帧率(maximumFramesPerSecond),目前是60.
     实际的屏幕帧率会和preferredFramesPerSecond有一定的出入,结果是由设置的值和屏幕最大帧率(maximumFramesPerSecond)相互影响产生的.规则大概如下:
     如果屏幕最大帧率(preferredFramesPerSecond)是60,实际帧率只能是15, 20, 30, 60中的一种.如果设置大于60的值,屏幕实际帧率为60.如果设置的是26~35之间的值,实际帧率是30.如果设置为0,会使用最高帧率.
     需要注意CADisplayLink是不能被继承的.
     
     */
    
}

///2CAEAGLLayer
- (void)CAEAGLLayer2{
    
    //OpenGL处理图层
    //CAEAGLLayer 大部分情况下你都不需要手动设置CAEAGLLayer（假设用GLKView）
    
    /**
     @interface CAEAGLLayer : CALayer <EAGLDrawable>
     {
     @private
     struct _CAEAGLNativeWindow *_win;
     }
     
     @property BOOL presentsWithTransaction API_AVAILABLE(ios(9.0), watchos(2.0), tvos(9.0));
     
     @end
     */
}

///3CAMetalLayer
- (void)CAMetalLayer3{
    
    /**
     CAMetalLayer 它是一个支持GPU(Graphics Processing Unit-图形处理器)加速3D绘图的API。
     设置 Metal框架
     */
    
}

///4CAEmitterCell
- (void)CAEmitterCell4{
    //CAEmitterCell
    /**
     粒子动画CAEmitterLayer CAEmitterCell
     
     */
    
}

///5CAEmitterLayer
- (void)CAEmitterLayer5{
    
    /**
     粒子动画CAEmitterLayer CAEmitterCell
     
     CAEmitterLayer是一个高性能的粒子引擎，被用来创建实时例子动画如：烟雾，火，雨等等这些效果。
     
     CAEmitterLayer看上去像是许多CAEmitterCell的容器，这些CAEmitierCell定义了一个例子效果。你将会为不同的例子效果定义一个或多个CAEmitterCell作为模版，同时CAEmitterLayer负责基于这些模版实例化一个粒子流。一个CAEmitterCell类似于一个CALayer：它有一个contents属性可以定义为一个CGImage，另外还有一些可设置属性控制着表现和行为。我们不会对这些属性逐一进行详细的描述，你们可以在CAEmitterCell类的头文件中找到。
     
     */
    CAEmitterLayer5 *layerVC = [[CAEmitterLayer5 alloc] init];
    [self.navigationController pushViewController:layerVC animated:YES];
    
}

///6CAGradientLayer 混合颜色 ——>颜色渐变
- (void)CAGradientLayer6{
    //CAGradientLayer
    /**
     CAGradientLayer是用来生成两种或更多颜色平滑渐变的。用Core Graphics复制一个CAGradientLayer并将内容绘制到一个普通图层的寄宿图也是有可能的，但是CAGradientLayer的真正好处在于绘制使用了硬件加速。

    @property(nullable, copy) NSArray *colors;//要展示的 颜色集合
    
    @property(nullable, copy) NSArray<NSNumber *> *locations;//值0-1, 对应颜色 的占比
    
    //他们决定了渐变的方向 左上角坐标是{0, 0}，右下角坐标是{1, 1}
    @property CGPoint startPoint;//值 0/1
    @property CGPoint endPoint;//值 0/1
     startPoint:0,1  endPoint:1,1  横向渐变
     startPoint:0,0  endPoint:0,1  垂直方向
     startPoint:0,0  endPoint:1,1  左上到右下，对角渐变
     startPoint:0,1  endPoint:1,0  左下到右上，对角渐变
    
    @property(copy) CAGradientLayerType type;
    
     */
    
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = CGRectMake(0, 0, 100, 100);
    gradient.startPoint = CGPointMake(0, 0);
    gradient.endPoint = CGPointMake(1, 1);
    gradient.locations = @[@0.3, @0.5, @0.6];
    gradient.colors = [NSArray arrayWithObjects:
                       (id)[UIColor redColor].CGColor,
                       (id)[UIColor greenColor].CGColor,
                       (id)[UIColor blueColor].CGColor,
                       nil];
    
    [self.view.layer addSublayer:gradient];
}

///7CALayer
- (void)CALayer7{
    //CALayer
    /**
    UIView多了一个事件处理的功能。也就是说，CALayer不能处理用户的触摸事件，而UIView可以
    所以，如果显示出来的东西需要跟用户进行交互的话，用UIView；如果不需要跟用户进行交互，用UIView或者CALayer都可以
    当然，CALayer的性能会高一些，因为它少了事件处理的功能，更加轻量级
     */
    
    /**CALayer
    Core Animation是跨平台的，支持iOS环境和Mac OS X环境
    凡是支持跨平台的框架，都不能直接使用UIKit框架，因为UIKit框架只能应用在iOS而不能用于Mac
    需要先理解CALayer，因为核心动画操作的对象是CALayer，而不是UIView
    CALayer是核心动画的基础，可以做圆角、阴影、边框等效果
    每个UIView内部都有一个Layer的属性
    在实现核心动画时，本质上是将CALayer中的内容转换成位图（一种图像格式），从而便于图形硬件的操纵
     
     CALayer的使用说明:
     通过UIView的layer属性可以拿到对应的根层，这个层不允许重新创建，但可以往层里面添加子层(调用CALayer的addSublayer)
     
     自己绘制寄宿图：
     方法－：继承UIView并实现-drawRect:（如果你不需要寄宿图，那就不要创建这个方法了，这会造成CPU资源和内存的浪费，这也是为什么苹果建议：如果没有自定义绘制的任务就不要在子类中写一个空的-drawRect:方法。）
     方法二：CALayer有一个可选的delegate属性，参考代码如下：
        blueLayer.delegate = self;
     
        [blueLayer display];
        - (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
        {
            //draw a thick red circle
            CGContextSetLineWidth(ctx, 10.0f);
            CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
            CGContextStrokeEllipseInRect(ctx, layer.bounds);
        }
     */
    
    /** CALayer基本属性
    设置UIView中的CALayer属性
     1、圆角、边框、阴影及3D形变属性
     2、在UIView中CALayer只是一个类声明，需要添加QuartzCore框架
     3、在使用颜色时，不能直接使用UIColor而需要将颜色转成CGColor
     4、修改图层相当于修改UIView属性，即修改了界面属性
     5、要设置阴影，需要同时指定阴影的偏移尺寸、颜色和透明度
     6、形变属性既可以用形变函数指定，也可以用keyPath指定
     */
    
    /** UIImageView的CALayer基本属性
    设置UIImageView中的CALayer属性
     1、圆角、边框、阴影
     2、UIImageView中不仅一个子图层，因此设置圆角时需要使用  setMasksToBounds:YES ！！ ， 让所有子图层跟随边框，不过设置该属性后，无法使用阴影效果 ——> 可以在底层附加一个UIView实现阴影效果
     
     3、设置UIImageView中的CALayer属性
        transform属性可以调整CALayer的形变，其中包括：旋转、缩放、平移
        transform属性的参数查询：CATransform
     */
}

///8CAMediaTiming动画遵守的时间协议 CAAnimation类及其子类在使用时，必须设置的属性
- (void)CAMediaTiming8{
    
    //CAMediaTiming 任何CAAnimation类都遵守这个协议，可以 直接设置以下属性
    
    /**
    @property CFTimeInterval beginTime;//动画的开始时， 默认为0
    @property CFTimeInterval duration;//动画持续时间，默认为0
    @property float speed;//动画执行速度
     
    @property CFTimeInterval timeOffset;//时间偏移量，默认为0
    
    @property float repeatCount;//重复次数，默认为0  MAXFLOAT最大
     
    @property CFTimeInterval repeatDuration;//重复间隔，默认为0
    
    @property BOOL autoreverses;//动画 自动逆向执行 ，默认为No  动画执行完后 自动 反向执行
    
    @property(copy) CAMediaTimingFillMode fillMode;//决定当前对象在应用程序非active时间段（动画开始之前或者动画结束之后）的行为。fillMode取值fillMode属性值（要想fillMode有效，最好设置removedOnCompletion = NO）
     fillModel属性值
     kCAFillModeForwards：当动画结束后，layer会一直保持着动画最后的状态
     kCAFillModeBackwards：在动画开始前，只需要将动画加入了一个layer，layer便立即进入动画的初始状态并等待动画开始
     kCAFillModeBoth：动画加入后开始之前，layer便处于动画初始状态，动画结束后layer保持动画最后的状态
     kCAFillModeRemoved：默认值，也就是说当动画开始前和动画结束后，动画对layer都没有影响，动画结束后，layer会恢复到之前的状态
     
     */
}

///9CAMediaTimingFunction 控制动画过程中的线性变换
- (void)CAMediaTimingFunction9{
    
    /**
     kCAMediaTimingFunctionLinear :线性动画
     kCAMediaTimingFunctionEaseIn :动画缓慢开始，然后逐渐加速
     kCAMediaTimingFunctionEaseOut :动画迅速开始，在结束时减速
     kCAMediaTimingFunctionEaseInEaseOut :动画慢慢开始，然后加速，在结束之前减速
     kCAMediaTimingFunctionDefault :系统默认动画效果
    + (instancetype)functionWithName:(CAMediaTimingFunctionName)name;//直接使用系统定义好的效果
    
    + (instancetype)functionWithControlPoints:(float)c1x :(float)c1y :(float)c2x :(float)c2y;
    
    - (instancetype)initWithControlPoints:(float)c1x :(float)c1y :(float)c2x :(float)c2y;
    
    - (void)getControlPointAtIndex:(size_t)idx values:(float[_Nonnull 2])ptr;
     */
    
    // 初始化layer
    CALayer *layer        = [CALayer layer];
    layer.frame           = CGRectMake(50, 50, 200, 2);
    layer.backgroundColor = [UIColor blackColor].CGColor;
    
    // 终点位置
    CGPoint endPosition = CGPointMake(layer.position.x, layer.position.y + 200);
    
    // 动画
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.fromValue         = [NSValue valueWithCGPoint:layer.position];
    animation.toValue           = [NSValue valueWithCGPoint:endPosition];
    //设置动画的曲线 ——> 类似于关键帧动画效果
    animation.timingFunction    = [CAMediaTimingFunction functionWithControlPoints:0.20 :0.03 :0.13 :1.00];
    layer.position              = endPosition;
    animation.duration          = 1.f;
    //设置动画执行完毕之后不删除动画
    animation.removedOnCompletion = NO;
    //设置保存动画的最新状态 控制动画结束后 最后的状态显示
    animation.fillMode = kCAFillModeForwards;
    //animation.autoreverses = YES;//是否反向执行
    
    // 添加动画
    [layer addAnimation:animation forKey:nil];
    // 添加layer
    [self.view.layer addSublayer:layer];
    
}

///10CAReplicatorLayer高效复制多个图层
- (void)CAReplicatorLayer10{
    
    //CAReplicatorLayer
    
    /**
     CAReplicatorLayer的目的是为了高效生成许多相似的图层。它会绘制一个或多个图层的子图层，并在每个复制体上应用不同的变换。
     
    @property NSInteger instanceCount;//设置复制图层中子层总数：这里包含原始层
    
    @property BOOL preservesDepth;
    
    @property CFTimeInterval instanceDelay;//1.2.设置复制层的动画延迟事件
    
    @property CATransform3D instanceTransform;//1.3.设置 复制子层 偏移量！！，不包含原始层，(在这里设置子复制图层的布局！！！！)（每一个子复制图层 相对 上一个子复制图层 的 3D 偏移量）
    
    @property(nullable) CGColorRef instanceColor;//设置复制层的背景色，如果原始层设置了背景色，这里设置就失去效果
    
    //设置复制层颜色的 “偏移量” 后一个复制图层 相对前一个图层 在颜色上进行 渐变
    @property float instanceRedOffset;
    @property float instanceGreenOffset;
    @property float instanceBlueOffset;
    @property float instanceAlphaOffset;
     */
    CAReplicatorLayer10 *layerVC = [[CAReplicatorLayer10 alloc] init];
    [self.navigationController pushViewController:layerVC animated:YES];
}

///11CAScrollLayer
- (void)CAScrollLayer11{
    
    /**
     CAScrollLayer提供了和UIScrollView的基本功能。只不过它是layer，只负责显示，不响应用户事件，也不提供滚动条。
     
     对于一个未转换的图层，它的bounds和它的frame是一样的，frame属性是由bounds属性自动计算而出的，所以更改任意一个值都会更新其他值。
     但是如果你只想显示一个大图层里面的一小部分呢。比如说，你可能有一个很大的图片，你希望用户能够随意滑动，或者是一个数据或文本的长列表。在一个典型的iOS应用中，你可能会用到UITableView或是UIScrollView，但是对于独立的图层来说，什么会等价于刚刚提到的UITableView和UIScrollView呢？
     这个时候就需要CAScrollLayer了。CAScrollLayer有一个-scrollToPoint:方法，它自动适应bounds的原点以便图层内容出现在滑动的地方。注意，这就是它做的所有事情。前面提到过，Core Animation并不处理用户输入，所以CAScrollLayer并不负责将触摸事件转换为滑动事件，既不渲染滚动条，也不实现任何iOS指定行为例如滑动反弹（当视图滑动超多了它的边界的将会反弹回正确的地方）。
     
     @interface CAScrollLayer : CALayer
     
    - (void)scrollToPoint:(CGPoint)p;//滚动到该点
     
    - (void)scrollToRect:(CGRect)r;//
    
    @property(copy) CAScrollLayerScrollMode scrollMode;
    
    @end
    
    @interface CALayer (CALayerScrolling)

    - (void)scrollPoint:(CGPoint)p;
    
    - (void)scrollRectToVisible:(CGRect)r;
     
    @property(readonly) CGRect visibleRect;
    
    @end
     
     */
    
}

///12CAShapeLayer控制绘制线条样式: 线条拐角样式、线条终端样式、线条宽度颜色、线条虚线、线条内填充颜色
- (void)CAShapeLayer12{
    
    /**
     
     CAShapeLayer是一个通过矢量图形而不是bitmap来绘制的图层子类。你指定诸如颜色和线宽等属性，用CGPath来定义想要绘制的图形，最后CAShapeLayer就自动渲染出来了。当然，你也可以用Core Graphics直接向原始的CALyer的内容中绘制一个路径，相比直下，使用CAShapeLayer有以下一些优点：
     渲染快速。CAShapeLayer使用了硬件加速，绘制同一图形会比用Core Graphics快很多。
     高效使用内存。一个CAShapeLayer不需要像普通CALayer一样创建一个寄宿图形，所以无论有多大，都不会占用太多的内存。
     不会被图层边界剪裁掉。一个CAShapeLayer可以在边界之外绘制。你的图层路径不会像在使用Core Graphics的普通CALayer一样被剪裁掉（如我们在第二章所见）。
     不会出现像素化。当你给CAShapeLayer做3D变换时，它不像一个有寄宿图的普通图层一样变得像素化。
     
    @interface CAShapeLayer : CALayer
    
    @property(nullable) CGPathRef path;//用CoreGraphics 或者 贝塞尔曲线 进行绘制
    
    @property(nullable) CGColorRef fillColor;//路径填充颜色，默认黑色，可动画属性
    
    @property(copy) CAShapeLayerFillRule fillRule;//路径填充规则，奇偶或者非零，默认是非零
     kCAFillRuleNonZero
     kCAFillRuleEvenOdd
     
    
    @property(nullable) CGColorRef strokeColor;//// 描边颜色，默认为nil，可动画属性
    
    // 描边的起点和终点
    @property CGFloat strokeStart;// 它表示描线开始的地方占总路径的百分比
    @property CGFloat strokeEnd;// 表示绘制结束的地方站总路径的百分比
    
    @property CGFloat lineWidth;//描边的宽，默认为1，可动画属性
    
    @property CGFloat miterLimit;// 最大斜街长度
     最大斜接长度。斜接长度指的是在两条线交汇处和外交之间的距离。只有lineJoin属性为kCALineJoinMiter时miterLimit才有效。边角的角度越小，斜接长度就会越大。为了避免斜接长度过长，我们可以使用miterLimit属性。如果斜接长度超过miterLimit的值，边角会以lineJoin的“bevel”即kCALineJoinBevel类型来显示
     

    @property(copy) CAShapeLayerLineCap lineCap;// 线端点的样式
     kCALineCapButt:线端点类似屁股 线的中间内凹
     kCALineCapRound:线端点 半圆
     kCALineCapSquare:线端点 方行
    
    
    @property(copy) CAShapeLayerLineJoin lineJoin;// 线拐点的样式
     kCALineJoinMiter:拐角三角
     kCALineJoinRound:拐角圆角
     kCALineJoinBevel:拐角切平
    
    
    @property CGFloat lineDashPhase;// 边线模版的起点 默认为0 线条虚线样式 开始起点位置
    
    @property(nullable, copy) NSArray<NSNumber *> *lineDashPattern;// 设置边线的样式，默认为实线
     这是一个NSNumber的数组，索引从1开始记，奇数位数值表示实线长度，偶数位数值表示空白长度。系统会按照数值自动重复设置虚线。
     //第一个是 线条长度   第二个是间距
     border.lineDashPattern = @[@2, @1];
    
    @end
    
     */
    
    CAShapeLayer12 *layerVC = [[CAShapeLayer12 alloc] init];
    [self.navigationController pushViewController:layerVC animated:YES];

}

///13CATextLayer
- (void)CATextLayer13{
    
    /**
     CATextLayer也要比UILabel渲染得快得多。很少有人知道在iOS 6及之前的版本，UILabel其实是通过WebKit来实现绘制的，这样就造成了当有很多文字的时候就会有极大的性能压力。而CATextLayer使用了Core text，并且渲染得非常快。
     让我们来尝试用CATextLayer来显示一些文字。
     
    @interface CATextLayer : CALayer
    
    @property(nullable, copy) id string;//绘制的字符串
    
    @property(nullable) CFTypeRef font;//字体
    
    @property CGFloat fontSize;//字体大小
    
    @property(nullable) CGColorRef foregroundColor;//字体颜色
    
    @property(getter=isWrapped) BOOL wrapped;
    
    @property(copy) CATextLayerTruncationMode truncationMode;//文字截断模式
     kCATruncationNone
     kCATruncationStart:...见覅大家啊
     kCATruncationEnd:附加积分...
     kCATruncationMiddle:计费计费...见覅大发
    
    @property(copy) CATextLayerAlignmentMode alignmentMode;//对齐方式
     kCAAlignmentNatural:自然
     kCAAlignmentLeft:居左
     kCAAlignmentRight:居右
     kCAAlignmentCenter:居中
     kCAAlignmentJustified:两端对齐
    
    @property BOOL allowsFontSubpixelQuantization;
    
    @end

     */
}

///14CATiledLayer绘制超大图片
- (void)CATiledLayer14{
    
    /**
     CATiledLayer为载入大图造成的性能问题提供了一个解决方案：将大图分解成小片然后将他们单独按需载入。让我们用实验来证明一下。
     
     @interface CATiledLayer : CALayer
     
     + (CFTimeInterval)fadeDuration;//将新添加的图像“淡入”到 呈现平铺层的表示。默认实现 返回0.25秒。*
    
    @property size_t levelsOfDetail;//指的是该图层缓存的缩小LOD数目，默认值为1，每进一级会对前一级分辨率的一半进行缓存，图层的levelsOfDetail最大值，对应至少一个像素点。
    
    @property size_t levelsOfDetailBias;//指的是该图层缓存的放大LODB数目，它是layer的放大级别重绘设置，默认为0，即不会额外缓存放大层次，每进一级会对前一级两倍分辨率进行缓存。
    
    @property CGSize tileSize;//（默认是256x256）tiledSize是layer划分视图区域最大尺寸，主要是影响layer的切片数量。
    
     */
    
    CATiledLayer14 *layerVC = [[CATiledLayer14 alloc] init];
    [self.navigationController pushViewController:layerVC animated:YES];
}

///15CATransaction Core Animation 中的事务类
- (void)CATransaction15{
    
    
    /**
     CATransaction是 Core Animation 中的事务类，在iOS中的图层中，图层的每个改变都是事务的一部分，CATransaction可以对多个layer的属性同时进行修改，同时负责成批的把多个图层树的修改作为一个原子更新到渲染树。
     */
    //动画过程中，修改某个属性 会在动画中显示出来 ，而通过 CATransaction会控制修改的属性 是否显示出来 ——>隐式事物(动画过程中不显示出来)  显式事物(动画过程中显示出来)
    
    /**显示出来
     
     修改执行时间
     [CATransaction begin];
     
     //显式事务默认开启动画效果,kCFBooleanTrue关闭
     [CATransaction setValue:(id)kCFBooleanFalse
     forKey:kCATransactionDisableActions];
     //动画执行时间
     [CATransaction setValue:[NSNumber numberWithFloat:5.0f] forKey:kCATransactionAnimationDuration];
     //[CATransaction setAnimationDuration:[NSNumber numberWithFloat:5.0f]];
     anotherLayer.cornerRadius = (anotherLayer.cornerRadius == 0.0f) ? 30.0f : 0.0f;
     layer.opacity = (layer.opacity == 1.0f) ? 0.5f : 1.0f;
     
     [CATransaction commit];
     */
    
    /**不显示
    -(IBAction)changeLayerProperty
    {
        //设置变化动画过程是否显示，默认为YES不显示
        [CATransaction setDisableActions:NO];
        //设置圆角
        layer.cornerRadius = (layer.cornerRadius == 0.0f) ? 30.0f : 0.0f;
        //设置透明度
        layer.opacity = (layer.opacity == 1.0f) ? 0.5f : 1.0f;
    }
     */
}

///16CATransform3D
- (void)CATransform3D16{
    
    //CATransform3D 图层3D变化
    
    /** CATransform3D结构体解释
    struct CATransform3D
    {
        CGFloat m11, m12, m13, m14;
        CGFloat m21, m22, m23, m24;
        CGFloat m31, m32, m33, m34;
        CGFloat m41, m42, m43, m44;
    };
    
    {CGFloat     m11（x缩放）,    m12（y切变）,    m13（旋转）,    m14（）;
     CGFloat     m21（x切变）,    m22（y缩放）,    m23（）   ,    m24（）;
     CGFloat     m31（旋转） ,    m32（ ）  ,     m33（）   ,    m34（透视效果，要操作的这个对象要有旋转的角度，否则没有效果。正直/负值都有意义）;
     CGFloat     m41（x平移）,    m42（y平移）,    m43（z平移）,   m44（）;};
     
     */
    
    /* 1、平移
     * Returns a transform that translates by '(tx, ty, tz)':
     * t' =  [1 0 0 0; 0 1 0 0; 0 0 1 0; tx ty tz 1].
     tx：X轴偏移位置，往下为正数。
     ty：Y轴偏移位置，往右为正数。
     tz：Z轴偏移位置，往外为正数。//可以控制图层的层叠位置tz越大图层越靠上
     */
    //CATransform3DMakeTranslation (CGFloat tx, CGFloat ty, CGFloat tz)
    //CATransform3DTranslate (CATransform3D t, CGFloat tx, CGFloat ty, CGFloat tz) //函数的叠加，效果的叠加——>在CATransform3D t基础上继续变化
    
    
    /* 2、缩放
     * Returns a transform that scales by `(sx, sy, sz)':
     * t' = [sx 0 0 0; 0 sy 0 0; 0 0 sz 0; 0 0 0 1].
     
     sx：X轴缩放，代表一个缩放比例，一般都是 0 --- 1 之间的数字。
     
     sy：Y轴缩放。
     
     sz：整体比例变换时，也就是m11（sx）== m22（sy）时，若m33（sz）>1，图形整体缩小，若0<1，图形整体放大，若m33（sz）<0，发生关于原点的对称等比变换。
     */
    //CATransform3DMakeScale (CGFloat sx, CGFloat sy, CGFloat sz)
    //CATransform3D CATransform3DScale (CATransform3D t, CGFloat sx, CGFloat sy, CGFloat sz) //函数的叠加，效果的叠加——>在CATransform3D t基础上继续变化
    
    
    /* 3、旋转
     * Returns a transform that rotates by 'angle' radians about the vector
     * '(x, y, z)'. If the vector has length zero the identity transform is
     * returned.
     
     angle：旋转的弧度，所以要把角度转换成弧度：角度 * M_PI / 180。
     
     x：向X轴方向旋转。值范围-1 --- 1之间
     
     y：向Y轴方向旋转。值范围-1 --- 1之间
     
     z：向Z轴方向旋转。值范围-1 --- 1之间
     */
    //CATransform3DMakeRotation (CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
    //CATransform3DRotate (CATransform3D t, CGFloat angle, CGFloat x, CGFloat y, CGFloat z) //函数的叠加，效果的叠加——>在CATransform3D t基础上继续变化
    
    
    /* 4、3D属性的运算*
     Concatenate 'b' to 'a' and return the result: t' = a * b.
     */
    //CATransform3DConcat (CATransform3D a, CATransform3D b)
    
    /* 5、3D反转计算
     * Invert 't' and return the result. Returns the original matrix if 't'
     * has no inverse.
     */
    //CATransform3D CATransform3DInvert (CATransform3D t)
    
    
    /* 6、CGAffineTransform 结构体转换 CATransform3D
     * Return a transform with the same effect as affine transform 'm'.
     */
    //CATransform3D CATransform3DMakeAffineTransform (CGAffineTransform m)
    
    /* Returns true if 't' can be represented exactly by an affine transform. */
    //bool CATransform3DIsAffine (CATransform3D t) //变换函数同时提供了可以比较一个变换矩阵是否是单位矩阵,或者两个矩阵是否相等。
    //CATransform3DEqualToTransform (CATransform3D a, CATransform3D b);//比较两个矩阵是否相等
    
    /* 7、CATransform3D 结构体转换 CGAffineTransform
     * Returns the affine transform represented by 't'. If 't' can not be
     * represented exactly by an affine transform the returned value is
     * undefined. */
    //CGAffineTransform CATransform3DGetAffineTransform (CATransform3D t)
}

///17CATransformLayer
- (void)CATransformLayer17{
    
    /**
     当我们在构造复杂的3D事物的时候，如果能够组织独立元素就太方便了。比如说，你想创造一个孩子的手臂：你就需要确定哪一部分是孩子的手腕，哪一部分是孩子的前臂，哪一部分是孩子的肘，哪一部分是孩子的上臂，哪一部分是孩子的肩膀等等。
     当然是允许独立地移动每个区域的啦。以肘为指点会移动前臂和手，而不是肩膀。Core Animation图层很容易就可以让你在2D环境下做出这样的层级体系下的变换，但是3D情况下就不太可能，因为所有的图层都把他的孩子都平面化到一个场景中（第五章『变换』有提到）。
     CATransformLayer解决了这个问题，CATransformLayer不同于普通的CALayer，因为它不能显示它自己的内容。只有当存在了一个能作用域子图层的变换它才真正存在。CATransformLayer并不平面化它的子图层，所以它能够用于构造一个层级的3D结构，比如我的手臂示例。
     用代码创建一个手臂需要相当多的代码，所以我就演示得更简单一些吧：在第五章的立方体示例，我们将通过旋转camara来解决图层平面化问题而不是像立方体示例代码中用的sublayerTransform。这是一个非常不错的技巧，但是只能作用域单个对象上，如果你的场景包含两个立方体，那我们就不能用这个技巧单独旋转他们了。
     那么，就让我们来试一试CATransformLayer吧，第一个问题就来了：在第五章，我们是用多个视图来构造了我们的立方体，而不是单独的图层。我们不能在不打乱已有的视图层次的前提下在一个本身不是有寄宿图的图层中放置一个寄宿图图层。我们可以创建一个新的UIView子类寄宿在CATransformLayer（用+layerClass方法）之上。但是，为了简化案例，我们仅仅重建了一个单独的图层，而不是使用视图。这意味着我们不能像第五章一样在立方体表面显示按钮和标签，不过我们现在也用不到这个特性。
     清单6.5就是代码。我们以我们在第五章使用过的相同基本逻辑放置立方体。但是并不像以前那样直接将立方面添加到容器视图的宿主图层，我们将他们放置到一个CATransformLayer中创建一个独立的立方体对象，然后将两个这样的立方体放进容器中。我们随机地给立方面染色以将他们区分开来，这样就不用靠标签或是光亮来区分他们。图6.5是运行结果。
     */
    
    CATransformLayer17 *layerVC = [[CATransformLayer17 alloc] init];
    [self.navigationController pushViewController:layerVC animated:YES];
    
}


///18CAValueFunction 动画属性Value keyPath
- (void)CAValueFunction18{
    
    /**
    + (nullable instancetype)functionWithName:(CAValueFunctionName)name;
    
    @property(readonly) CAValueFunctionName name;

    CA_EXTERN CAValueFunctionName const kCAValueFunctionRotateX
    CA_EXTERN CAValueFunctionName const kCAValueFunctionRotateY
    CA_EXTERN CAValueFunctionName const kCAValueFunctionRotateZ
    
    CA_EXTERN CAValueFunctionName const kCAValueFunctionScale
    
    CA_EXTERN CAValueFunctionName const kCAValueFunctionScaleX
    CA_EXTERN CAValueFunctionName const kCAValueFunctionScaleY
    CA_EXTERN CAValueFunctionName const kCAValueFunctionScaleZ
    
    CA_EXTERN CAValueFunctionName const kCAValueFunctionTranslate
    
    CA_EXTERN CAValueFunctionName const kCAValueFunctionTranslateX
    CA_EXTERN CAValueFunctionName const kCAValueFunctionTranslateY
    CA_EXTERN CAValueFunctionName const kCAValueFunctionTranslateZ
     */
}

///
- (void)uiviewAnimation19{
    
    GFUIViewAnimation *uiview = [[GFUIViewAnimation alloc] init];
    [self.navigationController pushViewController:uiview animated:YES];
}


@end
