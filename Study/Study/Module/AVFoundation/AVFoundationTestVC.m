//
//  AVFoundationTestVC.m
//  StudyDemo
//
//  Created by lanbao on 2018/1/30.
//  Copyright © 2018年 Lang. All rights reserved.
//

#import "AVFoundationTestVC.h"
#import <AVFoundation/AVFoundation.h>

#define volumeChangeKey @"AVSystemController_SystemVolumeDidChangeNotification"
#define volumeValueKey @"AVSystemController_AudioVolumeNotificationParameter"

@interface AVFoundationTestVC ()

@property (nonatomic, strong)UILabel *volumeLabel;

@end

@implementation AVFoundationTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    UILabel *volumeLabel = [[UILabel alloc]init];
    [self.view addSubview:volumeLabel];
    [volumeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(80);
        make.centerX.equalTo(self.view);
    }];
    self.volumeLabel = volumeLabel;
    //读取系统音量
    [self readSystemVolume];
    
    //监听系统音量变化
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(systemVolumeChanged:) name:volumeChangeKey object:nil];
    [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
}

- (void)dealloc{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:volumeChangeKey object:nil];
}

- (void)systemVolumeChanged:(NSNotification *)notification{
//    if ([notification.name isEqualToString:volumeChangeKey]) {
        //2.获取到当前音量
        float volume = [[[notification userInfo] valueForKey:volumeValueKey ] floatValue];
        self.volumeLabel.text = [NSString stringWithFormat:@"系统音量：%.2f",volume];
//    }
    
}

/**
    读取系统音量
 */
- (void)readSystemVolume{
    AVAudioSession *audio = [AVAudioSession sharedInstance];
    CGFloat volume = audio.outputVolume;
    
    self.volumeLabel.text = [NSString stringWithFormat:@"系统音量：%.2f",volume];
    
}


@end
