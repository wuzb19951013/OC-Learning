//
//  main.m
//  Class
//
//  Created by apple on 2021/7/1.
//

#import <Foundation/Foundation.h>
#import "classheader.h"

//闭包
void (^firstblock)(void)=^{
    NSLog(@"first block");
};//需要；

int (^getbigger)(int,int)=^(int num1,int num2){
    int res=num1>num2?num1:num2;
    NSLog(@"bigger is %d",res);
    return res;
};

typedef void (^responseBlock)(NSString *response);//定义新闭包,可作为数值传递给函数
@interface requestAPIClass : NSObject
-(void)requestAPIwithBlock:(NSString *)url andBlock:(responseBlock)completionBlock;//模拟网络请求
@end

@implementation requestAPIClass

-(void)requestAPIwithBlock:(NSString *)url andBlock:(responseBlock)completionBlock{
    NSLog(@"Request %@...",url);
    NSString *response=@"A list of OC tutorials";
    completionBlock(response);//向闭包传字符串
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        firstblock();//使用与c++函数相同
        getbigger(2,4);
        requestAPIClass *request =[[requestAPIClass alloc] init];
        [request requestAPIwithBlock:@"www.baidu.com" andBlock:^(NSString *response){
            NSLog(@"response from server:%@",response);
        }];//函数调用闭包,lambda
    }
    return 0;
}
