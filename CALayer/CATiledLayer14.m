//
//  CATiledLayer14.m
//  CALayer
//
//  Created by gaoyafeng on 2019/3/30.
//  Copyright © 2019 north_feng. All rights reserved.
//

#import "CATiledLayer14.h"

@interface CATiledLayer14 ()<CALayerDelegate>

@property (nonatomic,strong,nullable) UIScrollView *scrollView;

@end

@implementation CATiledLayer14

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.scrollView = [[UIScrollView alloc] init];
    self.scrollView.frame = CGRectMake(50, 50, 300, 400);
    [self.view addSubview:self.scrollView];
    
    //绘制超大图片
    CATiledLayer *tileLayer = [CATiledLayer layer];
    tileLayer.frame = CGRectMake(0, 0, 2048, 2048);
    tileLayer.delegate = self;
    
    [self.scrollView.layer addSublayer:tileLayer];
    
    //configure the scroll view
    self.scrollView.contentSize = tileLayer.frame.size;
    
    //draw layer
    [tileLayer setNeedsDisplay];//绘制——>触发下面的代理
}

- (void)drawLayer:(CATiledLayer *)layer inContext:(CGContextRef)ctx
{
    //determine tile coordinate
    CGRect bounds = CGContextGetClipBoundingBox(ctx);
    int x = floor(bounds.origin.x / layer.tileSize.width);
    int y = floor(bounds.origin.y / layer.tileSize.height);
    
    //load tile image 加载小图片
    NSString *imageName = [NSString stringWithFormat: @"Snowman_%2d_%02d", x, y];
    NSString *imagePath = [[NSBundle mainBundle] pathForResource:imageName ofType:@"jpg"];
    UIImage *tileImage = [UIImage imageWithContentsOfFile:imagePath];
    
    //draw tile
    UIGraphicsPushContext(ctx);
    [tileImage drawInRect:bounds];
    UIGraphicsPopContext();
}



@end
