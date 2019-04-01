//
//  CAShapeLayer12.m
//  CALayer
//
//  Created by gaoyafeng on 2019/4/1.
//  Copyright © 2019 north_feng. All rights reserved.
//

#import "CAShapeLayer12.h"

#import "ChangeAnimationView.h"

@interface CAShapeLayer12 ()

@property (strong , nonatomic) ChangeAnimationView *animationView;


@end

@implementation CAShapeLayer12

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    _animationView = [[ChangeAnimationView alloc] initWithFrame:CGRectMake(0, 150, self.view.bounds.size.width, 120)];
    [self.view addSubview:_animationView];
    
    
    
    UIButton *startButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    startButton.frame = CGRectMake(10, 300, 100, 50);
    [startButton addTarget:self action:@selector(startAnimation:) forControlEvents:UIControlEventTouchUpInside];
    [startButton setTitle:@"启动动画" forState:UIControlStateNormal];
    [self.view addSubview:startButton];
    
    UIButton *stopButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    stopButton.frame = CGRectMake(110, 300, 100, 50);
    [stopButton addTarget:self action:@selector(stopAnimation:) forControlEvents:UIControlEventTouchUpInside];
    [stopButton setTitle:@"暂停动画" forState:UIControlStateNormal];
    [self.view addSubview:stopButton];
    
    UIButton *resumeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    resumeButton.frame = CGRectMake(210, 300, 100, 50);
    [resumeButton addTarget:self action:@selector(resumeAnimation:) forControlEvents:UIControlEventTouchUpInside];
    [resumeButton setTitle:@"恢复动画" forState:UIControlStateNormal];
    [self.view addSubview:resumeButton];
    
}

-(void)startAnimation:(UIButton *)sender
{
    [_animationView startAnimation];
}


-(void)stopAnimation:(UIButton *)sender
{
    [_animationView stopAnimation];
}

-(void)resumeAnimation:(UIButton *)sender
{
    [_animationView resumeAnimation];
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
