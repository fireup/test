//
//  main.m
//  test2
//
//  Created by Bonan Zhang on 11/09/2014.
//  Copyright (c) 2014 fireup. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Test.h"
#import "SubTest.h"
#import "Test+helper.h"


int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSString *str = @"greeting";
        CFStringRef cstr = (__bridge_retained CFStringRef)str;
        printf("string length = %ld", CFStringGetLength(cstr));
        CFRelease(cstr);
        
//        CFStringRef cstr = CFStringCreateWithCString(NULL, "hello", kCFStringEncodingASCII);
//        NSArray *data = [NSArray arrayWithObject:(__bridge_transfer NSString *)cstr];
//        NSLog(@"%@", data);
        
        
        
//        Test *test1 = [[Test alloc] init];
//        Test *test2 = [[Test alloc] init];
        
//        SubTest *sub = [[SubTest alloc] init];
//        
//        __weak SubTest *sub2 = sub;
//        sub = nil;
//        
//        [sub2 logSuperVar];
//
//        [sub logSuperVar];
//        NSString *fact = [sub factoid];
//        NSLog(@"%@", fact);
        
        
    }
    return 0;
}

