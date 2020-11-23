//
//  MXSViewController.m
//  MXSFoundation
//
//  Created by Anonymous-Monk on 08/20/2019.
//  Copyright (c) 2019 Anonymous-Monk. All rights reserved.
//

#import "MXSViewController.h"
#import <MXSFoundation/RHFoundation.h>

@interface MXSViewController ()

@end

@implementation MXSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *str = @"120w087!";
    //    if ([self rh_regularWithRule:@"^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[\\W_!@#$%^&*`~()-+=]).{8,24}$" withStr:str]) {
    if ([str rh_checkForcePassword:8 longest:24]) {
        NSLog(@"通过校验");
    }else{
        NSLog(@"未通过校验");
    }
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (BOOL)rh_regularWithRule:(NSString *)rule withStr:(NSString *)str {
    
    NSPredicate *stringPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", rule];
    
    return [stringPredicate evaluateWithObject:str];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
