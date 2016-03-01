//
//  AuthenticationVC.m
//  PwC_Deliverable2_App
//
//  Created by Vernon Martin on 2/29/16.
//  Copyright © 2016 VernonMartin. All rights reserved.
//

#import "AuthenticationVC.h"
#import <LocalAuthentication/LocalAuthentication.h>

@implementation AuthenticationVC
-(void)viewWillAppear:(BOOL)animated{
    LAContext *myContext = [[LAContext alloc] init];
    NSError *authError = nil;
    NSString *myLocalizedReasonString = @"Touch ID Needed For Authentication with this Vacation Destination App";
    
    //Checking to see if biometrics are available or if the phone has that capability
    if ([myContext canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&authError]) {
        [myContext evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:myLocalizedReasonString reply:^(BOOL success, NSError *error) {
            //If fingerprint/authentication works go to the main screen
            if (success) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self performSegueWithIdentifier:@"Success" sender:nil];
                });
            //If fingerprint/authentication doesnt work show an error with a description of the problem
            } else {
                dispatch_async(dispatch_get_main_queue(), ^{
                    UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"Error" message:error.description preferredStyle:UIAlertControllerStyleAlert];
                    
                    UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {}];
                    
                    [alertView addAction:defaultAction];
                    [self presentViewController:alertView animated:YES completion:nil];
                });
            }
        }];
    //If TouchID is not available this code runs
    } else {
        dispatch_async(dispatch_get_main_queue(), ^{
            UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"Error" message:authError.description preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {}];
            
            [alertView addAction:defaultAction];
            [self presentViewController:alertView animated:YES completion:nil];
        });
    }
}
@end
