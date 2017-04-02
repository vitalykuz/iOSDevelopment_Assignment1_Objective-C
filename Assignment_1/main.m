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

        Parser *parser = [[Parser alloc] initWithInputFromUser: @"2+3"];
        NSLog(@"String: %@", parser.description);

//        BOOL hasOperator = [parser isOperatorAtTheEnd:@"2+3++"];
//
//        NSLog(@"Operator at the end is symbol: %d", hasOperator);

        [parser parseUserInput: parser.inputFromUser];
    }
    return 0;
}
