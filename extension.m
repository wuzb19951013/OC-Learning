//
//  main.m
//  class3
//
//  Created by 吴泽斌 on 2021/7/8.
//

#import <Foundation/Foundation.h>
//向现有类添加新方法，类别
@interface NSNumber (MyAdditions)
-(NSNumber *)triple;//给系统类新方法，使数值*3
@end

@implementation NSNumber (MyAdditions)
-(NSNumber *)triple{
    double result=[self doubleValue]*3;
    return [NSNumber numberWithDouble:result];
}
@end

//扩展，必须是自己编源代码的类才可添加，方法和属性无法被继承类访问,只能是私有的
@interface  MathClass: NSObject
+(int)getdouble:(int)num;
@end

//扩展写法
@interface MathClass()
+(int)gettriple:(int)num;
@end

@implementation MathClass

+(int)getdouble:(int)num{
    return num*2;
}
+(int)gettriple:(int)num{
    return num*3;
}

@end
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSNumber *num =[NSNumber numberWithDouble:2.3];
        NSNumber *res=[num triple];//类别的调用方式两者皆可
        NSLog(@"res=%.1f",res.doubleValue);
        res=res.triple;
        NSLog(@"res=%.1f",res.doubleValue);
        
        int result=[MathClass getdouble:1];
        NSLog(@"result=%d",result);
        result=[MathClass gettriple:1];
        NSLog(@"result=%d",result);
    }
    return 0;
}
