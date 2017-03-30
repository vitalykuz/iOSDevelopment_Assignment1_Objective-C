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

- (BOOL)isOperatorSymbol:(char)symbol {
    return symbol == '+' || symbol == '-' || symbol == '*' || symbol == '/' || symbol == '%';
}

- (BOOL)isOperatorAtTheEnd:(NSString *)userInput {
    //get the length of the user input
    NSUInteger userInputLength = [userInput length];

    for (int i = 0; i < userInputLength; i++)
    {
        char symbol = (char) [userInput characterAtIndex:(NSUInteger) i];
        NSLog(@"Char in input: %c", symbol);

        if ([self isOperatorSymbol:symbol])
        {
            //char lastChar = userInput[userInputLength - 1];
            char lastChar = (char) [userInput characterAtIndex: userInputLength - 1];
            NSLog(@"Last char in input: %c", lastChar);
            if ([userInput characterAtIndex:(NSUInteger) i] == lastChar)
            {
                return YES;
            }
        }
    }
    return NO;
}

@end
