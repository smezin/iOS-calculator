//
//  calculatorViewController.h
//  SHFcalculator2

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

enum keyType
{
    NUMBRES, OPERATORS, OPEN_PARENTHESES, CLOSE_PARENTHESES, CLEAR, PERIOD, SOLVE
};

@interface calculatorViewController : UIViewController

@property NSString*digitsDisplay;
@property NSMutableArray *equationArray;
@property enum keyType previosOperation;
@property BOOL decimalPeriodInEffect;
@property int numberOfUnclosedParenthesis;


-(IBAction)numbers:(id)sender;
-(IBAction)operators:(id)sender;
-(IBAction)openParentheses:(id)sender;
-(IBAction)closeParentheses:(id)sender;
-(IBAction)clear:(id)sender;
-(IBAction)peiod:(id)sender;
-(IBAction)solve:(id)sender;

@end

NS_ASSUME_NONNULL_END
