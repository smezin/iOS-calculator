//
//  AppDelegate.m
//  SHFcalculator2
//
//  Created by hyperactive on 19/03/2020.
//  Copyright © 2020 hyperActive. All rights reserved.
//

#import "AppDelegate.h"
#import "calculatorViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    CGRect winFrame = [[ UIScreen mainScreen] bounds];
    self.window = [[ UIWindow alloc] initWithFrame:winFrame];
    
    calculatorViewController *calcVC = [[calculatorViewController alloc]init];
    self.window.rootViewController = calcVC;
    
    self.window.backgroundColor = [UIColor redColor];
    [self.window makeKeyWindow];

    return YES;
}


@end
