//
//  main.m
//  NumberDemo
//
//  Created by apple on 2021/6/6.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        NSNumber *boolnum=[NSNumber numberWithBool:YES];
//        NSNumber *charnum=[NSNumber numberWithChar:'A'];
//        NSNumber *intnum=[NSNumber numberWithInt:1];
//        NSNumber *floatnum=[NSNumber numberWithFloat:2.718];
//        NSNumber *doublenum=[NSNumber numberWithDouble:3.14159];
//
//        BOOL boolvalue=[boolnum boolValue];
//        char charvalue=[charnum charValue];
//        int intvalue=[intnum intValue];
//        float floatvalue=[floatnum floatValue];
//        double doublevalue=[doublenum doubleValue];
//
//        NSLog(@"\nboolvalue:%d\nintvalue:%d\ncharvalue:%c\nfloatvalue:%f\ndoublevalue:%f",boolvalue,intvalue,charvalue,floatvalue,doublevalue);
        
//        NSString *greet=@"hello";
//        NSLog(@"%@",greet);
//
//        NSString *sayhello=[[NSString alloc]initWithFormat:@"%@,Objective-C",greet];
//        NSLog(@"%@",sayhello);
//
        int count=10;
        NSString *tip=[[NSString alloc]initWithFormat:@"You get %d stars",count];
        NSLog(@"%@",tip);
//
//        NSLog(@"tip.lowercaseString=%@\n",[tip lowercaseString]);//全转为小写 不改变字符串本身
//        NSLog(@"tip.capitalizedString=%@\n",[tip capitalizedString]);//转为单词首字母大写 不改变字符串本身
//        NSLog(@"tip.hasPerfix=%d\n",[tip hasPrefix:@"You"]);//判断字符串头是否为You
//        NSLog(@"tip.hasSuffix=%d\n",[tip hasSuffix:@"You"]);//判断字符串尾是否为you
//        NSLog(@"tip.containsString=%d\n",[tip containsString:@"star"]);//判断是否字符串有star
//        NSLog(@"tip.length=%lu\n",(unsigned long)[tip length]);
//
//        NSString *score=@"80";
//        NSLog(@"score=%d\n",[score intValue]);//转int，还有float等等方法
//
//        NSLog(@"tip is equal to you get 10 stars=%d\n",[tip isEqualToString:@"You get 10 stars"]);//判断相等
        
        NSRange range = [tip rangeOfString:@"star"];//范围对象，查找star位置，包含位置和所查单词长度，0开始计数
        NSLog(@"range.location=%lu\n",(unsigned long)range.location);
        NSLog(@"range.length=%lu\n",(unsigned long)range.length);
        
        //NSMutableString *m =[NSMutableString stringWithCapacity:40];//40大小可变字符串,可多次赋值不新开辟空间
        NSMutableString *m2 =[[NSMutableString alloc] initWithString:@"this is"];
        [m2 appendString:@" MutableString"];
        [m2 insertString:@"a " atIndex:8];//从0开始第八个的位置插入a
        NSLog(@"%@",m2);
    }
    return 0;
}
