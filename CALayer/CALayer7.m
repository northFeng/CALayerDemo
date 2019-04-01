//
//  CALayer7.m
//  CALayer
//
//  Created by gaoyafeng on 2019/3/30.
//  Copyright © 2019 north_feng. All rights reserved.
//

#import "CALayer7.h"

@interface CALayer7 ()

@end

@implementation CALayer7

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
}

///
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
    
    /** 图层和视图之间的关系
     创建视图对象时，视图会自己创建一个层，视图在绘图（如drawRect:）时，会将内容画在自己的层上。当视图在层上完成绘图后，系统会将图层拷贝至屏幕（CALayer绘图的上下文是图像，整个画完后，才显示，提前绘制提高性能以及用户体验）。每个视图都有一个层，每个图层又可以有多个子层
     Layer的设计目的不是为了取代视图，不能基于CALayer创建一个独立的可视化组件
     Layer的设计目的是提供视图的基本可视内容，以便提高动画的执行效率
     除提供可视内容外，Layer不负责视图的事件响应等工作，同时Layer不能参与到响应者链条中
     */
    
    
    /**
     - (nullable instancetype)presentationLayer;
     
     - (instancetype)modelLayer;
     
     //这三个用于 解档/归档  CALayer为所有类及其子类定义的Objective C属性实现了标准的NSKeyValueCoding协议。它动态地为子类声明的属性实现缺少的访问器方法。
     + (nullable id)defaultValueForKey:(NSString *)key;//类似KVC通过key路径获取属性值
     
     //重新绘制图层时 ——> 可以控制是否重新绘制
     + (BOOL)needsDisplayForKey:(NSString *)key;//layer首次加载时会调用该方法 ——> 来判断当前指定的参数key改变是否需要重新绘制。
     当Core Animartion中的key或者keypath等于+(BOOL)needsDisplayForKey:(NSString *)key方法中指定的key，便会自动调用setNeedsDisplay方法，这样就会触发重绘，达到我们想要的效果。
     layer方法响应链
     1、[layer setNeedDisplay] -> [layer displayIfNeed] -> [layer display] -> [layerDelegate displayLayer:]
     2、[layer setNeedDisplay] -> [layer displayIfNeed] -> [layer display] -> [layer drawInContext:] -> [layerDelegate drawLayer: inContext:]
     
     - (BOOL)shouldArchiveValueForKey:(NSString *)key;//判断layer对象中的属性 如果可以归档就返回YES，否则返回NO
  
**************************************** 常规属性设置 ******************************************
     @property(nullable, copy) NSString *name;//layer的标识
     @property CGRect bounds;//宽度和高度
     @property CGPoint position;//锚点所在位置的坐标 (默认指中心点，具体由anchorPoint决定) 类似UIView的center属性
     @property CGFloat zPosition;//该层在其上层位置的Z分量(可以调整自图层的前后位置！！) 增加图层的zPosition，就可以把图层向相机方向前置，于是它就在所有其他图层的前面了
     @property CGPoint anchorPoint;//锚点（x,y的范围都是0-1），决定了position的含义 默认为 （0.5，0.5）——> 决定 position的位置（UIView的属性center中心点相对本身layer上的位置）例如设置layer的左上角为中心点
     @property CGFloat anchorPointZ;//层的锚点(即参考点)的Z分量  默认值为零
     @property CATransform3D transform;//图层3D属性设置 ——> 做动画使用
     //获取 当前图层的 图层变化属性 返回值 CG类
     - (CGAffineTransform)affineTransform;
     - (void)setAffineTransform:(CGAffineTransform)m;
     @property CGRect frame;//layer相对父图层的位置&尺寸
     @property(getter=isHidden) BOOL hidden;
     @property(getter=isDoubleSided) BOOL doubleSided;//CALayer有一个叫做doubleSided的属性来控制图层的背面是否要被绘制。这是一个BOOL类型，默认为YES，如果设置为NO，那么当图层正面水平翻转180度后该图层什么也看不见，它将不会被绘制。
     
     @property(getter=isGeometryFlipped) BOOL geometryFlipped;//默认NO  为YES该属性可以改变默认图层y坐标的方向。
     如果设置为yes，则子图层或者子视图本来相对于左上角放置改为相对于左下角放置。也可以这么理解geometryFlipped决定了一个图层的坐标是否相对于父图层垂直翻转，默认情况下是NO，也就是从左上角开始绘制，当把值改为YES的时候这个图层和他的子图层将会被垂直翻转，也就是从左下角开始绘制。
     
     @property BOOL masksToBounds;//裁剪
     @property(getter=isOpaque) BOOL opaque;//透明度
     
     @property CATransform3D sublayerTransform;//设置自图层3D属性
     @property(nullable, strong) __kindof CALayer *mask;//往layer上添加一个遮罩(图层窗口)，底层下的layer与遮罩重合部分之外的部分都看不见（类似古代窗户，窗户上的条纹中间可以看到里面）
     
     - (BOOL)contentsAreFlipped;//默认返回NO ——> 判断该图层在绘制过程中图层内容是否被翻转
     如果渲染时，图层的content被隐式的翻转就返回YES，否则返回NO
     
     @property CAEdgeAntialiasingMask edgeAntialiasingMask;
     @property BOOL allowsEdgeAntialiasing
     
     @property(nullable) CGColorRef backgroundColor;//背景颜色
     @property CGFloat cornerRadius;//圆角
     @property CACornerMask maskedCorners;//遮罩圆角
     @property CGFloat borderWidth;//边框宽度
     @property(nullable) CGColorRef borderColor;//边框颜色
     @property float opacity;//透明度
     @property BOOL allowsGroupOpacity
     
     //滤镜
     @property(nullable, strong) id compositingFilter;
     @property(nullable, copy) NSArray *filters;
     @property(nullable, copy) NSArray *backgroundFilters;
     
     //阴影
     @property(nullable) CGColorRef shadowColor;//阴影颜色
     @property float shadowOpacity;//阴影透明度
     @property CGSize shadowOffset;//阴影偏移 CRSize(0,0)四周阴影 makeTOBound不能为YES
     @property CGFloat shadowRadius;//阴影圆角
     @property(nullable) CGPathRef shadowPath;//阴影path贝塞尔曲线绘制
     
     
**************************************** 自图层顺序处理 && 图层移除添加 && 图层之间 坐标&时间 转换 ******************************************
     //自图层 && 父图层 操作
     @property(nullable, readonly) CALayer *superlayer;
     - (void)removeFromSuperlayer;
     @property(nullable, copy) NSArray<__kindof CALayer *> *sublayers;
     //图层顺序操作
     - (void)addSublayer:(CALayer *)layer;
     - (void)insertSublayer:(CALayer *)layer atIndex:(unsigned)idx;
     - (void)insertSublayer:(CALayer *)layer below:(nullable CALayer *)sibling;
     - (void)insertSublayer:(CALayer *)layer above:(nullable CALayer *)sibling;
     - (void)replaceSublayer:(CALayer *)oldLayer with:(CALayer *)newLayer;
     
     //图层之间 坐标转换
     - (CGPoint)convertPoint:(CGPoint)p fromLayer:(nullable CALayer *)l;
     - (CGPoint)convertPoint:(CGPoint)p toLayer:(nullable CALayer *)l;
     - (CGRect)convertRect:(CGRect)r fromLayer:(nullable CALayer *)l;
     - (CGRect)convertRect:(CGRect)r toLayer:(nullable CALayer *)l;
     //图层间 时间转换
     - (CFTimeInterval)convertTime:(CFTimeInterval)t fromLayer:(nullable CALayer *)l;
     - (CFTimeInterval)convertTime:(CFTimeInterval)t toLayer:(nullable CALayer *)l;
     
     //CALayer并不关心任何响应链事件，所以不能直接处理触摸事件或者手势。但是它有一系列的方法帮你处理事件：-containsPoint:和-hitTest:。
     - (BOOL)containsPoint:(CGPoint)p;
     - (nullable __kindof CALayer *)hitTest:(CGPoint)p;
     
     
****************************** 自定义layer内容显示 及设置 显示属性 *************************
     @property(nullable, strong) id contents;//CGImageRef 图层显示该属性中的图像
     用法；
     CGImageRef img = [UIImage imageNamed:@"test.png"].CGImage;
     //创建CALayer
     CALayer *layer = [CALayer layer];
     //设置CALayer的内容
     layer.contents = (__bridge id)img;
     layer.frame = CGRectMake(20, 20, CGImageGetWidth(img), CGImageGetHeight(img));
     //添加Layer到View
     [self.view.layer addSublayer:layer];
     
     @property CGRect contentsRect;//设置layer内容显示的尺寸 值 0-1(是一个比例值)
     //选择右上角的四分之一为内容
     layer.contentsRect = CGRectMake(0.5, 0, 0.5, 0.5);
     
     @property(copy) CALayerContentsGravity contentsGravity;//目的是为了决定内容在图层的边界中怎么对齐 默认值是kCAGravityResize (UIview中的内容填充方式)
     //拉伸
     layer.contentsGravity = kCAGravityResize;
     
     
     @property CGFloat contentsScale;//（默认1.0）该值定义了图层的逻辑坐标空间（以点为单位）和物理坐标空间（以像素为单位）之间的映射 ——> 图层内容尺寸 * contentsScale
     如果比例因子为2.0，图层边界为50 x 50点，则用于呈现图层内容的位图大小为100 x 100像素。
     此属性的默认值是1.0。 对于附加到视图的图层，视图自动将比例因子自动更改为适合当前屏幕的值。 对于您自己创建和管理的图层，您必须根据屏幕的分辨率和您提供的内容自行设置此属性的值。Core Animation使用您指定的值作为提示来确定如何呈现您的内容。
     contentsScale 也会跟填充模式有关，默认1.0比例，设置填充满，会自动改变该 比例值
     
     
     //因为contentsCenter属性只有在图片被拉伸后才会起作用，contentsCenter可以用来定义全面拉伸的范围
     @property CGRect contentsCenter;//值默认设置为单位矩形（0.0,0.0）（1.0,1.0）
     标准化图像坐标中的矩形定义“contents”图像的缩放中心部分。 当由于其“contentsGravity”属性而调整图像大小时
     中心部分隐含地定义了3x3网格，其控制如何将图像缩放到其绘制的大小。 中间部分在两个方向都被拉伸; 顶部和底部只有水平伸展; 左右部分只是垂直拉伸; 四个角落部分根本不被拉伸。 （这通常被称为“9-slice scaling”）。
     在应用“contentsRect”属性的效果之后，该矩形被解释。 它默认为单位矩形[0 0 1 1]，意味着整个图像被缩放。 作为特殊情况，如果宽度或高度为零，则隐式地调整为以该位置为中心的单个源像素的宽度或高度。 如果矩形延伸到[0 0 1 1]单位矩形之外，则结果是不确定的，可动画。
     
     当layer被拉伸时，contentsCenter属性设置的范围矩形 四个方向进行放大/缩小  该矩形四周其他的图层则会 水平拉伸/垂直拉伸 layer四角可能不变
     
     //左下角的四分之一拉伸
     layer.contentsCenter = CGRectMake(0, 0.5, 0.5, 0.5);
     
     //图层内容格式属性
     @property(copy) CALayerContentsFormat contentsFormat;//默认值是kCAContentsFormatRGBA8Uint 色值的组成形式
     
     
     @property(copy) CALayerContentsFilter minificationFilter;//minification过滤器用于缩小图像数据的大小时
     @property(copy) CALayerContentsFilter magnificationFilter;//magnification过滤器增加图像数据的大小
     渲染图层的“contents”属性时使用的过滤器类型。 minification过滤器用于缩小图像数据的大小时，
     magnification过滤器增加图像数据的大小。 目前允许的值是`nearest' 和 `linear'的。 这两个
     属性默认为`linear'。
     
     @property float minificationFilterBias;
     
     
****************************** 绘制触发方法 *************************
     - (void)display;
     
     //layer调用这两个方法 ——>触发 自身重新绘制
     - (void)setNeedsDisplay;
     - (void)setNeedsDisplayInRect:(CGRect)r;
     
     @property BOOL needsDisplayOnBoundsChange;
     @property BOOL drawsAsynchronously
     
     //重新绘制 会触发这个方法，在继承 CALayer类中重写该方法
     - (void)drawInContext:(CGContextRef)ctx;
     
     
     //代理
     @property(nullable, weak) id <CALayerDelegate> delegate;
     //不用继承类中写，在被代理类中 代理，实现该代理
     - (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx;//在这里进行重新绘制
     
     [layer setNeedsDisplay];//只有调用这个方法，才会触发两种方法进行绘制！！！！！
     
    
****************************** layer添加动画API **************************************
     
     //将动画添加到视图的layer层，“key”作为这个动画的唯一标示符，可以是任意唯一的字符串或为空；
     - (void)addAnimation:(CAAnimation *)anim forKey:(nullable NSString *)key;//添加一个动画
     - (void)removeAllAnimations;//移除所有动画
     - (void)removeAnimationForKey:(NSString *)key;//根据key标记移除对应动画
     - (nullable NSArray<NSString *> *)animationKeys;//获取添加所有动画key
     - (nullable __kindof CAAnimation *)animationForKey:(NSString *)key;//根据key获取对应添加的动画
     
     */
    
}

@end
