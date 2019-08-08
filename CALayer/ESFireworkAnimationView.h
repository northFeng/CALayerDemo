//
//  ESFireworkAnimationView.h
//  esReadStudent
//
//  Created by NSong on 2019/6/14.
//  Copyright © 2019 wjy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ESFireworkAnimationView : UIView
@property (nonatomic, strong) UIImage *particleImage;
@property (nonatomic, assign) CGFloat particleScale;
@property (nonatomic, assign) CGFloat particleScaleRange;
- (void)animate;
@end

NS_ASSUME_NONNULL_END
