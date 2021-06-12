//
//  main.m
//  DateDemo
//
//  Created by apple on 2021/6/12.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSDate *curDate = [NSDate date];//Sat Jun 12 13:10:23 2021
        NSLog(@"curDate=%@", curDate);
        
        NSDate *secondDate = [NSDate dateWithTimeInterval:3600 sinceDate:curDate];
        NSDate *thirdDate = [NSDate dateWithTimeIntervalSinceNow:-3600];
        NSLog(@"2Date=%@\n3Date=%@", secondDate,thirdDate);
        
        NSLog(@"isEqualtoDate=%d",[curDate isEqualToDate:curDate]);
        NSLog(@"isGreaterThan=%d",[curDate isGreaterThan:curDate]);
        
        NSComparisonResult comparison=[curDate compare:thirdDate];//比与1970间隔大小，大于为1，小于为-1，等于为0
        NSLog(@"result=%ld",(long)comparison);
        
        NSDateFormatter *format=[[NSDateFormatter alloc] init];//因为没有对象名所以alloc开辟空间么？
        [format setDateStyle:NSDateFormatterFullStyle];//2021年6月12日 星期六
//        [format setTimeStyle:NSDateFormatterMediumStyle];//下午1:30:56
//        [format setDateFormat:@"yyyy-MM-dd HH:mm:ss"];//2021-06-12 13:34:22 //21-06-12 13:34:52
        
//        NSString *curDateStr=[format stringFromDate:curDate];//日期转字符，使用时formatter一定要有格式
//        NSLog(@"%@", curDateStr);

        NSString *DateStr = @"2021-06-12 13:34:22";
        NSDate *date = [format dateFromString:DateStr];//字符转日期，formatter多次使用变null
        NSLog(@"date=%@", date);
    }
    return 0;
}
