//
// Created by Vitaly Kuzenkov on 30/3/17.
// Copyright (c) 2017 Vitaly Kuzenkov. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Parser : NSObject {

}

@property (nonatomic) NSString *inputFromUser;
@property (nonatomic) NSMutableString * number;
@property (nonatomic) NSMutableString * numberTest;
@property (nonatomic, strong) NSMutableArray *arrayOfOperators;
@property (nonatomic, strong) NSMutableArray *arrayOfNumbers;
-(id)initWithInputFromUser:(NSString *)inputFromUser;
-(NSString *)description;
-(BOOL) isOperatorAtTheEnd:(NSString *)userInput;
-(BOOL) isOperatorSymbol: (char) symbol;
-(void) parseUserInput: (NSString *)userInput;
-(BOOL) areTwoOperatorsAtStartOfUserInput: (NSString *) userInput;
-(void) startParsing:(NSString *)userInput;
-(BOOL) isSymbolNumber:(char) symbol;
-(void) printErrorWith: (NSString *) message;
-(void)convertNumberToIntAndAddToArray: (NSString *) number;
-(NSInteger) convertCharToInt: (char) symbol;
-(BOOL) isOperatorEmpty;


//delete after testing
- (void)testingSaveToMutableArray:(NSString *)userInput;
- (void)testingSaveOperators:(NSString *)userInput;
- (void)testStartParsing:(char)userInput;

@end
