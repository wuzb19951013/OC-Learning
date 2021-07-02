//
//  main.m
//  Class
//
//  Created by apple on 2021/7/1.
//

#import <Foundation/Foundation.h>
#import "classheader.h"
//封装 变量默认私有
//函数默认公有，区分类函数和对象函数,可用于封装,推荐进行封装
@interface Banker : NSObject{
    int totalSavingsDeposits;
}
-(id)initWithNum:(int)num;
-(void)addnum:(int)num;
-(void)subnum:(int)num;
-(NSString *)getTotalSavingsDeposits:(NSString*)password;
@end

@implementation Banker

-(id)initWithNum:(int)num{
    totalSavingsDeposits=num;
    return self;
}
-(void)addnum:(int)num{
    totalSavingsDeposits+=num;
}
-(void)subnum:(int)num{
    totalSavingsDeposits-=num;
}
-(NSString *)getTotalSavingsDeposits:(NSString*)password{
    if([password isEqualToString:@"123456"])
        return [NSString stringWithFormat:@"%d",totalSavingsDeposits];
    else
        return @"you don't have permission to query";
}
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
       Banker *bank =[[Banker alloc]initWithNum:0];
        [bank addnum:10];
        [bank subnum:6];

        NSLog(@"result1=%@",[bank getTotalSavingsDeposits:@"111111"]);
        NSLog(@"result1=%@",[bank getTotalSavingsDeposits:@"123456"]);
        
    }
    return 0;
}
