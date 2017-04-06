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

        Parser *parser = [[Parser alloc] initWithInputFromUser:(NSString *) @"2+-3+7--7*23%3"];

        [parser parseUserInput: parser.inputFromUser];

        Calculator *calculator = [[Calculator alloc] initWith:parser.arrayOfOperators and:parser.arrayOfNumbers];
        //calculator.checkPriorityOperators;

        [calculator updateListsAt:0];

        NSLog(@"Array of Numbers: %@", parser.arrayOfNumbers);
        NSLog(@"Array of Operators: %@", parser.arrayOfOperators);

    }
    return 0;
}
