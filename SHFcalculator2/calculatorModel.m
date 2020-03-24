//
//  calculatorModel.m
//  SHFcalculator2
//
//  Created by hyperactive on 22/03/2020.
//  Copyright © 2020 hyperActive. All rights reserved.
//

#import "calculatorModel.h"

@implementation calculatorModel
-(instancetype)init
{
    NSMutableArray *equation;
    return [self initWithEquation:equation];
}

-(instancetype)initWithEquation:(NSMutableArray *)equation
{
    self = [super init];
    if(self)
    {
        _equation = [NSMutableArray arrayWithArray:equation];
        _currentResultString = @"";
        _subResultString = @"";
        _currentOperator = @"";
        _currentOperaotrIndex = 0;
        _currentOpenParentheses = 0;
        _currentCloseParentheses = 0;
        _leftArgument = 0.0;
        _rightArgument = 0.0;
        _currentResult = 0.0;
    }
    return self;
}
-(NSMutableArray*)equation
{
    return _equation;
}
+(NSString*) solveEquation: (NSMutableArray*) equation
{
    calculatorModel *calculate = [[calculatorModel alloc]initWithEquation:equation];
    return [calculate solveSubEquations];
    
}

-(NSString*) solveSubEquations
{
    if (![self findParenthesesIndexes])
        return [self evaluateExpression];
    else
    {
        [self findParenthesesIndexes];
        NSMutableArray *subEquation = [[NSMutableArray alloc]init];
        for (NSInteger i = _currentOpenParentheses + 1; i < _currentCloseParentheses; i++)
            [subEquation addObject:_equation[i]];
        calculatorModel *subCalculation = [[calculatorModel alloc]initWithEquation:subEquation];
        _subResultString = [subCalculation evaluateExpression];
        [self replaceSubEquationWithSubResult];
        return [self solveSubEquations];
    }
}

-(void) replaceSubEquationWithSubResult
{
    [_equation replaceObjectAtIndex:_currentOpenParentheses withObject:_subResultString];
    for (NSInteger i =_currentCloseParentheses; i > _currentOpenParentheses; i--)
         [_equation removeObjectAtIndex:i];
}

-(BOOL) findParenthesesIndexes
{
    BOOL isFound = NO;
    for (NSInteger i = [_equation count] - 1; i >= 0 && !isFound; i--)
        if ([_equation[i] isEqualToString:@"("])
        {
            _currentOpenParentheses = i;
            isFound = YES;
        }
    isFound = NO;
    for (NSInteger i = _currentOpenParentheses; i < [_equation count] && !isFound; i++)
        if ([_equation[i] isEqualToString:@")"])
        {
            _currentCloseParentheses = i;
            isFound = YES;
        }
    return isFound;
}


-(NSString*) evaluateExpression
{
    while ([self isEquationContainsOpeartor:@"x" orOperator:@"/"])
    {
        [self extractValuesBeforeAndAfter:@"x" orOperator:@"/"];
        if (![self solveSingleOperation])
            return @"DIV/0 Error";
        [self replaceExpressionWithValue];
    }
    while ([self isEquationContainsOpeartor:@"+" orOperator:@"-"])
    {
        [self extractValuesBeforeAndAfter:@"+" orOperator:@"-"];
        [self solveSingleOperation];
        [self replaceExpressionWithValue];
    }
    NSString *trimmedResult = [calculatorModel cutTrainlingZeros:[[self equation] componentsJoinedByString:@""]];
    return trimmedResult;
}

+(NSString*) cutTrainlingZeros: (NSString*) numberAsString 
{
    NSUInteger i = [numberAsString length]-1;
    for (; i >= 0 && [numberAsString characterAtIndex:i] == '0'; i--);
    
    if ([numberAsString characterAtIndex:i] == '.')
        return [numberAsString substringToIndex:i];
    else
        return [numberAsString substringToIndex:i+1];
    
    return numberAsString;
    
}
-(BOOL) isEquationContainsOpeartor: (NSString*) operator1 orOperator: (NSString*) operator2
{
    for (NSInteger i = 0; i < [_equation count]; i++)
        if ([_equation[i] isEqualToString:operator1] || [_equation[i] isEqualToString:operator2])
            return YES;
    return NO;
}

-(NSMutableArray*) replaceExpressionWithValue
{
    [_equation replaceObjectAtIndex:_currentOperaotrIndex withObject:_currentResultString];
    [_equation removeObjectAtIndex:_currentOperaotrIndex + 1];
    [_equation removeObjectAtIndex:_currentOperaotrIndex - 1];
    return _equation;
}

-(BOOL) extractValuesBeforeAndAfter: (NSString*) operator1 orOperator: (NSString*) operator2
{
    for (NSInteger i = 0; i < [_equation count]; i++)
    {
        if ([_equation[i] isEqualToString:operator1] || [_equation[i] isEqualToString:operator2])
        {
            _currentOperaotrIndex = i;
            _currentOperator = _equation[i];
            _leftArgument = [_equation[i-1] doubleValue];
            _rightArgument = [_equation[i+1] doubleValue];
            return YES;
        }
    }
    return NO;
}

-(BOOL) solveSingleOperation
{
    if ([_currentOperator isEqualToString:@"+"])
        _currentResult = _leftArgument + _rightArgument;
    else if ([_currentOperator isEqualToString:@"-"])
        _currentResult = _leftArgument - _rightArgument;
    else if ([_currentOperator isEqualToString:@"x"])
        _currentResult = _leftArgument * _rightArgument;
    else if ([_currentOperator isEqualToString:@"/"])
    {
        if (_rightArgument == 0)
            return NO;
        else
            _currentResult = _leftArgument / _rightArgument;
    }
    else
        return NO;
    _currentResultString = [NSString stringWithFormat:@"%.6f", _currentResult];
    return YES;
}
@end
