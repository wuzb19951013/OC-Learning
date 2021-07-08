//
//  main.m
//  class3
//
//  Created by 吴泽斌 on 2021/7/8.
//

#import <Foundation/Foundation.h>
// 协议protocal用于声明，类似接口，可在符合协议的类中实现
// 键盘隐藏、显示
@protocol KeyboardInspectorDelegate
-(void)doWhenkeyboardWillHide;
@end
//表单检查
@interface FormChecker : NSObject{
    id delegate;
}
-(void) setDelegate:(id)newDelegate;
-(void) validateForm;
@end

@implementation FormChecker
-(void) setDelegate:(id)newDelegate{
    delegate=newDelegate;
}
-(void) validateForm{
    NSLog(@"validating form...");
    [delegate doWhenkeyboardWillHide];
}
@end

@interface controllerClass : NSObject<KeyboardInspectorDelegate>
-(void) enterform;
@end

@implementation controllerClass

-(void) enterform{
    FormChecker *checker =[[FormChecker alloc]init];
    [checker setDelegate:self];//由controllerClass对象实现协议方法
    [checker validateForm];
}

-(void)doWhenkeyboardWillHide{
    NSLog(@"enter next page");
}
@end
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        controllerClass *contr=[[controllerClass alloc]init];
        [contr enterform];// 先输出验证表单，后输出协议方法
    }
    return 0;
}
