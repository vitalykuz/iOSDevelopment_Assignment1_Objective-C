//
// Created by Vitaly Kuzenkov on 30/3/17.
// Copyright (c) 2017 Vitaly Kuzenkov. All rights reserved.
//

#import "Parser.h"




@implementation Parser {

}

- (id)initWithInputFromUser:(NSString *)inputFromUser {
    self = [super init];
    self.inputFromUser = inputFromUser;

    return self;
}

- (NSString *)description {
    return self.inputFromUser;
}

- (void)parseUserInput:(NSString *)userInput {
    if ([self isOperatorAtTheEnd:userInput]  || [self areTwoOperatorsAtStartOfUserInput:userInput])
    {
        NSLog(@"Invalid input in parseUserInput");
    } else {
        [self startParsing:userInput];
    }
}

/**
 * checks if a user typed 2 minuses or 2 pluses at the beginning of expression.
 * @param userInput -> command line argument provided by a user
 * @returns  true if 2 minuses or 2 pluses are found at the beginning
 */
- (BOOL)areTwoOperatorsAtStartOfUserInput:(NSString *)userInput {
    for (int i = 0; i < [userInput length]; i++)
    {
        char symbol = (char) [userInput characterAtIndex:(NSUInteger) i];
        //char nextSymbol = (char) [userInput characterAtIndex:(NSUInteger) i + 1];
        if ((symbol == '-' && [userInput characterAtIndex:(NSUInteger) i + 1] == '-' && i == 0) || (symbol == '+' && [userInput characterAtIndex:(NSUInteger) i + 1] == '+' && i == 0))
        {
            return YES;
        }
    }
    return NO;
}

- (void)startParsing:(NSString *) input {
    NSLog(@"I am in start parsing");
}

- (BOOL)isSymbolNumber:(char)symbol {
    return symbol >= '0' && symbol <= '9';
}


/**
 * checks if the parameter(symbol) is an operator (not a number)
 * @return returns true if the parameter is the operator
 */
- (BOOL)isOperatorSymbol:(char)symbol {
    return symbol == '+' || symbol == '-' || symbol == '*' || symbol == '/' || symbol == '%';
}

/**
 * checks if a user typed operator at the very end of expression.
 * @returns true, if an operator at the end is found
 */
- (BOOL)isOperatorAtTheEnd:(NSString *)userInput {
    //get the length of the user input
    NSUInteger userInputLength = [userInput length];

    for (int i = 0; i < userInputLength; i++)
    {
        char symbol = (char) [userInput characterAtIndex:(NSUInteger) i];

        if ([self isOperatorSymbol:symbol])
        {
            char lastChar = (char) [userInput characterAtIndex: userInputLength - 1];
            if ([userInput characterAtIndex:(NSUInteger) i] == lastChar)
            {
                return YES;
            }
        }
    }
    return NO;
}


@end



