//
//  XFUserNotificationCenter.h
//  XFUserNotification
//
//  Created by lingxuanfeng on 16/10/2017.
//  Copyright © 2017 lingxuanfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol XFUserNotificationDelegate <NSObject>

@optional

/**
 *  点击通知启动APP的时候要执行的方法
 */
- (void)userNotificationCenter:(NSUserNotificationCenter *)center didDeliverNotification:(NSUserNotification *)notification;

/**
 *  当通知发送日期到达时，发送给委托。此时，通知要么已经提交给用户，要么通知中心决定不提交，因为您的应用程序已经是最前面的了。(一般不使用？)
 */
- (void)userNotificationCenter:(NSUserNotificationCenter *)center didActivateNotification:(NSUserNotification *)notification;

@end

@interface XFUserNotificationCenter : NSObject

@property (nonatomic, weak) id<XFUserNotificationDelegate> delegate;

+ (XFUserNotificationCenter *)sharedUserNotificationCenter;

/**
 *  显示通知
 */
- (void)showUserNotificationTitle:(NSString *)title withSubTitle:(NSString *)subTitle withInformativeText:(NSString *)informativeText withContentImage:(NSImage *)contentImage;

/**
 *  设置dock的红点数
 */
- (void)showNotificaitonInDockWithNumberText:(NSString *)numberText;

@end
