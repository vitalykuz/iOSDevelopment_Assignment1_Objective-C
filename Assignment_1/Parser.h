//
// Created by Vitaly Kuzenkov on 30/3/17.
// Copyright (c) 2017 Vitaly Kuzenkov. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Parser : NSObject

@property (nonatomic, strong) NSString *inputFromUser;
-(id)initWithInputFromUser:(NSString *)inputFromUser;
-(NSString *)description;

@end