//
// Created by Vitaly Kuzenkov on 6/4/17.
// Copyright (c) 2017 Vitaly Kuzenkov. All rights reserved.
//

#import "Calculator.h"

@implementation Calculator {
}
- (id)initWith:(NSMutableArray *)arrayOfOperators and:(NSMutableArray *)arrayOfNumbers {
    self.arrayOfOperators = arrayOfOperators;
    self.arrayOfNumbers = arrayOfNumbers;

    return self;
}

- (NSString *)checkPriorityOperators {

    BOOL isPriorityOperator = YES;
    while (isPriorityOperator)
    {
        BOOL flag = NO;
        for (int i = 0; i < [self.arrayOfOperators count]; i++)
        {
            for (id symbol in self.arrayOfOperators) {
                if ([symbol isEqual:@"*"] || [symbol isEqual:@"/"] || [symbol isEqual:@"%"]) {
                    [self updateListsAt:i];
                    flag = YES;
                    break;
                }
            }
        }
        if (!flag) isPriorityOperator = NO;
    }

    while ([self.arrayOfOperators count] > 0)
    {
        [self updateListsAt:0];
    }

    return "Result = %@", self.arrayOfNumbers[0];
}

- (void)printErrorWith:(NSString *) message {
    NSLog(@"%@",message);
    exit(0);
}

- (void)updateListsAt:(NSInteger)position {

    NSInteger number1 = [self.arrayOfNumbers[(NSUInteger) position] integerValue];
    NSInteger number2 = [self.arrayOfNumbers[(NSUInteger) position + 1] integerValue];

    NSString *operation = self.arrayOfOperators[(NSUInteger) position];
    char operator = (char) [operation characterAtIndex:0];

    NSInteger result = [self performCalculation:number1 :number2 :operator];

    [self.arrayOfOperators removeObjectAtIndex:(NSUInteger) position];
    [self.arrayOfNumbers removeObjectAtIndex:(NSUInteger) position + 1];
    self.arrayOfNumbers[(NSUInteger) position] = @(result);
}

- (NSInteger)performCalculation:(NSInteger)number1 :(NSInteger)number2 :(char)operation {
    @try {
        switch (operation) {
            case '+': return number1 + number2;
            case '-': return number1 - number2;
            case '*': return number1 * number2;
            case '/': if (number2 != 0)
                    return number1 / number2;
                    else
                    [self printErrorWith:@"Division by zero"];
                break;
            case '%': return number1 % number2;
            default:break;
        }
    } @catch (NSError *error) {
        [self printErrorWith:@"Out of range"];
    }
    return 0;
}


@end
