//
//  ESFireworkAnimationButton.h
//  esReadStudent
//
//  Created by NSong on 2019/6/14.
//  Copyright © 2019 wjy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ESFireworkAnimationButton : UIButton
@property (nonatomic, strong) UIImage *particleImage;
@property (nonatomic, assign) CGFloat particleScale;
@property (nonatomic, assign) CGFloat particleScaleRange;

- (void)animate;
- (void)popOutsideWithDuration:(NSTimeInterval)duration;
- (void)popInsideWithDuration:(NSTimeInterval)duration;
@end

NS_ASSUME_NONNULL_END

/**
//用法
ESFireworkAnimationButton *collectBtn = [[ESFireworkAnimationButton alloc]init];
collectBtn.particleImage = [UIImage imageNamed:@"es_read_collect_sel"];
collectBtn.particleScale = 0.05f;
collectBtn.particleScaleRange = 0.02f;
[collectBtn addTarget:self action:@selector(praiseAction:) forControlEvents:UIControlEventTouchUpInside];
[collectBtn setImage:[UIImage imageNamed:@"es_read_collect"] forState:UIControlStateNormal];
[collectBtn setImage:[UIImage imageNamed:@"es_read_collect_sel"] forState:UIControlStateSelected];
//    collectBtn.backgroundColor = RandomColor;
[naviView addSubview:collectBtn];
self.collectBtn = collectBtn;
 */
