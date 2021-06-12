//
//  main.m
//  URLDemo
//
//  Created by apple on 2021/6/12.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSURL *baseURL=[NSURL URLWithString:@"file:///user/library/apache/"];
        NSURL *fileURL=[NSURL URLWithString:@"root/index.html" relativeToURL:baseURL];//在base下的相对路径
        NSURL *absoluteURL=[fileURL absoluteURL];//结果为"file:///user/library/apache/root/index.html"
        NSLog(@"绝对路径=%@",absoluteURL);
        
        NSURL *URL=[NSURL URLWithString:@"https://www.baidu.com/s?from=1019023b&bd_page_type=1&word=fport"];
        NSLog(@"scheme:%@",[URL scheme]);//输出：https
        NSLog(@"%@",[URL resourceSpecifier]);// 输出//www.baidu.com（http后半部分）会验证是否存在
        NSLog(@"%@",[URL host]);//www.baidu.com
        NSLog(@"%@",[URL port]);//端口，url写了就提取出来
        NSLog(@"%@",[URL path]);
        NSLog(@"%@",[URL pathComponents]);//拆分成数组
        
    }
    return 0;
}
