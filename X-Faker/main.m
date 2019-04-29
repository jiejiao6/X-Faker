//
//  main.m
//  X-Faker
//
//  Created by whois on 2018/12/15.
//  Copyright © 2018年 whois. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <dlfcn.h>

#import <mach/mach.h>
#import <mach-o/loader.h>
#import <mach-o/dyld.h>

void callBirdFaker(){
    NSString * dylibName = @"libBirdFaker";
    NSString * path = [[NSBundle mainBundle] pathForResource:dylibName ofType:@"dylib"];
    if (dlopen(path.UTF8String, RTLD_NOW) == NULL){
        NSLog(@"dlopen failed ，error %s", dlerror());
        return ;
    };
    
    uint32_t dylib_count = _dyld_image_count();
    uint64_t slide = 0;
    for (int i = 0; i < dylib_count; i ++) {
        const char * name = _dyld_get_image_name(i);
        if ([[NSString stringWithUTF8String:name] isEqualToString:path]) {
            slide = _dyld_get_image_vmaddr_slide(i);
        }
    }
    assert(slide != 0);
}
int main(int argc, char * argv[]) {
    @autoreleasepool {
//        if (setuid(0)) {
//            exit(1);
//        }
        callBirdFaker();
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
