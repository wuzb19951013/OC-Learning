//
//  main.m
//  Class
//
//  Created by apple on 2021/7/1.
//

#import <Foundation/Foundation.h>
#import "classheader.h"

//Animalsofzoo 别名 Animal
typedef unsigned int uint;// 定义新名称
typedef struct Animalsofzoo{
    NSString *name;
    int age;
    float weight;
}Animal;

#define MATH_PI 3.1415
#undef BASE_URL  //取消原有定义
#define BASE_URL @"http://www.github.com"

#ifndef BASE_URL
    #define BASE_URL @"http://www.github.com"
#endif

#define tokenpaster(t) NSLog(@"mytoken " #t " =%d ", mytoken##t )//##变量连接符，t=2,后一个变量为mytoken2
#define getbigger(A,B) A>B?A:B

// \ 用于换行,宏定义函数
#define title_for(courseA,courseB) \
NSLog(@"get " #courseA " and " #courseA )
//只在debug下打印日志，预处理，不进入release编译任务
#if DEBUG==0
    #define debuglog(...)
#elif DEBUG==1
    #define debuglog(...) NSLog(__VA_ARGS__)//与NSLog功能相同
#endif

int main(int argc, const char * argv[]) {
    @autoreleasepool {
       title_for(xcode, objective-c);
        int mytoken2=10;
        tokenpaster(2);
        NSLog(@"mytoken 2 =%d ", mytoken2 );//与宏定义函数一致
        NSLog(@"the bigger is %d", getbigger(123, 132) );//与宏定义函数一致
        debuglog(@"debuglog");
        NSLog(@"NSLog");
        debuglog(@"file path: %s",__FILE__);
        debuglog(@"line num: %d",__LINE__);
        debuglog(@"date: %s",__DATE__);
        debuglog(@"time: %s",__TIME__);
        
        uint num1=1;
        debuglog(@"num1=%d",num1);
        Animal animal;
        animal.age=4;
        animal.name=@"dog";
        animal.weight= 43.2;
        debuglog(@"age=%d",animal.age);
    }
    return 0;
}
