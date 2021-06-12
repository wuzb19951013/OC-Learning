//
//  main.m
//  ArrayDemo
//
//  Created by apple on 2021/6/12.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
//        double distance[5];
//        BOOL arrayBOOL[]={YES,NO,YES,YES,NO};
        
        NSArray *array =[[NSArray alloc] initWithObjects:@"apple", @"banana",@"pear",nil];
        NSArray *fruit1 =[NSArray arrayWithObjects:@"apple", @"banana",@"pear",nil];
        NSArray *fruit2 =[[NSArray alloc] initWithArray:fruit1];//深拷贝
        NSArray *fruit3 =[NSArray arrayWithArray:fruit2];//内存自动释放的深拷贝
        NSArray *fruit4 =[fruit3 arrayByAddingObject:@"orange"];//附加元素,浅
        
        NSLog(@"fruit4=%@",fruit4);//输出：fruit4=(    apple,      banana,   pear,        orange   )
        
        NSRange range=NSMakeRange(0, 3);// 从第1个元素开始3个
        NSArray *fruit5=[fruit4 subarrayWithRange:range];
        NSLog(@"fruit5=%@",fruit5);
        
        NSArray *fruit = @[@"apple", @"banana",@"pear"];//赋值初始化 ObjectAtIndex 从0开始计数
        NSLog(@"count=%ld",[fruit count]);
        
        NSLog(@"%d,%ld", [array containsObject:@"pear"],[array indexOfObject:@"apple"]);//1,0表示是，否有；index从0开始
        
        [fruit4 enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSLog(@"%zi-->%@",idx,obj);
        }];//闭包进行枚举
        
        [fruit5 enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop){
            NSLog(@"%zi-->%@",idx,obj);
        }];//反向枚举 输出2-->pear 1-->banana 0-->apple
        
        //字符串转数组
        NSString *animalstr=@"cat,dog,horse,tiger";
        NSArray *animal=[animalstr componentsSeparatedByString:@","];//封装的分词方法。
        NSLog(@"animals=%@",animal);
        
        NSString *animalstr2=[animal componentsJoinedByString:@">"];//用>连接
        NSLog(@"%@",animalstr2);
        
    }
    return 0;
}
