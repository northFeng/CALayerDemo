//
//  OneVC.h
//  CALayer
//
//  Created by gaoyafeng on 2019/3/26.
//  Copyright © 2019 north_feng. All rights reserved.
//

#import <UIKit/UIKit.h>

//获取屏幕 宽度、高度 APP_SCREEN_WIDTH  APP_SCREEN_HEIGHT APP_StatusBar_Height
#define APP_SCREEN_BOUNDS   ([[UIScreen mainScreen] bounds])
#define kScreenWidth  ([UIScreen mainScreen].bounds.size.width)
#define kScreenHeight ([UIScreen mainScreen].bounds.size.height)
#define kStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height
#define KSCALE [UIScreen mainScreen].bounds.size.width / 375.0
///y和x必须有一个为浮点型
#define kScaleHeight(y,x,width) (y)/(x)*(width)
#define kScaleW kScreenWidth/375.0
#define kScaleH kScreenHeight/667.0

//顶部条以及tabBar条的宽度，以及工具条距离安全区域的距离
#define APP_NaviBarHeight (kStatusBarHeight > 20 ? 88. : 64.)
#define APP_NaviBar_ItemBarHeight 44.
#define APP_TabBarHeight (kStatusBarHeight > 20 ? 83. : 49.)
#define APP_TabBar_ItemsHeight 49.

#define kTopNaviBarHeight (kStatusBarHeight > 20 ? 88. : 64.)
#define kTabBarHeight (kStatusBarHeight > 20 ? 83. : 49.)
#define kTabBarBottomHeight (kStatusBarHeight > 20 ? 34. : 0.)


NS_ASSUME_NONNULL_BEGIN

@interface OneVC : UIViewController <UITableViewDelegate,UITableViewDataSource>

///tableView (记得热点导致的适配问题，一定要用约束！！)
@property (nonatomic,strong,nullable) UITableView *tableView;

@end

NS_ASSUME_NONNULL_END
