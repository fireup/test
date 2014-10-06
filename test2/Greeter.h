//
//  Greeter.h
//  test2
//
//  Created by Bonan Zhang on 6/10/2014.
//  Copyright (c) 2014 fireup. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Greeter <NSObject>

- (NSString *)greeting:(NSString *)salutation;

@end
