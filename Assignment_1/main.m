//
//  main.m
//  Assignment_1
//
//  Created by Vitaly Kuzenkov on 30/3/17.
//  Copyright © 2017 Vitaly Kuzenkov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Parser.h"
#import "Calculator.h"

int main(int argc, const char * argv[]) {
	@autoreleasepool {

        Parser *parser = [[Parser alloc] initWithInputFromUser:(NSString *) @"2+2-+3%7*3/33--6"];

        [parser parseUserInput: parser.inputFromUser];

        Calculator *calculator = [[Calculator alloc] initWith:parser.arrayOfOperators and:parser.arrayOfNumbers];
        NSString *result = calculator.checkPriorityOperators;

        NSLog(@"Result: %@", result);

    }
    return 0;
}
