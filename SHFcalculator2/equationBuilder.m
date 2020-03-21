//
//  equationBuilder.m
//  SHFcalculator2
//
//  Created by hyperactive on 21/03/2020.
//  Copyright © 2020 hyperActive. All rights reserved.
//

#import "equationBuilder.h"

@implementation equationBuilder

-(NSString*)equation
{
    return _equation;
}
-(void)setEquation:(NSString *)equation
{
    _equation = equation;
}

-(NSString*)currentNumber
{
    return _currentNumber;
}
-(void)setCurrentNumber:(NSString *)currentNumber
{
    _currentNumber = currentNumber;
}


-(NSString*)addKeyType: (NSString*)keyType ofValue: (NSString*)value toEquation: (NSString*)equation;
{
    return @"0";
}

@end
