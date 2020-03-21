//
//  calculatorViewController.h
//  SHFcalculator2
//
//  Created by hyperactive on 19/03/2020.
//  Copyright © 2020 hyperActive. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

enum keyType
{
    NUMBRES, OPERATORS, OPEN_PARENTHESES, CLOSE_PARENTHESES,CLEAR, PERIOD, SOLVE
};

@interface calculatorViewController : UIViewController
{
    NSString *_digitsDisplay;
    NSString *_equationDisplay;
    enum keyType _previosOperation;
    BOOL _decimalPeriodInEffect;
    int _numberOfUnclosedParenthesis;
}

-(IBAction)numbers:(id)sender;
-(IBAction)operators:(id)sender;
-(IBAction)openParentheses:(id)sender;
-(IBAction)closeParentheses:(id)sender;
-(IBAction)clear:(id)sender;
-(IBAction)peiod:(id)sender;
-(IBAction)solve:(id)sender;

@end




NS_ASSUME_NONNULL_END
