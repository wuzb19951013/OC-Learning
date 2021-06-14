//
//  main.m
//  sort
//
//  Created by apple on 2021/6/13.
//

#import <Foundation/Foundation.h>

//id表示为定义类型变量
NSInteger sortInt(id num1,id num2,void *context)
{
    int number1=[num1 intValue];
    int number2=[num2 intValue];
    
    if(*(BOOL *)context==YES){//第三个参数为真则升序
        if(number1>number2){
            return NSOrderedDescending;//代表降序标记枚举值，=1
        }else if(number1<number2){
            return NSOrderedAscending;//=-1
        }else{
            return NSOrderedSame;//=0
        }
    }else{//反之降序
        if(number1>number2){
            return NSOrderedAscending;//代表降序标记枚举值，=1
        }else if(number1<number2){
            return NSOrderedDescending;//=-1
        }else{
            return NSOrderedSame;//=0
        }
    }
}

NSInteger sortStr(id str1,id str2,void *context){
    if(*(BOOL *)context==YES){//第三个参数为真则升序
        return [str1 localizedCaseInsensitiveCompare:str2];
    }
    return [str2 localizedCaseInsensitiveCompare:str1];//反之为降序
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//         insert code here...
        NSArray *numbers=@[@4,@8,@6,@1,@15,@7,@9];
        BOOL orderUP=NO;
        NSArray *sortNums=[numbers sortedArrayUsingFunction:sortInt context:&orderUP];
        NSLog(@"%@",sortNums);
        
        NSArray *strs=@[@"Micro",@"Face",@"apple",@"IBM"];
        BOOL orderUp=NO;
        NSArray *sortStrs=[strs sortedArrayUsingFunction:sortStr context:&orderUp];
        NSLog(@"%@",sortStrs);
    }
    return 0;
}
