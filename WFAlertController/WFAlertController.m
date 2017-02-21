//
//  WFAlertController.m
//  WFAlertControllerDemo
//
//  Created by 江文帆 on 16/7/22.
//  Copyright © 2016年 jiangwenfan. All rights reserved.
//

#import "WFAlertController.h"

@implementation WFAlertController

+ (void)alertViewWithTitle:(NSString *)title message:(NSString *)message
{
    [self alertWithTitle:title message:message destructiveTitle:nil destructiveAction:nil cancelTitle:NSLocalizedString(@"确定", nil) cancelAction:^(UIAlertAction *action) {
        
    } otherTitles:nil handler:nil];
}

+ (void)alertViewWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSArray *)otherButtons onDismiss:(WFAlertOtherActionsHandler)dismissed onCancel:(WFAlertActionHandler)cancelled
{
    [self alertWithTitle:title message:message destructiveTitle:nil destructiveAction:nil cancelTitle:cancelButtonTitle cancelAction:^(UIAlertAction *action) {
        if (cancelled) {
            cancelled(action);
        }
    } otherTitles:otherButtons handler:^(NSInteger index) {
        if (dismissed) {
            dismissed(index);
        }
    }];
}

+ (void)alertWithTitle:(NSString *)title message:(NSString *)message destructiveTitle:(NSString *)desTitle destructiveAction:(WFAlertActionHandler)desAction cancelTitle:(NSString *)cancelTitle cancelAction:(WFAlertActionHandler)cancelAction otherTitles:(NSArray *)otherTitles handler:(WFAlertOtherActionsHandler)handler
{
    [self alertWithStyle:UIAlertControllerStyleAlert target:[UIApplication sharedApplication].keyWindow.rootViewController title:title message:message destructiveTitle:desTitle destructiveAction:desAction cancelTitle:cancelTitle cancelAction:cancelAction otherTitles:otherTitles handler:handler];
}

+ (void)alertWithStyle:(UIAlertControllerStyle)style target:(UIViewController *)target title:(NSString *)title message:(NSString *)message destructiveTitle:(NSString *)desTitle destructiveAction:(WFAlertActionHandler)desAction cancelTitle:(NSString *)cancelTitle cancelAction:(WFAlertActionHandler)cancelAction otherTitles:(NSArray *)otherTitles handler:(WFAlertOtherActionsHandler)handler
{
    UIAlertController *actionSheet = [self _controllerWithStyle:style title:title message:message];
    [self _showWithController:actionSheet target:target destructiveTitle:desTitle destructiveAction:desAction cancelTitle:cancelTitle cancelAction:cancelAction otherTitles:otherTitles handler:handler];
}

+ (void)_showWithController:(UIAlertController *)controller target:(UIViewController *)target destructiveTitle:(NSString *)desTitle destructiveAction:(WFAlertActionHandler)desAction cancelTitle:(NSString *)cancelTitle cancelAction:(WFAlertActionHandler)cancelAction otherTitles:(NSArray *)otherTitles handler:(WFAlertOtherActionsHandler)handler
{
    if (desTitle) {
        [controller addAction:[UIAlertAction actionWithTitle:desTitle style:UIAlertActionStyleDestructive handler:desAction]];
    }
    if (cancelTitle) {
        [controller addAction:[UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:cancelAction]];
    }
    
    [otherTitles enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [controller addAction:[UIAlertAction actionWithTitle:obj style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (handler) {
                handler(idx);
            }
        }]];
    }];
    [target wf_safePresentViewController:controller animated:YES completion:nil];
}

+ (UIAlertController *)_controllerWithStyle:(UIAlertControllerStyle)style title:(NSString *)title message:(NSString *)message
{
    UIAlertController *alertView = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:style];
    return alertView;
}
@end



@implementation UIViewController (WFAlertController)

- (void)wf_safePresentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion
{
    UIViewController *presentedController = [[UIApplication sharedApplication].keyWindow.rootViewController wf_lastPresentedViewController];
    if (presentedController) {
        [presentedController presentViewController:viewControllerToPresent animated:YES completion:completion];
    }else {
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:viewControllerToPresent animated:YES completion:completion];
    }
}

- (UIViewController *)wf_lastPresentedViewController
{
    UIViewController *presentedViewController = self.presentedViewController;
    if (presentedViewController) {
        if (presentedViewController.presentedViewController) {
            return [presentedViewController wf_lastPresentedViewController];
        }else {
            return presentedViewController;
        }
    }else {
        return self;
    }
}
@end
