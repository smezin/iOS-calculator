//
//  calculatorViewController.m
//  SHFcalculator2
//
//  Created by hyperactive on 19/03/2020.
//  Copyright © 2020 hyperActive. All rights reserved.
//

#import "calculatorViewController.h"
#import "Display.h"

@interface calculatorViewController ()
//
@property (weak, nonatomic) IBOutlet UIButton *key1;
@property (weak, nonatomic) IBOutlet UILabel *currentNumberDisplay;
@property (weak, nonatomic) IBOutlet UILabel *equationDisplay;

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
    NSString *accessLabel = pressedKey.accessibilityLabel;
    NSString *currentTitle = pressedKey.currentTitle;
    NSString *accessId = pressedKey.accessibilityIdentifier;
    NSLog(@"%@", accessLabel);
    NSLog(@"%@", currentTitle);
    NSLog(@"%@", accessId);
}

@end
