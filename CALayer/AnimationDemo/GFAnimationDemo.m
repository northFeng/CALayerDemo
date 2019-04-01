//
//  GFAnimationDemo.m
//  CALayer
//
//  Created by gaoyafeng on 2019/4/1.
//  Copyright © 2019 north_feng. All rights reserved.
//

#import "GFAnimationDemo.h"

#import "OneLoadingAnimationView.h"

@interface GFAnimationDemo ()

///
@property (nonatomic,strong,nullable) OneLoadingAnimationView *animationView;

@end

@implementation GFAnimationDemo

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.animationView = [[OneLoadingAnimationView alloc] init];
    self.animationView.frame = CGRectMake(0, 200, 375, 200);
    [self.view addSubview:self.animationView];
    
}


#pragma mark - user event
- (void)onTapStartAnimation:(id)sender {
    [self.animationView startSuccess];
}

- (void)startFail:(id)sender {
    [self.animationView startFail];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
