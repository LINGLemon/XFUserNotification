//
//  XFUserNotificationCenter.m
//  XFUserNotification
//
//  Created by lingxuanfeng on 16/10/2017.
//  Copyright © 2017 lingxuanfeng. All rights reserved.
//

#import "XFUserNotificationCenter.h"
#import <AppKit/AppKit.h>

static XFUserNotificationCenter *_instance = nil;

@interface XFUserNotificationCenter () <NSUserNotificationCenterDelegate>

@end

@implementation XFUserNotificationCenter

+ (XFUserNotificationCenter *)sharedUserNotificationCenter
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[XFUserNotificationCenter alloc] init];
    });
    return _instance;
}

- (void)showUserNotificationWithTitle:(NSString *)title withSubTitle:(NSString *)subTitle withInformativeText:(NSString *)informativeText withContentImage:(NSImage *)contentImage
{
    NSUserNotification *notification = [[NSUserNotification alloc] init];
    [notification setTitle:title];
    [notification setSubtitle:subTitle];
    [notification setInformativeText:informativeText];
    [notification setContentImage:contentImage];
    
    NSUserNotificationCenter *userNotificationCenter = [NSUserNotificationCenter defaultUserNotificationCenter];
    userNotificationCenter.delegate = self;
    [userNotificationCenter scheduleNotification:notification];
}

- (void)showNotificaitonInDockWithNumberText:(NSString *)numberText
{
    [[[NSApplication sharedApplication] dockTile] setBadgeLabel:numberText];
}

#pragma mark - XFUserNotificationDelegate

- (BOOL)userNotificationCenter:(NSUserNotificationCenter *)center shouldPresentNotification:(NSUserNotification *)notification
{
    return YES;
}

- (void)userNotificationCenter:(NSUserNotificationCenter *)center didActivateNotification:(NSUserNotification *)notification
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(userNotificationCenter:didActivateNotification:)] == YES)
    {
        [self.delegate userNotificationCenter:center didActivateNotification:notification];
    }
}

- (void)userNotificationCenter:(NSUserNotificationCenter *)center didDeliverNotification:(NSUserNotification *)notification
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(userNotificationCenter:didDeliverNotification:)] == YES)
    {
        [self.delegate userNotificationCenter:center didDeliverNotification:notification];
    }
}

@end
