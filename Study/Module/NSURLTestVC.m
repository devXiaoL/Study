//
//  NSURLTestVC.m
//  Study
//
//  Created by lanbao on 2018/4/27.
//  Copyright © 2018年 lanbao. All rights reserved.
//

#import "NSURLTestVC.h"

@interface NSURLTestVC ()

@end

@implementation NSURLTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSInteger count = [userDefaults integerForKey:@"childCount"];
    
    self.navigationItem.title = [NSString stringWithFormat:@"第%zd个页面",count];
    
    NSString *urlStr = @"http://service.store.dandanjiang.tv/v1/wallpaper/category?height=2208&sys_language=zh-Hans-CN&width=1242";
    NSURLComponents *components = [NSURLComponents componentsWithString:urlStr];
    NSLog(@"scheme = %@",components.scheme);
    NSLog(@"host   = %@",components.host);
    NSLog(@"path   = %@",components.path);
    NSLog(@"query = %@",components.query);
    NSLog(@"queryItems = %@",components.queryItems);
    
    NSURL *url1 = [NSURL URLWithString:urlStr relativeToURL:[NSURL URLWithString:@"http://service.store.dandanjiang.tv"]];
    NSLog(@"URLWithString:(NSString *)URLString relativeToURL:(nullable NSURL *)baseURL---url = %@",url1);
    /*
    //如果path前面或者baseURL有多余的'/',系统会自动去除多余的
    [[NSURL URLWithString:@"/v1/wallpaper/category" relativeToURL:[NSURL URLWithString:@"http://service.store.dandanjiang.tv"]] absoluteURL];
    //输出
    @"http://service.store.dandanjiang.tv/v1/wallpaper/category";
     
    [[NSURL URLWithString:@"/v1/wallpaper/category" relativeToURL:[NSURL URLWithString:@"http://service.store.dandanjiang.tv/"]] absoluteURL];
    //输出
    @"http://service.store.dandanjiang.tv/v1/wallpaper/category";
     */
    NSString *path = [[NSBundle mainBundle]pathForResource:@"ci" ofType:@"db"];
    NSURL *pathURL = [NSURL fileURLWithPath:path];
    NSLog(@"pathURL = %@",pathURL);
    
    UIButton *button = [[UIButton alloc]init];
    button.backgroundColor = kMainColor;
    [button setTitle:@"返回首页" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(backHomeAction:) forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(50, 100, 100, 100);
    [self.view addSubview:button];
    [button addTarget:self action:@selector(doubleTapButtonAction:) forControlEvents:UIControlEventTouchDownRepeat];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSInteger count = [userDefaults integerForKey:@"childCount"];
    [userDefaults setInteger:count+1 forKey:@"childCount"];
    [userDefaults synchronize];
    
    NSURLTestVC *vc = [NSURLTestVC new];
    
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)doubleTapButtonAction:(UIButton *)button {
    
}

- (void)backHomeAction:(UIButton *)button {
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setInteger:0 forKey:@"childCount"];
    [userDefaults synchronize];
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)dealloc {
    NSLog(@"%s---%@",__func__,self.navigationItem.title);
}

@end
