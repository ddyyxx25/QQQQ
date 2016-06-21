//
//  ViewController.m
//  CADemo
//
//  Created by John Duan on 16/3/1.
//  Copyright © 2016年 __BWSOFT__. All rights reserved.
//

#import "ViewController.h"

static int ar[5];

@interface ViewController ()
@property (strong,nonatomic) UIView *layerView;

@end

@implementation ViewController
{
    CALayer *myLayer;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
//    self.view.backgroundColor = [UIColor lightGrayColor];
//    self.layerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
//    self.layerView.backgroundColor = [UIColor whiteColor];
//    self.layerView.center = self.view.center;
//    [self.view addSubview:self.layerView];
//    [self setInterface];
    
    //textLayer
    [self textLayer];
    
//    int *ar2 = ss(5);
//    for (int i = 0; i < sizeof(ar)/sizeof(int); i++) {
//        int q = ar2[i];
//       printf("%d\n",q);
//    }
//

    
    
    //实例化自定义图层
    myLayer = [CALayer layer];
    //设置大小
    [myLayer setBounds:CGRectMake(0, 0, 100, 100)];
    //设置背景颜色
    [myLayer setBackgroundColor:[UIColor redColor].CGColor];
    [myLayer setPosition:CGPointMake(50, 50)];
    [self.view.layer addSublayer:myLayer];
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = touches.anyObject;
    CGPoint location = [touch locationInView:self.view];
    //关闭动画
    //    [CATransaction begin];
    //    [CATransaction setDisableActions:YES];
    //    [CATransaction commit];
    //位置
    [CATransaction begin];
    [CATransaction setAnimationDuration:3.0];
    [CATransaction setDisableActions:YES];
    NSArray *aa = @[[UIColor redColor], [UIColor blackColor]];
    myLayer.backgroundColor = ((UIColor *)aa[arc4random() % 2]).CGColor;
    [CATransaction commit];
}


int * ss(int a)
{
    
    int ab[5];
//    a = (int *)malloc(sizeof(int)*5);
    for (int i = 0; i < 5; i++) {
        ar[i] = i * a;
    }
    for (int i = 0; i < sizeof(ar)/sizeof(int); i++) {
        printf("%d,%d\n", ar[i],sizeof(ar)/sizeof(int));
    }
    return ar;
}

- (void)setInterface
{
    CALayer *blueLayer = [CALayer layer];
    blueLayer.frame = CGRectMake(0, 0, 200, 200);
    blueLayer.backgroundColor = [UIColor blueColor].CGColor;
    [self.layerView.layer addSublayer:blueLayer];
    blueLayer.delegate = self;
    blueLayer.contentsScale = [UIScreen mainScreen].scale;
    
    [blueLayer display];
    
//    self.layerView.layer.contents = (__bridge id)[UIImage imageNamed:@"2"].CGImage;
//    self.layerView.layer.contentsGravity = kCAGravityCenter;
//    self.layerView.layer.contentsScale = [UIImage imageNamed:@"2"].scale;
//    self.layerView.layer.masksToBounds = YES;
//    self.layerView.layer.contentsRect = CGRectMake(0, 0, 0.5, 0.5);
    
//    self.layerView.layer.contentsCenter = CGRectMake(0, 0, 0.5, 0.5);
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    CGContextSetLineWidth(ctx, 0.5f);
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextStrokeEllipseInRect(ctx, CGRectMake(0, 0, 200, 200));
}

- (void)textLayer
{
    CATextLayer *textLayer = [CATextLayer layer];
    textLayer.frame = self.view.bounds;
    [self.view.layer addSublayer:textLayer];
    
    textLayer.foregroundColor = [UIColor redColor].CGColor;
    textLayer.alignmentMode = kCAAlignmentJustified;
    textLayer.wrapped = YES;
    
    UIFont *font = [UIFont systemFontOfSize:15.0];
    
    CFStringRef fontName = (__bridge CFStringRef)font.fontName;
    CGFontRef fontRef = CGFontCreateWithFontName(fontName);
    textLayer.font = fontRef;
    textLayer.fontSize = font.pointSize;
    CGFontRelease(fontRef);
    
    NSString *string = @"Hybrid App的兴起是现阶段移动互联网产业的一种偶然。移动互联网的热潮刮起后，众多公司前赴后继的进入。但是很快发现移动应用的开发人员太少，所以导致疯狂的人才争夺。市场机制下移动应用开发人才的待遇扶摇直上，最终变成众多企业无法负担养一个具备跨平台开发能力的专业移动应用开发团队。而HTML5的出现让Web App露出曙光，HTML5开发移动应用的跨平台和廉价优势让众多想进入移动互联网领域的公司开始心动。可是当下基于HTML5的Web App更是雾里看花，在用户入口习惯、分发渠道和应用体验这三个核心问题没解决之前，Web App也很难得以爆发。正是在这样是机缘巧合下，基于HTML5低成本跨平台开发优势又兼具Native App特质的Hybrid App技术杀入混战，并且很快吸引了众人的目光。大幅的降低了移动应用的开发成本，可以通过现有应用商店模式发行，在用户桌面形成独立入口等等这些，让Hybrid App成为解决移动应用开发困境不错的选择，也成为现阶段Web App的代言人。Hybrid App像刺客一样，在Native App和Web App混战之时，偶然间的在移动应用开发领域占有了一席之地。";
    textLayer.string = string;
    
    textLayer.contentsScale = [UIScreen mainScreen].scale;
}
@end
