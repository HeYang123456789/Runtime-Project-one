//
//  Created by HEYANG on 16/1/11.
//  Copyright © 2016年 HEYANG. All rights reserved.
//

#import "OtherPerson.h"
#import <objc/message.h>

@implementation OtherPerson


+(void)load{
    Class clazz = NSClassFromString(@"Person");
    
    //获取替换前的类方法
    Method instance_eat = class_getClassMethod(clazz, @selector(resolveInstanceMethod:));
    //获取替换后的类方法
    Method instance_notEat = class_getClassMethod(self, @selector(hy_resolveInstanceMethod:));
    
    //然后交换类方法
    method_exchangeImplementations(instance_eat, instance_notEat);
    
    //获取替换前的类方法
    Method class_eat = class_getClassMethod(clazz, @selector(resolveClassMethod:));
    //获取替换后的类方法
    Method class_notEat = class_getClassMethod(self, @selector(hy2_resolveClassMethod:));
    
    //然后交换类方法
    method_exchangeImplementations(class_eat, class_notEat);
    
}

void eat_1(id self,SEL sel)
{
    NSLog(@"到底吃不吃饭了");
    NSLog(@"%@ %@",self,NSStringFromSelector(sel));
}
void eat_2(id self,SEL sel)
{
    NSLog(@"到底吃不吃饭了");
    NSLog(@"%@ %@",self,NSStringFromSelector(sel));
}


+(BOOL)hy_resolveInstanceMethod:(SEL)sel{
    //当sel为实现方法中 有 eat 方法
    if (sel == NSSelectorFromString(@"eat")) {
        //就 动态添加eat方法
        
        // 第一个参数：给哪个类添加方法
        // 第二个参数：添加方法的方法编号
        // 第三个参数：添加方法的函数实现（函数地址）
        // 第四个参数：函数的类型，(返回值+参数类型) v:void @:对象->self :表示SEL->_cmd
        class_addMethod(self, sel, (IMP)eat_1, "v@:");
    }
    return YES;
}
+(BOOL)hy2_resolveClassMethod:(SEL)sel{
    
    if (sel == NSSelectorFromString(@"eat")) {
        
        class_addMethod(objc_getMetaClass("Person"), sel, (IMP)eat_2, "v#:");
    }
    
    return YES;
}

@end



