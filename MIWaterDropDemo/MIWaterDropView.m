//
//  MIWaterDropView.m
//  MIWaterDropDemo
//
//  Created by lynnjinglei on 15/10/28.
//  Copyright © 2015年 XiaoLei. All rights reserved.
//

#import "MIWaterDropView.h"
#import "MIFactory.h"

#define waterWidth 100
#define r waterWidth / 2
#define angle M_PI / 6
#define x waterWidth / 2
#define y waterWidth / 2

@implementation MIWaterDropView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        self.backgroundColor = [MIFactory colorWithHexString:@"#c8c8c8"];
        self.scoreColor = [MIFactory colorWithHexString:@"#00bbdd"];

        
//        [self createScoreLabel];
    }
    return self;
}
- (void)createScoreLabel
{
    self.scoreLabel = [[UILabel alloc]init];
    self.scoreLabel.frame = CGRectMake(0, 0, waterWidth, 16);
    self.scoreLabel.backgroundColor = [UIColor clearColor];
    self.scoreLabel.text = @"0";
    self.scoreLabel.font = [UIFont systemFontOfSize:10];
    self.scoreLabel.textAlignment = NSTextAlignmentCenter;
    self.scoreLabel.textColor = [UIColor whiteColor];
    [self addSubview:self.scoreLabel];
    
    self.scoreColor = [MIFactory colorWithHexString:@"#00bbdd"];
}
- (void)drawRect:(CGRect)rect
{
    [self tmp];
}
- (void)tmp
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, self.scoreColor.CGColor);//填充颜色
    CGContextSetStrokeColorWithColor(context, self.scoreColor.CGColor);
    CGContextSetLineWidth(context, 1);
    
    CGContextAddArc(context, x, y, r,  0, 2 * M_PI, 0);
    CGContextDrawPath(context, kCGPathStroke);
    
    
    
    //    CGContextClosePath(context);
    
    //    CGContextBeginPath(context);
    CGContextMoveToPoint(context, x - r * cos(angle), y + r * sin(angle));
    CGContextAddLineToPoint(context, x, r/(cos(M_PI / 2 - angle)) + y);
    CGContextAddLineToPoint(context, x + r * cos(angle), y + r * sin(angle));
    CGContextAddLineToPoint(context, x - r * cos(angle), y + r * sin(angle));
    
    //    CGContextAddArcToPoint(context, x, r/(cos(M_PI / 2 - angle)) + y, x - r * cos(angle), y + r * sin(angle), 50);
    //    CGContextAddLineToPoint(context, x - r * cos(angle), y + r * sin(angle));
    
    //    CGContextDrawPath(context, kCGPathFillStroke); //绘制路径加填充
    //    CGContextFillPath(context);
    CGContextDrawPath(context, kCGPathStroke);
    //    CGContextClosePath(context);
}
//绘制圆，不填充
- (void)drawCircleWithoutFill
{
    CGContextRef context = UIGraphicsGetCurrentContext();//首先创建画布
    CGContextSetStrokeColorWithColor(context, self.scoreColor.CGColor);//绘制颜色
    CGContextSetLineWidth(context, 1);//线的宽度
    
    /**
     *  根据初始左边、半径、弧度画圆
     *
     *  @param c#>          画布 description#>
     *  @param x#>          起始点x坐标 description#>
     *  @param y#>          起始点y坐标 description#>
     *  @param radius#>     半径 description#>
     *  @param startAngle#> 初始弧度，0是圆的最右边与圆心水平的点 eg:M_PI就是最左边的点 description#>
     *  @param endAngle#>   结束弧度 角度是从0开始顺时针计算的 description#>
     *  @param clockwise#>  顺时针还是逆时针，0顺时针，1逆时针 description#>
     *
     *  @return nil
     */
    CGContextAddArc(context, x, y, r, 0, 2 * M_PI, 1);
    CGContextDrawPath(context, kCGPathStroke);
}
//绘制圆，填充
- (void)drawCircleWithFill
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, self.scoreColor.CGColor);//设置填充颜色
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);//边线颜色，需要时，与填充颜色一致
    CGContextSetLineWidth(context, 0.5);//填充是，边线宽度可去掉
    CGContextAddArc(context, x, y, r, 0, 2 * M_PI, 1);
    CGContextDrawPath(context, kCGPathFillStroke);//kCGPathFillStroke绘制模式：填充
}
//水滴，无填充
- (void)drawWaterDropWithoutFill
{
    CGContextRef context = UIGraphicsGetCurrentContext();//首先创建画布
    CGContextSetStrokeColorWithColor(context, self.scoreColor.CGColor);//绘制颜色
    CGContextSetLineWidth(context, 1);//线的宽度
    
    CGContextAddArc(context, x, y, r, 0 + M_PI / 6, M_PI - M_PI / 6, 1);//首先画大半个圆形
    
    CGContextAddLineToPoint(context, x, y + (r / cosf(M_PI / 2 - angle)));//接着从start point开始画直线，目标坐标为最下方的点
    CGContextAddLineToPoint(context, x + r * cosf(angle), y + r * sinf(angle));//接着以end point为终点画直线即可
    CGContextDrawPath(context, kCGPathStroke);
}
@end
