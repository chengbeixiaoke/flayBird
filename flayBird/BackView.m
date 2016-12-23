//
//  BackView.m
//  flayBird
//
//  Created by WangYangyang on 2016/12/14.
//  Copyright © 2016年 com.WYY. All rights reserved.
//

#import "BackView.h"
#define V_H self.frame.size.height

@implementation BackView

- (void)backView1 {
    
    UIImageView *img11 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 80, 150)];
    img11.image = [UIImage imageNamed:@"1"];
    [self addSubview:img11];
    UIImageView *img12 = [[UIImageView alloc]initWithFrame:CGRectMake(0, V_H - 150, 80, 150)];
    img12.image = [UIImage imageNamed:@"b1"];
    [self addSubview:img12];
    
    UIImageView *img21 = [[UIImageView alloc]initWithFrame:CGRectMake(80 * 2, 0, 80, 150)];
    img21.image = [UIImage imageNamed:@"1"];
    [self addSubview:img21];
    UIImageView *img22 = [[UIImageView alloc]initWithFrame:CGRectMake(80 * 2, V_H - 180, 80, 180)];
    img22.image = [UIImage imageNamed:@"b1"];
    [self addSubview:img22];
    
    UIImageView *img31 = [[UIImageView alloc]initWithFrame:CGRectMake(80 * 4, 0, 80, 180)];
    img31.image = [UIImage imageNamed:@"1"];
    [self addSubview:img31];
    UIImageView *img32 = [[UIImageView alloc]initWithFrame:CGRectMake(80 * 4, V_H - 150, 80, 150)];
    img32.image = [UIImage imageNamed:@"b1"];
    [self addSubview:img32];
    
    UIImageView *img41 = [[UIImageView alloc]initWithFrame:CGRectMake(80 * 6, 0, 80, 180)];
    img41.image = [UIImage imageNamed:@"1"];
    [self addSubview:img41];
    UIImageView *img42 = [[UIImageView alloc]initWithFrame:CGRectMake(80 * 6, V_H - 180, 80, 180)];
    img42.image = [UIImage imageNamed:@"b1"];
    [self addSubview:img42];
    
    UIImageView *img51 = [[UIImageView alloc]initWithFrame:CGRectMake(80 * 8, 0, 80, 200)];
    img51.image = [UIImage imageNamed:@"1"];
    [self addSubview:img51];
    UIImageView *img52 = [[UIImageView alloc]initWithFrame:CGRectMake(80 * 8, V_H - 150, 80, 150)];
    img52.image = [UIImage imageNamed:@"b1"];
    [self addSubview:img52];
    
    UIImageView *img61 = [[UIImageView alloc]initWithFrame:CGRectMake(80 * 10, 0, 80, 180)];
    img61.image = [UIImage imageNamed:@"1"];
    [self addSubview:img61];
    UIImageView *img62 = [[UIImageView alloc]initWithFrame:CGRectMake(80 * 10, V_H - 200, 80, 200)];
    img62.image = [UIImage imageNamed:@"b1"];
    [self addSubview:img62];
    
    UIImageView *img71 = [[UIImageView alloc]initWithFrame:CGRectMake(80 * 12, 0, 80, 180)];
    img71.image = [UIImage imageNamed:@"1"];
    [self addSubview:img71];
    UIImageView *img72 = [[UIImageView alloc]initWithFrame:CGRectMake(80 * 12, V_H - 150, 80, 150)];
    img72.image = [UIImage imageNamed:@"b1"];
    [self addSubview:img72];
    
    UIImageView *img81 = [[UIImageView alloc]initWithFrame:CGRectMake(80 * 14, 0, 80, 180)];
    img81.image = [UIImage imageNamed:@"1"];
    [self addSubview:img81];
    UIImageView *img82 = [[UIImageView alloc]initWithFrame:CGRectMake(80 * 14, V_H - 180, 80, 180)];
    img82.image = [UIImage imageNamed:@"b1"];
    [self addSubview:img82];
    
    UIImageView *img91 = [[UIImageView alloc]initWithFrame:CGRectMake(80 * 16, 0, 80, 150)];
    img91.image = [UIImage imageNamed:@"1"];
    [self addSubview:img91];
    UIImageView *img92 = [[UIImageView alloc]initWithFrame:CGRectMake(80 * 16, V_H - 200, 80, 200)];
    img92.image = [UIImage imageNamed:@"b1"];
    [self addSubview:img92];
    
    UIImageView *img101 = [[UIImageView alloc]initWithFrame:CGRectMake(80 * 18, 0, 80, 200)];
    img101.image = [UIImage imageNamed:@"1"];
    [self addSubview:img101];
    UIImageView *img102 = [[UIImageView alloc]initWithFrame:CGRectMake(80 * 18, V_H - 200, 80, 200)];
    img102.image = [UIImage imageNamed:@"b1"];
    [self addSubview:img102];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
