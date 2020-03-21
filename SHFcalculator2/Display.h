//
//  Display.h
//  SHFcalculator2
//
//  Created by hyperactive on 21/03/2020.
//  Copyright © 2020 hyperActive. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Display : NSObject
{
    NSString *_currentNumberDisplayString;
    NSMutableString *_equationDisplayString;
}

-(void)setCurrentNumberDisplayString: (NSString *)key;
-(NSString*)currentNumberDisplayString;

-(void)setEquationDisplayString: (NSString *)key;
-(NSMutableString*)equationDisplayString;

@end

NS_ASSUME_NONNULL_END
