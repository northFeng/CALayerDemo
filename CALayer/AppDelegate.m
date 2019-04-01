//
//  AppDelegate.m
//  CALayer
//
//  Created by gaoyafeng on 2019/3/26.
//  Copyright © 2019 north_feng. All rights reserved.
//

#import "AppDelegate.h"

#import "OneVC.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    // 让当前UIWindow变成keyWindow，并显示出来
    [self.window makeKeyAndVisible];
    
    OneVC *one = [[OneVC alloc] initWithNibName:@"OneVC" bundle:nil];
    /**
    one.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemHistory tag:0];
    
    TwoVC *two = [[TwoVC alloc] initWithNibName:@"TwoVC" bundle:nil];
    two.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFeatured tag:1];
    
    ThrVC *thr = [[ThrVC alloc] initWithNibName:@"ThrVC" bundle:nil];
    thr.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemBookmarks tag:2];
    
    UITabBarController *tabBarVC = [[UITabBarController alloc] init];
    
    tabBarVC.viewControllers = @[one,two,thr];
     */
    
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:one];
    
    self.window.rootViewController = navi;
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
