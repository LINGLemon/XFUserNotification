//
//  ViewController.m
//  XFUserNotification
//
//  Created by lingxuanfeng on 16/10/2017.
//  Copyright © 2017 lingxuanfeng. All rights reserved.
//

#import "ViewController.h"
#import "XFUserNotificationCenter.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)setRepresentedObject:(id)representedObject
{
    [super setRepresentedObject:representedObject];
}

- (IBAction)notificationBtnFunc:(id)sender
{
    static int i = 1;
    NSString *strTip = [NSString stringWithFormat:@"%d", i];
    [[XFUserNotificationCenter sharedUserNotificationCenter] showUserNotificationWithTitle:@"test" withSubTitle:@"test1" withInformativeText:strTip withContentImage:[NSImage imageNamed:@"default_user"]];
    i++;
}

- (IBAction)dockNumBtnFunc:(id)sender
{
    static int i = 1;
    NSString *strTip = [NSString stringWithFormat:@"%d", i];
    [[XFUserNotificationCenter sharedUserNotificationCenter] showNotificaitonInDockWithNumberText:strTip];
    i++;
}


@end
