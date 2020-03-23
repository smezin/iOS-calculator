//
//  calculatorModel.h
//  SHFcalculator2
//
//  Created by hyperactive on 22/03/2020.
//  Copyright © 2020 hyperActive. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface calculatorModel : NSObject
{
    NSMutableArray *_equation;
    NSInteger _currentOperaotrIndex;
    NSInteger _currentOpenParentheses, _currentCloseParentheses;
    NSString *_currentResultString, *_subResultString;
    NSString *_currentOperator;
    double _leftArgument, _rightArgument, _currentResult;
}

-(instancetype)init;
-(instancetype)initWithEquation: (NSMutableArray*)equation;
-(NSMutableArray*)equation;


+(NSString*) solveEquation: (NSMutableArray*) equation;
-(NSString*) evaluateExpression;
-(BOOL) extractValuesBeforeAndAfter: (NSString*) operator1 orOperator: (NSString*) operator2;
-(BOOL) solveSingleOperation;
-(NSMutableArray*) replaceExpressionWithValue;
-(BOOL) isEquationContainsOpeartor: (NSString*) operator1 orOperator: (NSString*) operator2;
-(BOOL) findParenthesesIndexes;
-(void) replaceSubEquationWithSubResult;
+(NSString*) beautify: (NSString*) numberAsString;
@end

NS_ASSUME_NONNULL_END
