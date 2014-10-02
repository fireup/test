//
//  Test.m
//  test2
//
//  Created by Bonan Zhang on 11/09/2014.
//  Copyright (c) 2014 fireup. All rights reserved.
//

#import "Test.h"

@interface Test () {
    @protected NSString *another;
}

@end

@implementation Test {
@private TestHelper *helper;
}

- (instancetype)init
{
    if ((self = [super init])) {
        NSLog(@"%@: ", NSStringFromSelector(_cmd));
        helper = [[TestHelper alloc] init];
    }
    return self;
}

- (id)forwardingTargetForSelector:(SEL)aSelector
{
    NSLog(@"%@: ", NSStringFromSelector(_cmd));
    if ([helper respondsToSelector:aSelector]) {
        return helper;
    }
    return nil;
}



- (NSString *)var
{
    return @"var";
}

- (void)setVar:(NSString *)var
{
    NSLog(@"%@", var);
}

+ (NSString*)displayVar:(NSString *)str
{
    NSLog(@"%@", str);
    return str;
}

- (void)writeFile
{
    
}


@end
