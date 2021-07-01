//
//  main.m
//  Class
//
//  Created by apple on 2021/7/1.
//

#import <Foundation/Foundation.h>
#import "classheader.h"
//:后是父类，NSObject是所有类的父类，负责内存分配、初始化
//成员变量是私有的
@interface Car : NSObject{
    NSString *brand; //品牌
    NSString *series; //系列
    float price;//价格
}
@property(nonatomic,readwrite) float price; //将price转化为可读写的属性,省略了setter与getter。nonatomic 非原子性操作，线程不安全
@property(nonatomic,copy)NSString *series;//以copy方式赋值
-(void)drive; //-为对象方法，+为类方法（即c++静态方法）
@end//end结束接口

@implementation Car
@synthesize series;
@synthesize price;// 与property配合使用
//初始化方法
-(id)init{
    self=[super init];// 调用NSObject的init
    brand=@"BMW";
    series=@"X7";
    return self;
}
-(void)drive{
    NSLog(@"%@-%@,launch...",brand,series);
}
@end

//Animalsofzoo 别名 Animal
typedef unsigned int uint;// 定义新名称
struct Animal{
    NSString *name;
    int age;
    float weight;
};

@interface Math: NSObject
-(int)getBigger:(int)num1 andnum2:(int)num2;//andnum2为参数签名，说明参数含义用
-(void)swapParams:(int)num1 andnum2:(int)num2;
-(void)swapNums:(int*)num1 andnum2:(int*)num2;
+(int)getSmaller:(int)num1 andnum2:(int)num2;//类方法（静态方法）,不需要属性时可以使用类方法
@end

@implementation Math

-(int)getBigger:(int)num1 andnum2:(int)num2{
    return num1>num2?num1:num2;
}

-(void)swapParams:(int)num1 andnum2:(int)num2{
    int tmp=num1;
    num1=num2;
    num2=tmp;
}

-(void)swapNums:(int*)num1 andnum2:(int*)num2{
    int tmp=*num1;
    *num1=*num2;
    *num2=tmp;
}

+(int)getSmaller:(int)num1 andnum2:(int)num2{
    return num1<num2?num1:num2;
}
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        struct Animal dog;//使用结构体需要加struct,typedef别名就不用了
        dog.age=4;
        dog.name=@"dog";
        dog.weight= 43.2;
        
        Car *bmw1=[[Car alloc]init];//初始化先
        bmw1.price=72938.9;//只能給属性的赋值
        Car *bmw2=[[Car alloc]init];
        bmw2.series=@"X5";
        bmw2.price=60700.0;
        [bmw1 drive];
        [bmw2 drive];
        
        int result=[Math getSmaller:12 andnum2:15];
        NSLog(@"smaller:%d",result);
        Math *math=[[Math alloc] init];//类方法分配空间
        int res=[math getBigger:12 andnum2:15];// 标签用处
        NSLog(@"biger:%d",res);
        
        int num1=1,num2=2;
        [math swapParams:num1 andnum2:num2];//值传递不改变
        NSLog(@"num1=%d,num2=%d",num1,num2);
        [math swapNums:&num1 andnum2:&num2];//指针传递改变
        NSLog(@"num1=%d,num2=%d",num1,num2);
    }
    return 0;
}
