//
//  calculatorModel.h
//  SHFcalculator2

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface calculatorModel : NSObject

@property NSMutableArray *equation;
@property NSInteger currentOperaotrIndex;
@property NSInteger currentOpenParentheses, currentCloseParentheses;
@property NSString *currentResultString, *subResultString;
@property NSString *currentOperator;
@property double leftArgument, rightArgument, currentResult;


-(instancetype)init;
-(instancetype)initWithEquation: (NSMutableArray*)equation;
-(NSMutableArray*)equation;

+(NSString*) solveEquation: (NSMutableArray*) equation;
-(NSString*) evaluateExpression;
-(BOOL) extractValuesBeforeAndAfter: (NSString*) operator1 orOperator: (NSString*) operator2;
-(BOOL) solveSingleOperation;
-(NSMutableArray*) replaceExpressionWithValue;
-(BOOL) findParenthesesIndexes;
-(void) replaceSubEquationWithSubResult;
+(NSString*) cutTrailingZeros: (NSString*) numberAsString;
@end

NS_ASSUME_NONNULL_END
