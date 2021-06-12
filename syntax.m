//
//  main.m
//  DemoProject
//
//  Created by apple on 2021/5/23.
//  异或^，取反～

#import <Foundation/Foundation.h>
#define PI 3.1415
@interface BaseClass : NSObject
-(void)sayhello;
@end

@implementation BaseClass
-(void)sayhello{
    NSString *greeting=@"Hello, \
    \tmy friend Objective-C\n";
    NSString *greeting2=@"Hello," "my love";
    NSLog(@"%@,%@",greeting,greeting2);
    NSArray *week=[[NSArray alloc]initWithObjects:@"Mon",@"Tue",@"Wed",@"Thu",@"Fri",@"Sat",@"Sun", nil];
 
    NSArray *animal=@[@"cat",@"dog"];
    NSArray *fruit=@[@"apple",@"pear"];
    NSArray *compositeArray=@[animal,fruit];
    
    for(int i=0;i<compositeArray.count;i++){
        NSArray *tmp = compositeArray[i];
        for(NSString *elem in tmp){
            NSLog(@"element:%@",elem);
        }//枚举方式
    }
    
        

    [week enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"%zi-->%@",idx,obj);
    }];//闭包进行枚举
    
    NSEnumerator *en=[week objectEnumerator];//数组对象自带属性，变为枚举器
    id element;
    int j=0;
    while(element=[en nextObject]){
        NSLog(@"%d->%@",j,element);
        j++;
    }
    
}
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        const int age=017;//8进制 4字节（字符1字节）与win10一致 //const不可赋值
        short temperature=0x3F;//16进制,2字节
        BOOL isFinish =YES;//正确1，错误0；
        long distance=2147483640; //8字节
//        NSLog(@"the storage size for char:%lu,\n",sizeof(char));
//        NSLog(@"the storage size for int:%lu,\n",sizeof(age));
        NSLog(@"the age is:%o,\n",age);
        NSLog(@"the temperature is:%X,\n",temperature);//大小写x区分a-f字母
//        NSLog(@"the storage size for short:%lu,\n",sizeof(temperature));
        NSLog(@"the storage size for long:%lu,\n",sizeof(distance));
//        NSLog(@"the storage size for long double:%lu,\n",sizeof(long double));//16字节
//        NSLog(@"the storage size for double:%lu,\n",sizeof(double));
//        NSLog(@"the storage size for float:%lu,\n",sizeof(float));
//
        BaseClass *sample = [[BaseClass alloc]init];
        [sample sayhello];
//        NSLog(@"isFinish:%d",isFinish);
    }
    return 0;
}
