//
//  calculatorViewController.m
//  SHFcalculator2
//
//  Created by hyperactive on 19/03/2020.
//  Copyright © 2020 hyperActive. All rights reserved.
//

#import "calculatorViewController.h"
#import "equationBuilder.h"


@interface calculatorViewController ()

@property (weak, nonatomic) IBOutlet UIButton *key1;

@end

@implementation calculatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}


- (IBAction)keyStrike:(id)sender {
    UIButton *pressedKey = (UIButton *)sender;
    NSString *accessLabel = pressedKey.accessibilityLabel;
    NSString *currentTitle = pressedKey.currentTitle;
 
    if ([accessLabel isEqual:@"numberKey"])
        NSLog(@"number");
    else if ([accessLabel isEqual:@"operatorKey"])
        NSLog(@"operator");
    else if ([accessLabel isEqual:@"periodKey"])
        NSLog(@"period");
    else if ([accessLabel isEqual:@"parenthesesKey"])
        NSLog(@"parenthesesKey");
    else if([accessLabel isEqual:@"clearKey"])
        NSLog(@"clear");
    else if ([accessLabel isEqual:@"solveKey"])
        NSLog(@"solve");
}



@end
