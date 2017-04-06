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

        Parser *parser = [[Parser alloc] initWithInputFromUser:(NSString *) @"2+-3+7--7*23%3"];

        [parser parseUserInput: parser.inputFromUser];



        NSLog(@"Array of Numbers: %@", parser.arrayOfNumbers);
        NSLog(@"Array of Operators: %@", parser.arrayOfOperators);

    }
    return 0;
}
