//
//  Test.h
//  test2
//
//  Created by Bonan Zhang on 11/09/2014.
//  Copyright (c) 2014 fireup. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Writer.h"
#import "TestHelper.h"

@interface Test : NSObject <Writer> {
    NSString *anotherVar;
}

@property (strong, nonatomic) NSString *var;

+ (NSString *)displayVar: (NSString *)str;

@end
