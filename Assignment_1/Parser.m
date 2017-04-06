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
    self.numberTest = [[NSMutableString alloc] init];
    self.arrayOfOperators = [[NSMutableArray alloc] init];
    self.arrayOfNumbers = [[NSMutableArray alloc] init];

    return self;
}

- (NSString *)description {
    return self.inputFromUser;
}

- (void)parseUserInput:(NSString *)userInput {
    if ([self isOperatorAtTheEnd:userInput]  || [self areTwoOperatorsAtStartOfUserInput:userInput])
    {
        [self printErrorWith:@"Invalid input in parseUserInput"];
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

- (void)startParsing:(NSString *)userInput {
    NSLog(@"I am in start parsing");


    int operatorCounter = 1;
    for (int i = 0; i < [userInput length]; i++)
    {
        char symbol = (char) [userInput characterAtIndex:(NSUInteger) i];
        //if a symbol is a number, adds to the list of operators
        if ([self isSymbolNumber:symbol])
        {
            //NSInteger convertedCharToNumber = [self convertCharToInt:symbol];
            NSLog(@"Before self.number %@", self.numberTest);
            //[self.number appendString:[NSString stringWithFormat:@"%li", convertedCharToNumber]];
            [self testStartParsing:symbol];
            //self.number += symbol;
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
                    //NSInteger convertedCharToNumber = [self convertCharToInt:symbol];
                    //[self.number appendString:[NSString stringWithFormat:@"%li", convertedCharToNumber]];
                    [self testStartParsing:symbol];
                    operatorCounter = 0;
                    NSLog(@"Number in here: %@", self.numberTest);
                }
                else if (operatorCounter == 0)
                {
                    //IsNumberEmpty(number);
                    [self convertNumberToIntAndAddToArray:self.numberTest];
                    NSString *singleCharacter  = [NSString stringWithFormat:@"%c", symbol];
                    [self.arrayOfOperators addObject:singleCharacter];
                    //[self.arrayOfOperators addObject:@(symbol)];
                    //listOfOperators.Add(symbol);
                    operatorCounter++;
                }
                else [self printErrorWith:@"Invalid input operatorCounter == 0 "];
            }
            else
            {
                [self printErrorWith:@"Invalid input operatorCounter == 0 below"];
            }
        }
    }
    [self convertNumberToIntAndAddToArray:self.numberTest];
    //IsNumberEmpty(number);
    if ( [self isOperatorEmpty] )
    {
        [self printErrorWith:@"Invalid input final one"];

    }
}

- (BOOL)isSymbolNumber:(char)symbol {
    return symbol >= '0' && symbol <= '9';
}

- (void)printErrorWith:(NSString *) message {
    NSLog(@"%@",message);
    exit(0);
}

- (void)convertNumberToIntAndAddToArray:(NSString *)number {
    if ( [number length] != 0 ) {
        @try {
            NSNumber *numberObject = @([number intValue]);
            [self.arrayOfNumbers addObject: numberObject];
            self.numberTest = (NSMutableString *) @"";
        } @catch (NSError *error) {
            [self printErrorWith:@"Invalid input try-catch"];
        }
    }
}

- (NSInteger)convertCharToInt:(char)symbol {
    NSInteger number = [[NSString stringWithFormat:@"%c", symbol] intValue];
    return number;
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


// TO-DO: Delete after testing
- (void)testingSaveToMutableArray:(NSString *)userInput {
    for (int i = 0; i < [userInput length]; i++) {
        char symbol = (char) [userInput characterAtIndex:(NSUInteger) i];

        if ([self isSymbolNumber:symbol]) {

            NSInteger convertedCharToNumber = [self convertCharToInt:symbol];
            [self.number appendString:[NSString stringWithFormat:@"%li", convertedCharToNumber]];
            NSLog(@"Self number: %@", self.number);


            NSNumber *number = @([self.number intValue]);
            [self.arrayOfNumbers addObject: number];

            NSLog(@"Array of Numbers: %@", self.arrayOfNumbers);
            //self.number += symbol;
        }
    }
}

// TO-DO: Delete after testing
- (void)testingSaveOperators:(NSString *)userInput {
    for (int i = 0; i < [userInput length]; i++) {
        char symbol = (char) [userInput characterAtIndex:(NSUInteger) i];

        if ([self isOperatorSymbol:symbol]) {

            NSString *singleCharacter  = [NSString stringWithFormat:@"%c", symbol];
            [self.arrayOfOperators addObject:singleCharacter];
        }
    }
    NSLog(@"Array of operators: %@", self.arrayOfOperators);
}


- (void)testStartParsing:(char) symbol {
    //NSInteger convertedCharToNumber = [self convertCharToInt:symbol];
    NSString *convertedSymbolToString = [NSString stringWithFormat:@"%c", symbol];

    if ([self.numberTest isEqualToString:@""]) {
        NSLog(@"Goood");
        self.numberTest = [convertedSymbolToString mutableCopy];
    } else {
        [self.numberTest appendString:[[NSMutableString stringWithFormat:@"%@", convertedSymbolToString] mutableCopy]];
    }


    //[self.numberTest stringByAppendingString:convertedSymbolToString];
    NSLog(@"Added number: %@", self.numberTest);
}

@end



