//
//  Target_NoTargetAction.m
//  LQGNoTargetAction_Category
//
//  Created by 罗建
//  Copyright (c) 2021 罗建. All rights reserved.
//

#import "Target_NoTargetAction.h"

#import <LQGMacro/LQGMacro.h>
@import LQGCategory;
@import LQGTip;
@import LQGNoTargetAction;

@implementation Target_NoTargetAction

- (void)Action_response:(NSDictionary *)params {
    LQG_DebugLog(@"获取路由失败，请检查路由配置:\n%@", params);
 
    dispatch_async(dispatch_get_main_queue(), ^{
        if (![params[@"selectorString"] hasPrefix:@"Action_func_"] &&
            [UIViewController currentController].navigationController) {
            LQGNoTargetActionController *vc = [[LQGNoTargetActionController alloc] init];
            vc.params = params;
            
            [[UIViewController currentController].navigationController pushViewController:vc animated:YES];
        } else {
            [LQGToastView showToastWithMessage:@"获取路由失败"];
        }
    });
}

@end
