//
//  calculatorViewController.m
//  SHFcalculator2
//
//  Created by hyperactive on 19/03/2020.
//  Copyright © 2020 hyperActive. All rights reserved.
//

#import "calculatorViewController.h"

@interface calculatorViewController ()
@property (weak, nonatomic) IBOutlet UILabel *digitsDisplayLabel;
@property (weak, nonatomic) IBOutlet UILabel *equationDisplayLabel;

@end

@implementation calculatorViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _previosOperation = NUMBRES;
    _digitsDisplay = @"0";
    _equationDisplay = @"";
    _decimalPeriodInEffect = NO;
    _numberOfUnclosedOpenParenthesis = 0;
    
}

-(IBAction)numbers:(id)sender
{
    UIButton *keyP = (UIButton*)sender;
    if (_previosOperation == NUMBRES || _previosOperation == PERIOD)
    {
        if ([_digitsDisplay isEqualToString:@"0"])
            _digitsDisplay = @"";
        _digitsDisplay = [_digitsDisplay stringByAppendingString:keyP.currentTitle];
    } else {
        _digitsDisplay = keyP.currentTitle;
    }
    self.digitsDisplayLabel.text = _digitsDisplay;
    _previosOperation = NUMBRES;
}
-(IBAction)operators:(id)sender
{
    UIButton *operatorButton = (UIButton*)sender;
    NSString *operator = operatorButton.currentTitle;
    if (_previosOperation == NUMBRES) {
        _equationDisplay = [_equationDisplay stringByAppendingString:_digitsDisplay];
        _equationDisplay = [_equationDisplay stringByAppendingString:operator];
    } else if (_previosOperation == OPERATORS) {
        _equationDisplay = [_equationDisplay substringToIndex:[_equationDisplay length]-1];
        _equationDisplay = [_equationDisplay stringByAppendingString:operator];
    }
    self.equationDisplayLabel.text = _equationDisplay;
    _decimalPeriodInEffect = NO;
    _previosOperation = OPERATORS;
}
-(IBAction)parentheses:(id)sender
{
    //will be added later
    _decimalPeriodInEffect = NO;
    _previosOperation = PARENTHESES;
}
-(IBAction)clear:(id)sender
{
    _digitsDisplay = @"0";
    if (_previosOperation == CLEAR) {
        _equationDisplay=@"";
        self.equationDisplayLabel.text = _equationDisplay;
    }
    
    self.digitsDisplayLabel.text = _digitsDisplay;
    _previosOperation = CLEAR;
}
-(IBAction)peiod:(id)sender
{
    if (_decimalPeriodInEffect == NO && _previosOperation == NUMBRES)
    {
        _digitsDisplay = [_digitsDisplay stringByAppendingString:@"."];
        _decimalPeriodInEffect = YES;
    }
    self.digitsDisplayLabel.text = _digitsDisplay;
    _previosOperation = PERIOD;
}
-(IBAction)solve:(id)sender
{
    
    _previosOperation = SOLVE;
}

@end
