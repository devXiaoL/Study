         //
//  ViewController.m
//  Study
//
//  Created by lanbao on 2018/2/1.
//  Copyright © 2018年 lanbao. All rights reserved.
//

#import "ViewController.h"
#import <FMDB.h>
#import "WaveView.h"

@interface ViewController ()

@property (nonatomic, strong) WaveView *waveView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.waveView];
    
     [self.waveView openTimer];
    
    CGFloat rate = rate = 12;
    // 预计应收金额 （（出借金额+当前预计收益）*(1-折让率) 的计算值 ）
    //    CGFloat acctAeceivableAmt = self.requestModule.responseModule.curAmtInterest.floatValue * (1 - rate/100);
    
    CGFloat acctAeceivableAmt = 30320.6344;
    //保留两位小数，小数位四舍五入
    NSDecimalNumber * number = [[NSDecimalNumber alloc]initWithString:[NSString stringWithFormat:@"%f",acctAeceivableAmt]];
    NSDecimalNumberHandler *roundingBehavior = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundPlain scale:2 raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO];
    float amt = [number decimalNumberByRoundingAccordingToBehavior:roundingBehavior].floatValue;
    
    CGFloat acctAeceivableAmt1 = 30320.6354;
    //保留两位小数，小数位四舍五入
    NSDecimalNumber * number1 = [[NSDecimalNumber alloc]initWithString:[NSString stringWithFormat:@"%f",acctAeceivableAmt1]];
    NSDecimalNumberHandler *roundingBehavior1 = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundPlain scale:2 raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:NO];
    float amt1 = [number1 decimalNumberByRoundingAccordingToBehavior:roundingBehavior1].floatValue;
    
    NSLog(@"%.2f",acctAeceivableAmt);
    NSNumber *priceNum = [NSNumber numberWithFloat:30320.6344];
    NSLog(@"----%@---",[NSString stringWithFormat:@"%.2f",round([priceNum floatValue]*100)/100]);
    
    NSString *numStr = [self decimalwithFormat:@"0.00" floatV:30320.6344];
    NSLog(@"numStr =  %@",numStr);
    NSString *numStr1 = [self decimalwithFormat:@"0.00" floatV:30320.6354];
    NSLog(@"numStr1 =  %@",numStr1);
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setInteger:0 forKey:@"childCount"];
    [userDefaults synchronize];
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"poetry_story" ofType:@"sql"];
    NSError *error;
    NSString *sql = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
    
    //1.获得数据库文件的路径
    NSString *doc =[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES)  lastObject];
    
    NSString *fileName = [doc stringByAppendingPathComponent:@"poetry_story.sqlite"];
    
    NSLog(@"file path = %@",fileName);
    
    //2.获得数据库
    FMDatabase *db = [FMDatabase databaseWithPath:fileName];
    
    //3.使用如下语句，如果打开失败，可能是权限不足或者资源不足。通常打开完操作操作后，需要调用 close 方法来关闭数据库。在和数据库交互 之前，数据库必须是打开的。如果资源或权限不足无法打开或创建数据库，都会导致打开失败。
    if ([db open])
    {
        //4.创表
        BOOL result = [db executeUpdate:sql];
        if (result)
        {
            NSLog(@"创建表成功");
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSString *) decimalwithFormat:(NSString *)format  floatV:(float)floatV
{
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    
    [numberFormatter setPositiveFormat:format];
    
    return  [numberFormatter stringFromNumber:[NSNumber numberWithFloat:floatV]];
}


- (WaveView *)waveView{
    if (!_waveView) {
        _waveView = [[WaveView alloc]initWithFrame:CGRectMake(0, 100, 375, 100)];
        _waveView.present = 0.3;
        _waveView.presentlabel.hidden = YES;
    }
    return _waveView;
}


@end
