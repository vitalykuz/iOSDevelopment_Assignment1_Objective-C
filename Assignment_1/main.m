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

        [parser parseUserInput: parser.inputFromUser];

        [parser convertNumberToIntAndAddToArray:@"32"];

        NSLog(@"%@", parser.arrayOfNumbers);
        NSLog(@"%@", parser.arrayOfOperators);

    }
    return 0;
}
