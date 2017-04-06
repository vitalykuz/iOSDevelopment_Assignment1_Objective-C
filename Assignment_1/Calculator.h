//
// Created by Vitaly Kuzenkov on 6/4/17.
// Copyright (c) 2017 Vitaly Kuzenkov. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Calculator : NSObject {
    //char firstOperatorsToCalculate[];
     enum PriorityOperators {
        Multiply,
        Divide,
        Modulo
    };

}

@property (nonatomic, strong) NSMutableArray *arrayOfOperators;
@property (nonatomic, strong) NSMutableArray *arrayOfNumbers;




-(id)initWith: (NSMutableArray *) arrayOfOperators and: (NSMutableArray *) arrayOfNumbers;
-(NSString *) checkPriorityOperators;
-(void) printErrorWith: (NSString *) message;
-(void)updateListsAt: (NSInteger) position;

@end