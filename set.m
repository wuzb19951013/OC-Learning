//
//  main.m
//  NSSet
//
//  Created by apple on 2021/6/20.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
//        NSSet* animal=[NSSet setWithObjects:@"cat",@"dog",@"pig",@"dog",@"horse", nil];
//        NSLog(@"%@",animal);//去重复
//
//        NSLog(@"%@",[animal anyObject]);
//        NSLog(@"count=%lu",(unsigned long)animal.count);
//        NSLog(@"containdog=%d",[animal containsObject:@"dog"]);//判断是否存在
//
//        NSSet* animal2=[animal setByAddingObject:@"tiger"];//不可变所以只能给另一个集合
//        NSLog(@"isSubset=%d",[animal isSubsetOfSet:animal2]);//判断是否属于另一个集合
//
//        //枚举
//        NSEnumerator *enume=[animal objectEnumerator];
//        NSString* elem;
//        while(elem=[enume nextObject]){
//            NSLog(@"%@",elem);
//        }//结果分别输出的
        
        NSMutableSet* set1=[[NSMutableSet alloc]initWithObjects:@"1",@"2",@"3", nil];
        NSMutableSet* set2=[[NSMutableSet alloc]initWithObjects:@"4",@"2",@"3", nil];
        [set1 unionSet:set2];//1，2，3，4并集,放入集合1
//        [set1 intersectSet:set2];//2，3交集,放入集合1
//        [set1 minusSet:set2];//1，set1中移除set2中的元素
//        [set1 removeObject:@"2"];//1,3
//        [set1 removeAllObjects];
        NSLog(@"%@",set1);
        
        //数组去重复
        NSMutableArray *array=[[NSMutableArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5",@"3", nil];
        NSSet *set=[[NSSet alloc]initWithArray:array];
        array=[NSMutableArray arrayWithArray:[set allObjects]];
        NSLog(@"%@",array);

    }
    return 0;
}
