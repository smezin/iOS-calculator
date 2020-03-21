//
//  calculatorViewController.m
//  SHFcalculator2
//
//  Created by hyperactive on 19/03/2020.
//  Copyright © 2020 hyperActive. All rights reserved.
//

#import "calculatorViewController.h"
//#import "equationBuilder.h"


@interface calculatorViewController ()

@end

@implementation calculatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(IBAction)numbers:(id)sender
{
    
    previosOperation = NUMBRES;
}
-(IBAction)operators:(id)sender
{
    
    previosOperation = OPERATORS;
}
-(IBAction)parentheses:(id)sender
{
    
    previosOperation = PARENTHESES;
}
-(IBAction)clear:(id)sender
{
    
    previosOperation = CLEAR;
}
-(IBAction)peiod:(id)sender
{
    
    previosOperation = PERIOD;
}
-(IBAction)solve:(id)sender
{
    
}

@end
