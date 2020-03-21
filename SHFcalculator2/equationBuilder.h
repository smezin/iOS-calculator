//
//  equationBuilder.h
//  SHFcalculator2
//
//  Created by hyperactive on 21/03/2020.
//  Copyright © 2020 hyperActive. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface equationBuilder : NSObject
{
    NSString *_equation;
    NSString *_currentNumber;
}

-(NSString*) equation;
-(void)setEquation: (NSString*) equation;
-(NSString*) currentNumber;
-(void)setCurrentNumber: (NSString*) currentNumber;


-(NSString*)addKeyType: (NSString*)keyType ofValue: (NSString*)value toEquation: (NSString*)equation;

@end

NS_ASSUME_NONNULL_END
