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
        _currentOperator = @"";
        _currentOperaotrIndex = 0;
        _leftArgument = 0;
        _rightArgument = 0;
        _currentResult = 0;
    }
    return self;
}
-(NSMutableArray*)equation
{
    return _equation;
}

+(NSString*) solveEquation:(NSMutableArray*) eqaution
{
    calculatorModel *calculate = [[calculatorModel alloc]initWithEquation:eqaution];
    while ([calculate equationContainsOpeartor:@"x" orOperator:@"/"])
    {
        [calculate extractValuesBeforeAndAfter:@"x" orOperator:@"/"];
        [calculate solveSingleOperation];
        [calculate replaceSubEquationWithResult];
    }
    while ([calculate equationContainsOpeartor:@"+" orOperator:@"-"])
    {
        [calculate extractValuesBeforeAndAfter:@"+" orOperator:@"-"];
        [calculate solveSingleOperation];
        [calculate replaceSubEquationWithResult];
    }

    return [[calculate equation] componentsJoinedByString:@""];
}
-(BOOL) equationContainsOpeartor: (NSString*) operator1 orOperator: (NSString*) operator2
{
    for (NSInteger i = 0; i < [_equation count]; i++)
        if ([_equation[i] isEqualToString:operator1] || [_equation[i] isEqualToString:operator2])
            return YES;
    return NO;
}

-(NSMutableArray*) replaceSubEquationWithResult
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
        _currentResult = _leftArgument / _rightArgument;
    else
        return NO;
    _currentResultString = [NSString stringWithFormat:@"%.4f", _currentResult];
    return YES;
}


@end
