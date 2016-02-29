//
//  TouchID.m
//  PwC_Deliverable2_App
//
//  Created by Vernon Martin on 2/29/16.
//  Copyright © 2016 VernonMartin. All rights reserved.
//

#import "TouchID.h"

@implementation TouchID
-(void) loadTouchID{
    LAContext *myContext = [[LAContext alloc]init];
    NSError *authError = nil;
    NSString *reasonForAuthentication = @"Touch ID for security reasons";
    
    if ([myContext canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&authError]) {
        [myContext evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:reasonForAuthentication reply:^(BOOL success, NSError * _Nullable error) {
            if (success) {
                dispatch_async(dispatch_get_main_queue(), ^{
                     [[self performSelector:@selector(Success) withObject:nil];
                });
            }else{
                dispatch_async(dispatch_async(dispatch_get_main_queue(), ^{
                    UIAlertView *alertView = [[UIAlertView alloc]init]
                }
            }
        }]
    }
}
@end
