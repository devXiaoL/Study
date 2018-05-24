         //
//  ViewController.m
//  Study
//
//  Created by lanbao on 2018/2/1.
//  Copyright © 2018年 lanbao. All rights reserved.
//

#import "ViewController.h"
#import <FMDB.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
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


@end
