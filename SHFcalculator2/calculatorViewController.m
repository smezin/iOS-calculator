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
    _previosOperation = SOLVE;
    _digitsDisplay = @"0";
   // _equationDisplay = @"";
    _equationArray = [NSMutableArray array];
    _decimalPeriodInEffect = NO;
    _numberOfUnclosedParenthesis = 0;
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
   //     _equationDisplay = [_equationDisplay stringByAppendingString:_digitsDisplay];
        [_equationArray addObject:_digitsDisplay]; ///////////////
   //     _equationDisplay = [_equationDisplay stringByAppendingString:operator];
        [_equationArray addObject:operator];  //////////////////
        _decimalPeriodInEffect = NO;
        _previosOperation = OPERATORS;
    } else if (_previosOperation == OPERATORS) {
     //   _equationDisplay = [_equationDisplay substringToIndex:[_equationDisplay length]-1];
        [_equationArray replaceObjectAtIndex:[_equationArray count]-1 withObject:operator]; /////////////
    //    _equationDisplay = [_equationDisplay stringByAppendingString:operator];
        _previosOperation = OPERATORS;
    } else if (_previosOperation == CLOSE_PARENTHESES) {
   //     _equationDisplay = [_equationDisplay stringByAppendingString:operator];
        [_equationArray addObject:operator];  //////////////////
        _previosOperation = OPERATORS;
    }
    self.equationDisplayLabel.text = [_equationArray componentsJoinedByString:@""];
    
}
-(IBAction)openParentheses:(id)sender
{
    if (_previosOperation == OPERATORS || _previosOperation == OPEN_PARENTHESES || _previosOperation == SOLVE)
    {
     //   _equationDisplay = [_equationDisplay stringByAppendingString:@"("];
        [_equationArray addObject:@"("];
        _numberOfUnclosedParenthesis ++;
        self.equationDisplayLabel.text = [_equationArray componentsJoinedByString:@""];
        _previosOperation = OPEN_PARENTHESES;
    }
   
}
-(IBAction)closeParentheses:(id)sender
{
    if ((_previosOperation == NUMBRES || _previosOperation == CLOSE_PARENTHESES) && _numberOfUnclosedParenthesis > 0)
    {
        if (!(_previosOperation == CLOSE_PARENTHESES)){
    //        _equationDisplay = [_equationDisplay stringByAppendingString:_digitsDisplay];
            [_equationArray addObject:_digitsDisplay];
        }
   //     _equationDisplay = [_equationDisplay stringByAppendingString:@")"];
        [_equationArray addObject:@")"];
        _numberOfUnclosedParenthesis --;
        _decimalPeriodInEffect = NO;
        self.equationDisplayLabel.text = [_equationArray componentsJoinedByString:@""];
        _previosOperation = CLOSE_PARENTHESES;
    }
}
-(IBAction)clear:(id)sender
{
    _digitsDisplay = @"0";
    if (_previosOperation == CLEAR) {
        _previosOperation = SOLVE;
  //      _equationDisplay=@"";
        [_equationArray removeAllObjects];
        _numberOfUnclosedParenthesis = 0;
        self.equationDisplayLabel.text = [_equationArray componentsJoinedByString:@""];
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
    BOOL validRequest = NO;
    if (_previosOperation == NUMBRES) {
  //      _equationDisplay = [_equationDisplay stringByAppendingString:_digitsDisplay];
        [_equationArray addObject:_digitsDisplay];
        validRequest = YES;
    }
    if (_previosOperation == CLOSE_PARENTHESES) {
   //     _equationDisplay = [_equationDisplay stringByAppendingString:@")"];
        [_equationArray addObject:@")"];
        validRequest = YES;
    }
    if (validRequest && _numberOfUnclosedParenthesis > 0) {
        for (int i=0; i<_numberOfUnclosedParenthesis; i++){
  //          _equationDisplay = [_equationDisplay stringByAppendingString:@")"];
            [_equationArray addObject:@")"];
        }
    }
    if (validRequest) {
        self.digitsDisplayLabel.text = @"0.0"; //solve equation
        self.equationDisplayLabel.text = [_equationArray componentsJoinedByString:@""];
        _digitsDisplay = @"0";
        [_equationArray removeAllObjects];
  //     _equationDisplay = @"";
        _previosOperation = SOLVE;
    }
}

@end
