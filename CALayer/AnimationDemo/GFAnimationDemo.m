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
    
    UIButton *btnOne = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnOne setTitle:@"开始" forState:UIControlStateNormal];
    [btnOne setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btnOne addTarget:self action:@selector(onTapStartAnimation) forControlEvents:UIControlEventTouchUpInside];
    btnOne.frame = CGRectMake(100, 500, 50, 30);
    [self.view addSubview:btnOne];
    
    UIButton *btnTwo = [UIButton buttonWithType:UIButtonTypeCustom];
    [btnTwo setTitle:@"停止" forState:UIControlStateNormal];
    [btnTwo setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [btnTwo addTarget:self action:@selector(startFail) forControlEvents:UIControlEventTouchUpInside];
    btnTwo.frame = CGRectMake(250, 500, 50, 30);
    [self.view addSubview:btnTwo];

}


#pragma mark - user event
- (void)onTapStartAnimation {
    [self.animationView startSuccess];
}

- (void)startFail {
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
