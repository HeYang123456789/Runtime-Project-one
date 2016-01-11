
#import <Foundation/Foundation.h>

#import <objc/message.h>

#pragma clang diagnostic push
//取消undeclared警告取消
#pragma clang diagnostic ignored "-Wundeclared-selector"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Class clazz = NSClassFromString(@"Person");//拿到了这个类
        id c = [[clazz alloc] init];//拿到这个类创建的对象
        
        [c performSelector:@selector(eat) withObject:nil];
        
    }
    return 0;
}

#pragma clang diagnostic pop




