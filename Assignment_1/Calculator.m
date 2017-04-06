//
// Created by Vitaly Kuzenkov on 6/4/17.
// Copyright (c) 2017 Vitaly Kuzenkov. All rights reserved.
//

#import "Calculator.h"


@implementation Calculator {
    enum PriorityOperators _enumPriorityOperators;
}
- (id)initWith:(NSMutableArray *)arrayOfOperators and:(NSMutableArray *)arrayOfNumbers {
    self.arrayOfOperators = arrayOfOperators;
    self.arrayOfNumbers = arrayOfNumbers;

    NSLog(@"operators: %d", _enumPriorityOperators = Multiply);
    return self;
}

- (NSString *)checkPriorityOperators {

    BOOL isPriorityOperator = YES;
    while (isPriorityOperator)
    {
        BOOL flag = NO;
        for (int i = 0; i < [self.arrayOfOperators count]; i++)
        {
            //check if it works
            //char symbol = [self.arrayOfOperators[(NSUInteger) i] charValue];
            //NSLog(@"Symbol: %c", symbol);
            //char c = (char)listOfOperators[i];
            for (id symbol in self.arrayOfOperators) {
                // do something with object
                if ([symbol isEqual:@"*"] || [symbol isEqual:@"/"] || [symbol isEqual:@"%"]) {
                    NSLog(@"Yeees: %@", symbol);
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
    NSLog(@"Number 1: %li", number1);
    NSLog(@"Number 1: %li", number2);


//    int num1 = (int)listOfNumbers[position];
//    int num2 = (int)listOfNumbers[position + 1];
//    char operation = (char)listOfOperators[position];
//    int result = DoMath(num1, num2, operation);
//    listOfOperators.RemoveAt(position);
//    listOfNumbers.RemoveAt(position + 1);
//    listOfNumbers[position] = result;
}


@end