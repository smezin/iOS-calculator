//
//  calculatorModel.m
//  SHFcalculator2


#import "calculatorModel.h"

@implementation calculatorModel
NSString const *divByZeroErrorMsg=@"DIV/0 Error";
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
        for (NSInteger i = self.currentOpenParentheses + 1; i < self.currentCloseParentheses; i++)
            [subEquation addObject:self.equation[i]];
        calculatorModel *subCalculation = [[calculatorModel alloc]initWithEquation:subEquation];
        self.subResultString = [subCalculation evaluateExpression];
        if ([self.subResultString isEqualToString:(NSString*)divByZeroErrorMsg])
        {
            [self.equation removeAllObjects];
            [self.equation addObject:divByZeroErrorMsg];
            return (NSString*)divByZeroErrorMsg;
        }
        [self replaceSubEquationWithSubResult];
        return [self solveSubEquations];
    }
}

-(NSString*) evaluateExpression
{
    if ([self.equation count] == 1)
        return self.equation[0];
    
    while ([self extractValuesBeforeAndAfter:@"x" orOperator:@"/"])
    {
        if (![self solveSingleOperation])
            return (NSString*)divByZeroErrorMsg;
        [self replaceExpressionWithValue];
    }
    while ([self extractValuesBeforeAndAfter:@"+" orOperator:@"-"])
    {
        [self solveSingleOperation];
        [self replaceExpressionWithValue];
    }
    NSString *trimmedResult = [calculatorModel cutTrailingZeros:[[self equation] componentsJoinedByString:@""]];
    return trimmedResult;
}

-(BOOL) extractValuesBeforeAndAfter: (NSString*) operator1 orOperator: (NSString*) operator2
{
    for (NSInteger i = 0; i < [self.equation count]; i++)
    {
        if ([self.equation[i] isEqualToString:operator1] || [self.equation[i] isEqualToString:operator2])
        {
            self.currentOperaotrIndex = i;
            self.currentOperator = self.equation[i];
            self.leftArgument = [self.equation[i-1] doubleValue];
            self.rightArgument = [self.equation[i+1] doubleValue];
            return YES;
        }
    }
    return NO;
}

-(BOOL) solveSingleOperation
{
    if ([self.currentOperator isEqualToString:@"+"])
        self.currentResult = self.leftArgument + self.rightArgument;
    else if ([self.currentOperator isEqualToString:@"-"])
        self.currentResult = self.leftArgument - self.rightArgument;
    else if ([self.currentOperator isEqualToString:@"x"])
        self.currentResult = self.leftArgument * self.rightArgument;
    else if ([self.currentOperator isEqualToString:@"/"])
    {
        if (self.rightArgument == 0)
            return NO;
        else
            self.currentResult = self.leftArgument / self.rightArgument;
    }
    else
        return NO;
    self.currentResultString = [NSString stringWithFormat:@"%.6f", self.currentResult];
    return YES;
}

-(void) replaceSubEquationWithSubResult
{
    [self.equation replaceObjectAtIndex:self.currentOpenParentheses withObject:self.subResultString];
    for (NSInteger i =self.currentCloseParentheses; i > self.currentOpenParentheses; i--)
         [self.equation removeObjectAtIndex:i];
}

-(BOOL) findParenthesesIndexes
{
    BOOL isFound = NO;
    for (NSInteger i = [self.equation count] - 1; i >= 0 && !isFound; i--)
        if ([self.equation[i] isEqualToString:@"("])
        {
            self.currentOpenParentheses = i;
            isFound = YES;
        }
    isFound = NO;
    for (NSInteger i = self.currentOpenParentheses; i < [self.equation count] && !isFound; i++)
        if ([self.equation[i] isEqualToString:@")"])
        {
            self.currentCloseParentheses = i;
            isFound = YES;
        }
    return isFound;
}

-(NSMutableArray*) replaceExpressionWithValue
{
    [self.equation replaceObjectAtIndex:self.currentOperaotrIndex withObject:self.currentResultString];
    [self.equation removeObjectAtIndex:self.currentOperaotrIndex + 1];
    [self.equation removeObjectAtIndex:self.currentOperaotrIndex - 1];
    return self.equation;
}

+(NSString*) cutTrailingZeros: (NSString*) numberAsString
{
    NSUInteger i = [numberAsString length]-1;
    for (; i >= 0 && [numberAsString characterAtIndex:i] == '0'; i--);
    
    if ([numberAsString characterAtIndex:i] == '.')
        return [numberAsString substringToIndex:i];
    else
        return [numberAsString substringToIndex:i+1];
    
    return numberAsString;    
}
@end
