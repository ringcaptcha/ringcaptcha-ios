//
//  ViewController.m
//  ExampleRingcaptcha
//
//  Created by Bruno Alassia on 2/27/15.
//  Copyright (c) 2015 Thrivecom. All rights reserved.
//

#import "ViewController.h"
#import <Ringcaptcha/Ringcaptcha.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}

- (IBAction)verifyOnboard:(id)sender {
    
    [Ringcaptcha verifyOnboardWithAppKey:@"xxxxxxxxxxxx"
                            andSecretKey:@"xxxxxxxxxxxx"
                        inViewController:self
                                delegate: nil
                                 success:^(RingcaptchaVerification *verification) {
                                     NSLog(@"Verification process ended successfully? %@", verification.verificationId);
                                     NSLog(@"Verification process ended successfully? %d", verification.verificationSuccessful);
                                     NSLog(@"Verification process ended successfully? %@", verification.phoneNumber);
                                     NSLog(@"Verification process ended successfully? %@", verification.errorDescription);
                                 } cancel:^(RingcaptchaVerification *verification) {
                                     NSLog(@"Verification process cancelled? %d", verification.verificationSuccessful);
                                 }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
