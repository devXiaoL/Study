//
//  UISearchBarTestVC.m
//  Study
//
//  Created by lanbao on 2018/5/16.
//  Copyright © 2018年 lanbao. All rights reserved.
//

#import "UISearchBarTestVC.h"

#import "BarBaseView.h"
#import "XLSearchBar.h"

@interface UISearchBarTestVC ()<UISearchBarDelegate>

@property (nonatomic, strong) XLSearchBar *searchBar;

@end

@implementation UISearchBarTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect frame = CGRectMake(0, 0, 250, 30);
    
    XLSearchBar *searchBar = [[XLSearchBar alloc]initWithFrame:frame];
    searchBar.placeholder = @"搜索";
    searchBar.displayCenter = YES;
    self.searchBar = searchBar;
    searchBar.delegate = self;
    
    searchBar.tintColor = kMainColor;
    BarBaseView *baseView = [[BarBaseView alloc]initWithFrame:frame];
    [baseView addSubview:searchBar];
    self.navigationItem.titleView = baseView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    
    self.searchBar.displayCenter = NO;
    [searchBar setShowsCancelButton:YES animated:YES];
}

- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    [searchBar setShowsCancelButton:NO animated:YES];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
}


@end
