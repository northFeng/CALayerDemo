//
//  CAAnimation0.h
//  CALayer
//  核心动画
//  Created by gaoyafeng on 2019/3/30.
//  Copyright © 2019 north_feng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CAAnimation0 : UIViewController

@end

NS_ASSUME_NONNULL_END
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
