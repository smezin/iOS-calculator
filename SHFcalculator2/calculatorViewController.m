//
//  calculatorViewController.m
//  SHFcalculator2
//
//  Created by hyperactive on 19/03/2020.
//  Copyright © 2020 hyperActive. All rights reserved.
//

#import "calculatorViewController.h"

@interface calculatorViewController ()

@property (weak, nonatomic) IBOutlet UIButton *key1;

@end

@implementation calculatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    return self;
}

- (IBAction)keyStrike:(id)sender {
    UIButton *pressedKey = (UIButton *)sender;
    NSLog(@"%@", pressedKey.accessibilityLabel);
    NSLog(@"%@", pressedKey.currentTitle);
    NSLog(@"%@", pressedKey.accessibilityIdentifier);
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
