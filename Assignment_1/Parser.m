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
    self.tempNumber = [[NSMutableString alloc] init];
    self.arrayOfOperators = [[NSMutableArray alloc] init];
    self.arrayOfNumbers = [[NSMutableArray alloc] init];

    return self;
}

- (void)parseUserInput:(NSString *)userInput {
    if ([self isOperatorAtTheEnd:userInput]  || [self areTwoOperatorsAtStartOfUserInput:userInput])
    {
        [self printErrorWith:@"Invalid input"];
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

        if ((symbol == '-' && [userInput characterAtIndex:(NSUInteger) i + 1] == '-' && i == 0) || (symbol == '+' && [userInput characterAtIndex:(NSUInteger) i + 1] == '+' && i == 0))
        {
            return YES;
        }
    }
    return NO;
}

- (void)startParsing:(NSString *)userInput {
    int operatorCounter = 1;
    for (int i = 0; i < [userInput length]; i++)
    {
        char symbol = (char) [userInput characterAtIndex:(NSUInteger) i];
        //if a symbol is a number, adds to the list of operators
        if ([self isSymbolNumber:symbol])
        {
            [self addSymbolToNumber:symbol];
            operatorCounter = 0;
        }
        else
        {
            if ([self isOperatorSymbol:symbol])
            {
                //checks if the symbol is a unary operator.
                if ((symbol == '-' || symbol == '+') && ([self isSymbolNumber:(char) [userInput characterAtIndex:(NSUInteger) i + 1]])
                        && (operatorCounter == 1))
                {
                    [self addSymbolToNumber:symbol];
                    operatorCounter = 0;
                }
                else if (operatorCounter == 0)
                {
                    [self convertStringToIntAndAddToArray:self.tempNumber];
                    NSString *singleCharacter  = [NSString stringWithFormat:@"%c", symbol];
                    [self.arrayOfOperators addObject:singleCharacter];
                    operatorCounter++;
                }
                else [self printErrorWith:@"Invalid input"];
            }
            else
            {
                [self printErrorWith:@"Invalid input"];
            }
        }
    }
    [self convertStringToIntAndAddToArray:self.tempNumber];

    if ( [self isOperatorEmpty] )
    {
        [self printErrorWith:@"Invalid input"];

    }
}

- (BOOL)isSymbolNumber:(char)symbol {
    return symbol >= '0' && symbol <= '9';
}

- (void)printErrorWith:(NSString *) message {
    NSLog(@"%@",message);
    exit(0);
}

- (void)convertStringToIntAndAddToArray:(NSString *)number {
    if ( [number length] != 0 ) {
        @try {
            NSNumber *numberObject = @([number intValue]);
            [self.arrayOfNumbers addObject: numberObject];
            self.tempNumber = (NSMutableString *) @"";
        } @catch (NSError *error) {
            [self printErrorWith:@"Invalid input"];
        }
    }
}

- (BOOL)isOperatorEmpty {
    return self.arrayOfOperators.count == 0;
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

- (void)addSymbolToNumber:(char) symbol {
    NSString *convertedSymbolToString = [NSString stringWithFormat:@"%c", symbol];

    if ([self.tempNumber isEqualToString:@""]) {

        self.tempNumber = [convertedSymbolToString mutableCopy];
    } else {
        [self.tempNumber appendString:[[NSMutableString stringWithFormat:@"%@", convertedSymbolToString] mutableCopy]];
    }
}

@end



