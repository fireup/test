//
//  main.m
//  Chapter 9 expert: runtime API
//
//  Created by Bonan Zhang on 11/09/2014.
//  Copyright (c) 2014 fireup. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import "Test.h"
#import "SubTest.h"
#import "Test+helper.h"
#import "BasicGreeter.h"

@interface TestClass1 : NSObject { @public int myInt; }
@end
@implementation TestClass1
@end

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        id <Greeter> greeter = [[BasicGreeter alloc] init];
        [greeter greeting:@"Hello"];
        
        NSString *bundlePath;
        
        if (argc != 2) {
            NSLog(@"please provide a path");
            
        } else {
            bundlePath = [NSString stringWithUTF8String:argv[1]];
            NSBundle *greeterBundle = [NSBundle bundleWithPath:bundlePath];
            
            if (greeterBundle == nil) {
                NSLog(@"bundle not found");
                
            } else {
                NSError *error;
                BOOL isLoaded = [greeterBundle loadAndReturnError:&error];
                
                if (!isLoaded) {
                    NSLog(@"Error = %@", [error localizedDescription]);
                    
                } else {
                    Class greeterClass = [greeterBundle principalClass]; //classNamed:"GreeterClass"
                    greeter = [[greeterClass alloc] init];
                    NSLog(@"%@", [greeter greeting:@"hello"]);
                    
                    greeter = nil;
                    BOOL isUnloaded = [greeterBundle unload];
                    if (!isUnloaded) {
                        NSLog(@"Couldn't unload bundle");
                    }
                }
            }
        }
        
//        TestClass1 *tclA = [[TestClass1 alloc] init];
//        tclA->myInt = 0xa5a5a5a5;
//        TestClass1 *tclB = [[TestClass1 alloc] init];
//        tclB->myInt = 0xc3c3c3c3;
//        long tclSize = class_getInstanceSize([TestClass1 class]);
//        NSData *obj1Data = [NSData dataWithBytes:(__bridge const void*)(tclA) length:tclSize];
//        NSData *obj2Data = [NSData dataWithBytes:(__bridge const void*)(tclB) length:tclSize];
//        
//        NSLog(@"TestClass1 object tc1 contains %@", obj1Data);
//        NSLog(@"TestClass2 object tc2 contains %@", obj2Data);
//        NSLog(@"TestClass1 memory address= %p", [TestClass1 class]);
        
//        NSString *str = @"greeting";
//        CFStringRef cstr = (__bridge_retained CFStringRef)str;
//        printf("string length = %ld", CFStringGetLength(cstr));
//        CFRelease(cstr);
        
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

