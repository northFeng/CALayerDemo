//
//  CAEmitterLayer5.m
//  CALayer
//
//  Created by gaoyafeng on 2019/3/30.
//  Copyright © 2019 north_feng. All rights reserved.
//

#import "CAEmitterLayer5.h"

@interface CAEmitterLayer5 ()

@end

@implementation CAEmitterLayer5

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
}


///CAEmitterLayer属性
- (void)CAEmitteerLayer5{
    
    /**
    //装着CAEmitterCell对象的数组，被用于把粒子投放到layer上
    @property(nullable, copy) NSArray<CAEmitterCell *> *emitterCells;
    //粒子产生系数，默认1.0
    @property float birthRate;
    //粒子生命周期
    @property float lifetime;
    //发射位置
    @property CGPoint emitterPosition;
    //发射源的z坐标位置
    @property CGFloat emitterZPosition;
    //发射源的大小
    @property CGSize emitterSize;
    //决定粒子形状的深度联系：emitter shape
    @property CGFloat emitterDepth;
    
    //发射源的形状
    @property(copy) NSString *emitterShape;
    - 取值
    NSString * const kCAEmitterLayerPoint;
    NSString * const kCAEmitterLayerLine;
    NSString * const kCAEmitterLayerRectangle;
    NSString * const kCAEmitterLayerCuboid;
    NSString * const kCAEmitterLayerCircle;
    NSString * const kCAEmitterLayerSphere;
    
    //发射模式
    @property(copy) NSString *emitterMode;
    - 取值
    NSString * const kCAEmitterLayerPoints;
    NSString * const kCAEmitterLayerOutline;
    NSString * const kCAEmitterLayerSurface;
    NSString * const kCAEmitterLayerVolume;
    
    //渲染模式
    @property(copy) NSString *renderMode;
    - 取值
    NSString * const kCAEmitterLayerUnordered;
    NSString * const kCAEmitterLayerOldestFirst;
    NSString * const kCAEmitterLayerOldestLast;
    NSString * const kCAEmitterLayerBackToFront;
    NSString * const kCAEmitterLayerAdditive;
    
    //不是多很清楚（粒子是平展在层上）
    @property BOOL preservesDepth;
    //粒子速度
    @property float velocity;
    //粒子的缩放比例
    @property float scale;
    //自旋转速度
    @property float spin;
    //用于初始化随机数产生的种子
    @property unsigned int seed;
     
     */
}

///粒子属性
- (void)CAEmitterCall4{
    
    /**
    //初始化方法
    + (instancetype)emitterCell;
    //根据健 获 得 值
    + (nullable id)defaultValueForKey:(NSString *)key;
    //是否 归 档莫 键值
    - (BOOL)shouldArchiveValueForKey:(NSString *)key;
    //粒子的名字
    @property(nullable, copy) NSString *name;
    //粒子是否被渲染
    @property(getter=isEnabled) BOOL enabled;
    //粒子参数的速度乘数因子
    @property float birthRate;
    //生命周期
    @property float lifetime;
    //生命周期范围
    @property float lifetimeRange;
    //发射的 z 轴方向的角度
    @property CGFloat emissionLatitude;
    //x-y 平面的 发 射方向
    @property CGFloat emissionLongitude;
    //周 围发射角度
    @property CGFloat emissionRange;
    //速度
    @property CGFloat velocity;
    //速度范围
    @property CGFloat velocityRange;
    //粒子 x 方向的加速度分量
    @property CGFloat xAcceleration;
    //粒子 y 方向的加速度分量
    @property CGFloat yAcceleration;
    //粒子 z 方向的加速度分量
    @property CGFloat zAcceleration;
    //缩放比例
    @property CGFloat scale;
    //缩放比例范围
    @property CGFloat scaleRange;
    //缩放比例速度
    @property CGFloat scaleSpeed;
    //子旋转角度
    @property CGFloat spin;
    //子旋转角度范围
    @property CGFloat spinRange;
    //粒子的颜色
    @property(nullable) CGColorRef color;
    //一个粒子的 颜 色 red   能改 变 的范 围
    @property float redRange;
    //一个粒子的 颜 色 green   能改 变 的范 围
    @property float greenRange;
    //一个粒子的 颜 色 blue   能改 变 的范 围
    @property float blueRange;
    //一个粒子的 颜 色 alpha 能改 变 的范 围
    @property float alphaRange;
    //粒子 red 在生命周期内的改变速度
    @property float redSpeed;
    //粒子 green 在生命周期内的改变速度
    @property float greenSpeed;
    //粒子 blue 在生命周期内的改变速度
    @property float blueSpeed;
    //粒子透明度在生命周期内的改变速度
    @property float alphaSpeed;
    //是个 CGImageRef 的对象 , 既粒子要展现的图片
    @property(nullable, strong) id contents;
    //应该画在 contents 里的子 rectangle
    @property CGRect contentsRect;
    //定义了寄宿图的像素尺寸和视图大小的比例，默认情况下它是一个值为1.0的浮点数
    @property CGFloat contentsScale;
    //减小自己的大小
    @property(copy) NSString *minificationFilter;
    //不是很清楚好像增加自己的大小
    @property(copy) NSString *magnificationFilter;
    //减小大小的因子
    @property float minificationFilterBias;
    //粒子发射的粒子
    @property(nullable, copy) NSArray<CAEmitterCell *> *emitterCells;
    //类似于层的继承的属性(不是很清楚)
    @property(nullable, copy) NSDictionary *style;
     */
}


@end



@interface EmitterButton ()
{
    UIImage *Nimage;
    UIImage *Himage;
    UIImage *Eimage;
    UIImageView *imageView;
    BOOL isChose;
    CAEmitterLayer *emitterLayer;
    CAEmitterCell *emitterCell;
}
@end
@implementation EmitterButton
-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        Himage = [UIImage imageNamed:@"Zan"];
        Nimage = [UIImage imageNamed:@"UnZan"];
        Eimage = [UIImage imageNamed:@"EffectImage"];
        [self setUpSubviews];
    }
    return self;
}
-(instancetype)initWithFrame:(CGRect)frame andNormalImage:(UIImage *)image andHighlightImage:(UIImage *)highlightImage andEffectImage:(UIImage *)EffImage
{
    self = [super initWithFrame:frame];
    if (self) {
        Nimage = image;
        Himage = highlightImage;
        Eimage = EffImage;
        [self setUpSubviews];
    }
    return self;
}

-(void)setUpSubviews
{
    imageView = [[UIImageView alloc]init];
    imageView.frame = self.bounds;
    imageView.userInteractionEnabled = YES;
    [imageView setImage:Nimage];
    [self addSubview:imageView];//添加一个动画
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageViewTap)];
    [imageView addGestureRecognizer:tap];
    
    emitterLayer = [CAEmitterLayer layer];
    //设置发射位置
    [emitterLayer setEmitterPosition:CGPointMake(CGRectGetWidth(self.frame)/2.0, CGRectGetHeight(self.frame)/2.0)];
    //设置发射源的大小
    [emitterLayer setEmitterSize:CGSizeMake(CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))];
    //设置发射源的形状
    [emitterLayer setEmitterShape:kCAEmitterLayerCircle];
    //设置发射模式
    [emitterLayer setEmitterMode:kCAEmitterLayerOutline];
    
    [self.layer addSublayer:emitterLayer];//自身添加粒子动画layer
    
    emitterCell = [CAEmitterCell emitterCell];
    //设置粒子的名字
    [emitterCell setName:@"emitterButton"];
    //设置粒子速度
    [emitterCell setVelocity:50];
    //设置粒子速度范围
    [emitterCell setVelocityRange:50];
    //设置粒子参数的速度乘数因子
    [emitterCell setBirthRate:0];
    //设置粒子生命周期
    [emitterCell setLifetime:1.0];
    //设置粒子透明度在生命周期内的改变速度
    [emitterCell setAlphaSpeed:-1];
    //设置粒子要展现的图片,是个 CGImageRef 的对象
    [emitterCell setContents:(__bridge id)Eimage.CGImage];
    
    [emitterLayer setEmitterCells:@[emitterCell]];
}

-(void)imageViewTap{
    isChose = !isChose;
    [self setCurrentImage];
    imageView.bounds = CGRectZero;
    [UIView animateWithDuration:0.25 delay:0 options:0.3 animations:^{
        [imageView setBounds:self.bounds];
        if (isChose)
        {
            CABasicAnimation *baseAnimat = [CABasicAnimation animationWithKeyPath:@"emitterCells.emitterButton.birthRate"];
            [baseAnimat setFromValue:[NSNumber numberWithFloat:100]];
            [baseAnimat setToValue:[NSNumber numberWithFloat:0]];
            baseAnimat.duration = 0;
            baseAnimat.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
            [emitterLayer addAnimation:baseAnimat forKey:@"effectButton"];
        }
    } completion:nil];
    
}
-(void)setCurrentImage
{
    if (isChose) {
        [imageView setImage:Himage];
    }else{
        [imageView setImage:Nimage];
    }
}

-(BOOL)chose
{
    return isChose;
}
@end
