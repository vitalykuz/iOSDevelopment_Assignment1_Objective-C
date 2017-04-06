//
//  main.m
//  Assignment_1
//
//  Created by Vitaly Kuzenkov on 30/3/17.
//  Copyright © 2017 Vitaly Kuzenkov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Parser.h"

int main(int argc, const char * argv[]) {
	@autoreleasepool {

        Parser *parser = [[Parser alloc] initWithInputFromUser:(NSString *) @"2+3+7-7*23%3"];


        NSLog(@"Input from user: %@", parser.inputFromUser);
        [parser parseUserInput: parser.inputFromUser];

//         [parser testStartParsing: '2'];
//         [parser testStartParsing: '3'];
//         [parser testStartParsing: '3'];
//         [parser testStartParsing: '3'];
//         [parser testStartParsing: '3'];
//         [parser testStartParsing: '3'];
//         [parser testStartParsing: '3'];

//        parser.number = (NSMutableString *) @"23";
//        NSLog(@"Number: %@", parser.number);
//        NSLog(@"Array of Numbers: %@", parser.arrayOfNumbers);
//        [parser convertNumberToIntAndAddToArray:@"234"];
//        NSLog(@"Number: %@", parser.number);
//        NSLog(@"Array of Numbers: %@", parser.arrayOfNumbers);


//
//        NSLog(@"Array of Operators Before: %@", parser.arrayOfOperators);
//        [parser testingSaveOperators: parser.inputFromUser];
//        NSLog(@"Array of Operators After: %@", parser.arrayOfOperators);


        NSLog(@"Array of Numbers: %@", parser.arrayOfNumbers);
        NSLog(@"Array of Operators: %@", parser.arrayOfOperators);

    }
    return 0;
}
