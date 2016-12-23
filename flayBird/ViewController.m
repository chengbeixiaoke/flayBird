//
//  ViewController.m
//  flayBird
//
//  Created by WangYangyang on 2016/12/14.
//  Copyright © 2016年 com.WYY. All rights reserved.
//

#import "ViewController.h"
#import "GameViewController.h"

@interface ViewController ()

@property (strong, nonatomic)UIImageView *lawnImgView;

@property (assign, nonatomic)int lawnMove;

@property (strong, nonatomic)UIImageView *bird;

@property (assign, nonatomic)BOOL birdMove;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    UIImageView *backImg = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    backImg.image = [UIImage imageNamed:@"backImg"];
    [self.view addSubview:backImg];
    
    self.lawnMove = 0;
    
    self.birdMove = YES;
    
    [self foundLawnImgView];
    
    [self foundBirdImg];
    
    [self foundStateBut];
    
}
- (void)foundLawnImgView {
    
    self.lawnImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 490, 640, 20)];
    self.lawnImgView.image = [UIImage imageNamed:@"lawn"];
    [self.view addSubview:_lawnImgView];
    
    [NSTimer scheduledTimerWithTimeInterval:0.2 repeats:YES block:^(NSTimer * _Nonnull timer) {
        
        if (self.lawnImgView.frame.origin.x > -320) {
            self.lawnMove ++;
            self.lawnImgView.frame = CGRectMake(-5 * _lawnMove, 490, 640, 20);
        }else {
            self.lawnMove = 0;
            self.lawnImgView.frame = CGRectMake(0, 490, 640, 20);
        }
    }];
}

- (void)foundBirdImg {
    
    self.bird = [[UIImageView alloc]initWithFrame:CGRectMake(220, 130, 45, 30)];
    self.bird.image = [UIImage imageNamed:@"birda1"];
    [self.view addSubview:_bird];
    
    [NSTimer scheduledTimerWithTimeInterval:0.2 repeats:YES block:^(NSTimer * _Nonnull timer) {
        
        if (_birdMove) {
            self.bird.frame = CGRectMake(220, 135, 45, 30);
            self.bird.image = [UIImage imageNamed:@"birda2"];
            self.birdMove = NO;
        }else {
            self.bird.frame = CGRectMake(220, 130, 45, 30);
            self.bird.image = [UIImage imageNamed:@"birda1"];
            self.birdMove = YES;
        }
    }];
}

- (void)foundStateBut {
    
    UIButton *but = [[UIButton alloc]initWithFrame:CGRectMake(120, 290, 80, 40)];
    but.backgroundColor = [UIColor clearColor];
    [but addTarget:self action:@selector(state) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:but];
}

- (void)state {
    GameViewController *gameVc = [[GameViewController alloc]init];
    [self presentViewController:gameVc animated:NO completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
