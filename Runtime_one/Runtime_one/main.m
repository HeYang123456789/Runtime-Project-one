//
//  main.m
//  Runtime_one
//
//  Created by HEYANG on 16/1/12.
//  Copyright © 2016年 HEYANG. All rights reserved.
//

/**
 *
 *  Swap Method and Dynamic add Method (交换方法和动态添加方法)
 *
 */


#import <Foundation/Foundation.h>

//ignore undeclared warm 忽视未声明的警告
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //get this Person class 拿到了这个Person类
        Class clazz = NSClassFromString(@"Person");
        //get this Person Instance 拿到这个Person实例
        id person = [[clazz alloc] init];
        
        //send message to 'eat' method in Person Class or Person Instance
        //发送消息给Person类或者Person实例的‘eat’方法 不含参数
        [person performSelector:@selector(eat) withObject:nil];
        //发送消息给Person类的‘eat’方法 含两个参数
        [clazz performSelector:@selector(eat:with:) withObject:@"Hello" withObject:@"World"];
    }
    return 0;
}

#pragma clang diagnostic pop