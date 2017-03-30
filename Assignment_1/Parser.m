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

@end
