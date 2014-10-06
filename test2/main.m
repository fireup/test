//
//  main.m
//  Chapter 9 expert: runtime API
//
//  Created by Bonan Zhang on 11/09/2014.
//  Copyright (c) 2014 fireup. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <objc/message.h>

static void display(id self, SEL _cmd)
{
    NSLog(@"Invoking method with selector %@ on %@ instance", NSStringFromSelector(_cmd), [self className]);
}

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Class WidgetClass = objc_allocateClassPair([NSObject class], "Widget", 0);
        
        const char *types = "v@:";
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
        class_addMethod(WidgetClass, @selector(display), (IMP)display, types);
#pragma clang diagnostic pop
        
        const char *height = "height";
        class_addIvar(WidgetClass, height, sizeof(id), rint(log2(sizeof(id))), @encode(id));
        
        objc_registerClassPair(WidgetClass);
        
        id widget = [[WidgetClass alloc] init];
        
        id value = [NSNumber numberWithInt:15];
        [widget setValue:value forKey:[NSString stringWithUTF8String:height]];
        
        objc_msgSend(widget, NSSelectorFromString(@"display"));
        
        NSNumber *width = [NSNumber numberWithInt:10];
        objc_setAssociatedObject(widget, @"width", width, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
        id result = objc_getAssociatedObject(widget, @"width");
        NSLog(@"Widget instance width = %@", result);
        
    }
    return 0;
}

