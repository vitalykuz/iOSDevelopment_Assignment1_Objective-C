//
// Created by Vitaly Kuzenkov on 30/3/17.
// Copyright (c) 2017 Vitaly Kuzenkov. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Parser : NSObject {
    char plus;
}

@property (nonatomic, strong) NSString *inputFromUser;
@property (nonatomic) char plus;
-(id)initWithInputFromUser:(NSString *)inputFromUser;
-(NSString *)description;
-(BOOL) isOperatorAtTheEnd:(NSString *)userInput;
-(BOOL) isOperatorSymbol: (char) symbol;

@end
