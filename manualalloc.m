//
//  main.m
//  class3
//
//  Created by 吴泽斌 on 2021/7/8.
//

#import <Foundation/Foundation.h>

@interface GreetingClass:NSObject
-(void)sayhello;
@end

@implementation GreetingClass

-(void)sayhello{
    NSLog(@"hello, Object-c!");
}
-(void)dealloc{
    NSLog(@"deallocated");
    [super dealloc];
}

@end

//手动释放，删除autoreleasepool，complier sources 改.m文件为-fno-objc-arc
//使用autoreleasepool自动引用计数则不需要release和retain，，不需要时对象设为nil，将释放自动调用类的dealloc，释放内存
int main(int argc, const char * argv[]) {
    GreetingClass *greet=[[GreetingClass alloc]init];
    [greet sayhello];
    // 对象保留计数值，值为0则内存被回收
    NSLog(@"greet.retaincount=%lu",(unsigned long)[greet retainCount]);
    //保留消息，使对象保留计数+1
    [greet retain];
    NSLog(@"greet.retaincount（after retain）=%lu",(unsigned long)[greet retainCount]);
    //释放消息，使对象保留计数-1
    [greet release];
    NSLog(@"greet.retaincount（after release）=%lu",(unsigned long)[greet retainCount]);
    [greet release];//此时计数为0；
    NSLog(@">>> dealloc methods will be called");
    //避免出现野指针，设为空
    greet=nil;
    return 0;
}
