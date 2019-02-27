//
//  XLFMDBVC.m
//  Study
//
//  Created by lanbao on 2018/4/12.
//  Copyright © 2018年 lanbao. All rights reserved.
//

#import "XLFMDBVC.h"
#import <FMDB.h>

@interface XLFMDBVC ()

@end

@implementation XLFMDBVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"ci" ofType:@"db"];
    FMDatabase *dataBase = [FMDatabase databaseWithPath:path];
    [dataBase open];
    FMResultSet *resultSet = [dataBase executeQuery:@"select * from ci"];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
