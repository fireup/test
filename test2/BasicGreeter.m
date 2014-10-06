//
//  BasicGreeter.m
//  test2
//
//  Created by Bonan Zhang on 6/10/2014.
//  Copyright (c) 2014 fireup. All rights reserved.
//

#import "BasicGreeter.h"

@implementation BasicGreeter

- (NSString *)greeting:(NSString *)salutation
{
    return [NSString stringWithFormat:@"%@, world", salutation];
}

@end
