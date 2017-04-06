//
// Created by Vitaly Kuzenkov on 6/4/17.
// Copyright (c) 2017 Vitaly Kuzenkov. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Calculator : NSObject {

}

@property (nonatomic, strong) NSMutableArray *arrayOfOperators;
@property (nonatomic, strong) NSMutableArray *arrayOfNumbers;

-(id)initWith: (NSMutableArray *) arrayOfOperators and: (NSMutableArray *) arrayOfNumbers;
-(NSString *) checkPriorityOperators;
-(void) printErrorWith: (NSString *) message;
-(void)updateListsAt: (NSInteger) position;
-(NSInteger) performCalculation: (NSInteger) number1  :(NSInteger) number2 :(char) operation;

@end