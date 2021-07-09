//
//  main.m
//  class3
//
//  Created by 吴泽斌 on 2021/7/8.
//

#import <Foundation/Foundation.h>
// 错误类，根据newId 返回字符串
char* requestNewByID(int newId,NSError** errorPt){
    if(newId==1){
        return "no news is good news";
    }else{
        NSString *domain=@"com.cooketang.ErrorNewsID";//错误域
        NSString *message=@"Fail to requestNEws";//错误代码，NSError 类似字典将两者联系
        NSDictionary *userInfo=[[NSDictionary alloc]initWithObjectsAndKeys:message,@"NSLocalizedDescriptionKey", nil];
        *errorPt=[NSError errorWithDomain:domain code:404 userInfo:userInfo];
        return "";
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSError *error=nil;
#if 1
        char* news1=requestNewByID(1,&error);
#elif 0
        char* news1=requestNewByID(2,&error);
#endif

        if(error){
            // 不为空则，有错误信息
            NSLog(@"Error:%@",error);
        }else{
            //为空则正确信息
            NSLog(@"Error:%s",news1);
        }
        
        NSString *website = @"coolketang.com";
        char character;
        @try{
#if 1
            character=[website characterAtIndex:4];
#elif 0
            character=[website characterAtIndex:40];
#endif
            NSLog(@"char=%c",character);
        }@catch(NSException *e){//异常类
            NSLog(@"e.name=%@",e.name);
            NSLog(@"e.reason=%@",e.reason);
        }
        @finally{//无论是否错误皆执行
            NSLog(@"char=%c",character);//异常时只能输出char=
            NSLog(@"the finally statement.");
        }
    }
    return 0;
}
