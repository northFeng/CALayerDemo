//
//  CAScrollLayer11.m
//  CALayer
//
//  Created by gaoyafeng on 2019/3/30.
//  Copyright © 2019 north_feng. All rights reserved.
//

#import "CAScrollLayer11.h"

@interface CAScrollLayer11 ()

@end

@implementation CAScrollLayer11

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //attach pan gesture recognizer
    UIPanGestureRecognizer *recognizer = nil;
    recognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.view addGestureRecognizer:recognizer];
}

- (void)pan:(UIPanGestureRecognizer *)recognizer
{
    //get the offset by subtracting the pan gesture
    //translation from the current bounds origin
    CGPoint offset = self.view.bounds.origin;
    offset.x -= [recognizer translationInView:self.view].x;
    offset.y -= [recognizer translationInView:self.view].y;
    
    //scroll the layer
    [(CAScrollLayer *)self.view.layer scrollToPoint:offset];
    
    //reset the pan gesture translation
    [recognizer setTranslation:CGPointZero inView:self.view];
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
