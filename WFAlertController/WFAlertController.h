//
//  WFAlertController.h
//  WFAlertControllerDemo
//
//  Created by 江文帆 on 16/7/22.
//  Copyright © 2016年 jiangwenfan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^WFAlertActionHandler)(UIAlertAction *action);
typedef void(^WFAlertOtherActionsHandler)(NSInteger index);


@interface WFAlertController : NSObject
+ (void)alertViewWithTitle:(NSString *)title message:(NSString *)message;

+ (void)alertViewWithTitle:(NSString *)title message:(NSString *) message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSArray *) otherButtons onDismiss:(WFAlertOtherActionsHandler) dismissed onCancel:(dispatch_block_t) cancelled;

+ (void)alertWithTitle:(NSString *)title message:(NSString *)message destructiveTitle:(NSString *)desTitle destructiveAction:(WFAlertActionHandler)desAction cancelTitle:(NSString *)cancelTitle cancelAction:(WFAlertActionHandler)cancelAction otherTitles:(NSArray *)otherTitles handler:(WFAlertOtherActionsHandler)handler;

+ (void)alertWithStyle:(UIAlertControllerStyle)style target:(UIViewController *)target title:(NSString *)title message:(NSString *)message destructiveTitle:(NSString *)desTitle destructiveAction:(WFAlertActionHandler)desAction cancelTitle:(NSString *)cancelTitle cancelAction:(WFAlertActionHandler)cancelAction otherTitles:(NSArray *)otherTitles handler:(WFAlertOtherActionsHandler)handler;
@end


@interface UIViewController (WFAlertController)
- (void)wf_safePresentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion;
@end
