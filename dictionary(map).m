//
//  main.m
//  Dictionary
//
//  Created by apple on 2021/6/14.
//

#import <Foundation/Foundation.h>
//dictionary 类似 Map


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSDictionary *cat=[NSDictionary dictionaryWithObject:@"Kitty" forKey:@"name"];//kitty value;name key
        NSDictionary *dog=[NSDictionary dictionaryWithObjectsAndKeys:@"Teddy",@"name",@"2",@"age",@"10",@"weight", nil];
        
        NSArray *objects = [NSArray arrayWithObjects:@"Peter",@"Swim",@"Tiger", nil];
        NSArray *keys = [NSArray arrayWithObjects:@"name",@"hobby",@"pet", nil];
        NSDictionary *master=[NSDictionary dictionaryWithObject:objects forKey:keys];//用数组初始化，但要数量相同，且一一对应
        NSLog(@"%@",master);
        
        NSArray *allkeys=[dog allKeys];
        NSArray *allvalues=[dog allValues];
        unsigned long count =[dog count];
        NSLog(@"%@\n%@\n%lu",allkeys,allvalues,count);//两数组分别存储所有key和所有value
        
        NSString *name=[cat objectForKey:@"name"];//没有返回nil
        NSString *name2=[cat valueForKey:@"name"];
        NSLog(@"%@\n%@",name,name2);//输出一致
        
        //遍历
        for(id k in master){
            NSLog(@"%@=%@",k,[master objectForKey:k]);//(name,hobby,pet)=(Peter,Swim,Tiger)
        }
        
        //遍历2,枚举器（迭代器）
        NSEnumerator *enume=[master keyEnumerator];
        id Key = [enume nextObject];
        while(Key){
            NSLog(@"%@=%@",Key,[master objectForKey:Key]);
            Key = [enume nextObject];
        }//结果一致
        
        [master enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            NSLog(@"%@=%@",key,obj);
        }];//结果一致

        //可变字典
        NSMutableDictionary *book =[NSMutableDictionary dictionaryWithObject:@"ios" forKey:@"title"];
        [book setValue:@"Wu" forKey:@"Author"];//添加键值
        [book setValue:@"Wu" forKey:@"Publisher"];
        NSLog(@"%@",book);
        
        //[book removeObjectForKey:@"Author"];
        [book removeObjectsForKeys:@[@"Author",@"title"]];
        NSLog(@"%@",book);
        [book removeAllObjects];
        NSLog(@"%@",book);//输出了{}
        
    }
    return 0;
}
