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
    NUMBRES, OPERATORS, PARENTHESES, CLEAR, PERIOD, SOLVE
};

@interface calculatorViewController : UIViewController
{
    NSString *_digitsDisplay;
    NSString *_equationDisplay;
    enum keyType previosOperation;
    BOOL decimalPeriodInEffect;
    int numberOfUnclosedOpenParenthesis;    
}

-(IBAction)numbers:(id)sender;
-(IBAction)operators:(id)sender;
-(IBAction)parentheses:(id)sender;
-(IBAction)clear:(id)sender;
-(IBAction)peiod:(id)sender;
-(IBAction)solve:(id)sender;

@end




NS_ASSUME_NONNULL_END
