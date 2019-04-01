//
//  CAEmitterLayer5.h
//  CALayer
//  粒子动画
//  Created by gaoyafeng on 2019/3/30.
//  Copyright © 2019 north_feng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CAEmitterLayer5 : UIViewController

@end

@interface EmitterButton : UIControl
/**是否选中***/
@property (assign,nonatomic,readonly) BOOL chose;
/**选中回调***/
@property (nonatomic, copy) void (^choseClick)(EmitterButton *button);

-(instancetype)initWithFrame:(CGRect)frame andNormalImage:(UIImage *)image andHighlightImage:(UIImage *)highlightImage andEffectImage:(UIImage *)EffImage;

@end

NS_ASSUME_NONNULL_END
