//
//  GameViewController.m
//  flayBird
//
//  Created by WangYangyang on 2016/12/14.
//  Copyright © 2016年 com.WYY. All rights reserved.
//

#import "GameViewController.h"
#import "BackView.h"

@interface GameViewController ()

@property (strong, nonatomic)UIImageView *lawnImgView;

@property (assign, nonatomic)int lawnMove;

@property (strong, nonatomic)UIImageView *bird;

@property (assign, nonatomic)BOOL birdMove;

@property (strong, nonatomic)NSTimer *myTimer;

@property (assign, nonatomic)float birdHeight;

@property (assign, nonatomic)float declineRate;

@property (assign, nonatomic)int goUpRate;

@property (strong, nonatomic)BackView *backView1;

@property (assign, nonatomic)float backViewMoveDistance;

@property (strong, nonatomic)NSTimer *backViewTimer;

@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *backImg = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    backImg.image = [UIImage imageNamed:@"backImg2"];
    [self.view addSubview:backImg];
    
    self.lawnMove = 0;
    
    self.birdMove = YES;
    
    self.birdHeight = 280;
    
    self.declineRate = 0;
    
    self.goUpRate = 20;
    
    self.backViewMoveDistance = 320;
    
    [self foundLawnImgView];
    
    [self foundBackView];
    
    [self foundBirdImg];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(controlMove:) name:@"11" object:nil];
    
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

- (void)foundBackView {
    
    self.backView1 = [[BackView alloc]initWithFrame:CGRectMake(_backViewMoveDistance, 0, 80 *  20, 450)];
    [self.backView1 backView1];
    [self.view addSubview:_backView1];
}
- (void)foundBirdImg {
    
    self.bird = [[UIImageView alloc]initWithFrame:CGRectMake(50, _birdHeight, 45, 30)];
    self.bird.image = [UIImage imageNamed:@"birdstop"];
    [self.view addSubview:_bird];
    
    [self birdDeclineAction];
    
    [self backView1MoveAction];
}

- (void)birdDeclineAction {
    self.myTimer = [NSTimer scheduledTimerWithTimeInterval:0.2 repeats:YES block:^(NSTimer * _Nonnull timer) {
        if (_birdHeight >= 20 && _birdHeight <= 450) {
            self.declineRate += 3;
            self.birdHeight += self.declineRate;
            self.bird.image = [UIImage imageNamed:@"birdstop"];
            self.bird.frame = CGRectMake(50, _birdHeight, 45, 30);
            self.birdMove = YES;
            
            NSLog(@"birdHeight定时器 = %f", self.birdHeight);
        }else {
            self.bird.image = [UIImage imageNamed:@"birda1"];
            self.birdMove = NO;
            NSLog(@"Game Over!");
        }
    }];
}

- (void)backView1MoveAction {
    self.backViewTimer = [NSTimer scheduledTimerWithTimeInterval:0.001 repeats:YES block:^(NSTimer * _Nonnull timer) {
        
        self.backViewMoveDistance -= 1;
        self.backView1.frame = CGRectMake(_backViewMoveDistance, 0, 80 *  19, 500);
        
        NSNotification *notification = [NSNotification notificationWithName:@"11" object:nil userInfo:@{@"backViewX" :[NSString stringWithFormat: @"%f",_backViewMoveDistance], @"birdHeight" : [NSString stringWithFormat:@"%f",_birdHeight]}];
        
        [[NSNotificationCenter defaultCenter] postNotification:notification];
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (_birdMove) {
        self.declineRate = 0;
        [self.myTimer invalidate];
        self.myTimer = nil;
        
        self.bird.image = [UIImage imageNamed:@"birdfly"];
        self.birdHeight -= self.goUpRate;
        self.bird.frame = CGRectMake(50, _birdHeight, 45, 30);
    }
}
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (_birdMove) {
        [self birdDeclineAction];
    }
}

- (void)controlMove:(NSNotification *)notification {
    
    NSString *backViewX = notification.userInfo[@"backViewX"];
    NSString *birdHeight = notification.userInfo[@"birdHeight"];
    float x = [backViewX doubleValue];
    float h = [birdHeight doubleValue];
    
    if (x >= 50 + 40) {
        
    }else if (x < 95 || x >= -30) {
        if (h >= 150 && h <= 300 - 30) {
            NSLog(@"游戏结束");
        }else {
            _birdMove = NO;
            
            [self.myTimer invalidate];
            self.myTimer = nil;
            
            [self.backViewTimer invalidate];
            self.backViewTimer = nil;
            
            [NSTimer scheduledTimerWithTimeInterval:0.09 repeats:YES block:^(NSTimer * _Nonnull timer) {
                
                if (_birdHeight >= 450) {
                    
                }else {
                    self.declineRate += 1;
                    self.birdHeight += self.declineRate;
                    self.bird.image = [UIImage imageNamed:@"birdstop"];
                    self.bird.frame = CGRectMake(50, _birdHeight, 45, 30);
                    self.birdMove = YES;
                }
            }];
        }
    }else if (x < 95 - 80 * 2 || x >= -30 - 80 * 2) {
        if (h >= 150 && h <= 270 - 30) {
            NSLog(@"游戏结束");
        }else {
            _birdMove = NO;
            
            [self.myTimer invalidate];
            self.myTimer = nil;
            
            [self.backViewTimer invalidate];
            self.backViewTimer = nil;
            
            [NSTimer scheduledTimerWithTimeInterval:0.09 repeats:YES block:^(NSTimer * _Nonnull timer) {
                
                if (_birdHeight >= 450) {
                    
                }else {
                    self.declineRate += 1;
                    self.birdHeight += self.declineRate;
                    self.bird.image = [UIImage imageNamed:@"birdstop"];
                    self.bird.frame = CGRectMake(50, _birdHeight, 45, 30);
                    self.birdMove = YES;
                }
            }];
        }
    }else if (x < 95 - 80 * 4 || x >= -30 - 80 * 4) {
        if (h >= 170 && h <= 290 - 30) {
            NSLog(@"游戏结束");
        }else {
            _birdMove = NO;
            
            [self.myTimer invalidate];
            self.myTimer = nil;
            
            [self.backViewTimer invalidate];
            self.backViewTimer = nil;
            
            [NSTimer scheduledTimerWithTimeInterval:0.09 repeats:YES block:^(NSTimer * _Nonnull timer) {
                
                if (_birdHeight >= 450) {
                    
                }else {
                    self.declineRate += 1;
                    self.birdHeight += self.declineRate;
                    self.bird.image = [UIImage imageNamed:@"birdstop"];
                    self.bird.frame = CGRectMake(50, _birdHeight, 45, 30);
                    self.birdMove = YES;
                }
            }];
        }
    }else if (x < 95 - 80 * 6 || x >= -30 - 80 * 6) {
        if (h >= 180 && h <= 270 - 30) {
            NSLog(@"游戏结束");
        }else {
            _birdMove = NO;
            
            [self.myTimer invalidate];
            self.myTimer = nil;
            
            [self.backViewTimer invalidate];
            self.backViewTimer = nil;
            
            [NSTimer scheduledTimerWithTimeInterval:0.09 repeats:YES block:^(NSTimer * _Nonnull timer) {
                
                if (_birdHeight >= 450) {
                    
                }else {
                    self.declineRate += 1;
                    self.birdHeight += self.declineRate;
                    self.bird.image = [UIImage imageNamed:@"birdstop"];
                    self.bird.frame = CGRectMake(50, _birdHeight, 45, 30);
                    self.birdMove = YES;
                }
            }];
        }
    }else if (x < 95 - 80 * 8 || x >= -30 - 80 * 8) {
        if (h >= 200 && h <= 300 - 30) {
            NSLog(@"游戏结束");
        }else {
            _birdMove = NO;
            
            [self.myTimer invalidate];
            self.myTimer = nil;
            
            [self.backViewTimer invalidate];
            self.backViewTimer = nil;
            
            [NSTimer scheduledTimerWithTimeInterval:0.09 repeats:YES block:^(NSTimer * _Nonnull timer) {
                
                if (_birdHeight >= 450) {
                    
                }else {
                    self.declineRate += 1;
                    self.birdHeight += self.declineRate;
                    self.bird.image = [UIImage imageNamed:@"birdstop"];
                    self.bird.frame = CGRectMake(50, _birdHeight, 45, 30);
                    self.birdMove = YES;
                }
            }];
        }
    }else if (x < 95 - 80 * 10 || x >= -30 - 80 * 10) {
        if (h >= 180 && h <= 250 - 30) {
            NSLog(@"游戏结束");
        }else {
            _birdMove = NO;
            
            [self.myTimer invalidate];
            self.myTimer = nil;
            
            [self.backViewTimer invalidate];
            self.backViewTimer = nil;
            
            [NSTimer scheduledTimerWithTimeInterval:0.09 repeats:YES block:^(NSTimer * _Nonnull timer) {
                
                if (_birdHeight >= 450) {
                    
                }else {
                    self.declineRate += 1;
                    self.birdHeight += self.declineRate;
                    self.bird.image = [UIImage imageNamed:@"birdstop"];
                    self.bird.frame = CGRectMake(50, _birdHeight, 45, 30);
                    self.birdMove = YES;
                }
            }];
        }
    }else if (x < 95 - 80 * 12 || x >= -30 - 80 * 12) {
        if (h >= 180 && h <= 300 - 30) {
            NSLog(@"游戏结束");
        }else {
            _birdMove = NO;
            
            [self.myTimer invalidate];
            self.myTimer = nil;
            
            [self.backViewTimer invalidate];
            self.backViewTimer = nil;
            
            [NSTimer scheduledTimerWithTimeInterval:0.09 repeats:YES block:^(NSTimer * _Nonnull timer) {
                
                if (_birdHeight >= 450) {
                    
                }else {
                    self.declineRate += 1;
                    self.birdHeight += self.declineRate;
                    self.bird.image = [UIImage imageNamed:@"birdstop"];
                    self.bird.frame = CGRectMake(50, _birdHeight, 45, 30);
                    self.birdMove = YES;
                }
            }];
        }
    }else if (x < 95 - 80 * 14 || x >= -30 - 80 * 14) {
        if (h >= 180 && h <= 270 - 30) {
            NSLog(@"游戏结束");
        }else {
            _birdMove = NO;
            
            [self.myTimer invalidate];
            self.myTimer = nil;
            
            [self.backViewTimer invalidate];
            self.backViewTimer = nil;
            
            [NSTimer scheduledTimerWithTimeInterval:0.09 repeats:YES block:^(NSTimer * _Nonnull timer) {
                
                if (_birdHeight >= 450) {
                    
                }else {
                    self.declineRate += 1;
                    self.birdHeight += self.declineRate;
                    self.bird.image = [UIImage imageNamed:@"birdstop"];
                    self.bird.frame = CGRectMake(50, _birdHeight, 45, 30);
                    self.birdMove = YES;
                }
            }];
        }
    }else if (x < 95 - 80 * 16 || x >= -30 - 80 * 16) {
        if (h >= 150 && h <= 250 - 30) {
            NSLog(@"游戏结束");
        }else {
            _birdMove = NO;
            
            [self.myTimer invalidate];
            self.myTimer = nil;
            
            [self.backViewTimer invalidate];
            self.backViewTimer = nil;
            
            [NSTimer scheduledTimerWithTimeInterval:0.09 repeats:YES block:^(NSTimer * _Nonnull timer) {
                
                if (_birdHeight >= 450) {
                    
                }else {
                    self.declineRate += 1;
                    self.birdHeight += self.declineRate;
                    self.bird.image = [UIImage imageNamed:@"birdstop"];
                    self.bird.frame = CGRectMake(50, _birdHeight, 45, 30);
                    self.birdMove = YES;
                }
            }];
        }
    }else if (x < 95 - 80 * 18 || x >= -30 - 80 * 18) {
        if (h >= 200 && h <= 250 - 30) {
            NSLog(@"游戏结束");
        }else {
            _birdMove = NO;
            
            [self.myTimer invalidate];
            self.myTimer = nil;
            
            [self.backViewTimer invalidate];
            self.backViewTimer = nil;
            
            [NSTimer scheduledTimerWithTimeInterval:0.09 repeats:YES block:^(NSTimer * _Nonnull timer) {
                
                if (_birdHeight >= 450) {
                    
                }else {
                    self.declineRate += 1;
                    self.birdHeight += self.declineRate;
                    self.bird.image = [UIImage imageNamed:@"birdstop"];
                    self.bird.frame = CGRectMake(50, _birdHeight, 45, 30);
                    self.birdMove = YES;
                }
            }];
        }
    }
    NSLog(@"背景的位置 = %f, 小鸟的高度 = %f", x, h);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
