//
//  main.m
//  Class
//
//  Created by apple on 2021/7/1.
//

#import <Foundation/Foundation.h>
#import "classheader.h"

//基类
@interface Animal : NSObject{
    NSString *name;
}
//方法是运行时动态绑定的，而不是编译时
-(void)say;
-(void)moveTo:(NSString *)destination;
-(id)initWithName:(NSString *)name;
@end

@implementation Animal

-(id)initWithName:(NSString *)animalname{
    name=animalname;
    return self;
}
-(void)moveTo:(NSString *)destination{
    NSLog(@"%@ moves to %@",name,destination);
}
-(void)say{
    NSLog(@"I am %@",name);
}
@end

//子类
@interface Tiger : Animal{
    float weight;
}
-(void)hunt;
-(void)moveTo:(NSString *)destination;
-(id)initWithName:(NSString *)animalname andweight:(float)animalWeight;
@end

@implementation Tiger
-(void)moveTo:(NSString *)destination{
    NSLog(@"%@ jumps to %@",name,destination);
}
-(id)initWithName:(NSString *)animalname andweight:(float)animalWeight{
    name=animalname;
    weight=animalWeight;
    return self;
}
-(void)hunt{
    NSLog(@"%@ whose weight is %.1f is hunting",name,weight);
}
@end

@interface Bird: Animal
-(void)moveTo:(NSString *)destination;
@end

@implementation Bird
-(void)moveTo:(NSString *)destination{
    NSLog(@"%@ flies to %@",name,destination);
}
@end
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Animal *animal =[[Animal alloc]initWithName:@"Brain"];
        [animal say];
        Tiger *tiger = [[Tiger alloc]initWithName:@"will" andweight:98.32];
        [tiger say];
        [tiger hunt];
        [tiger moveTo:@"the cave"];
        Bird *bird =[[Bird alloc]initWithName:@"Dove"];
        [bird moveTo:@"the nest"];//移动方法重写
        
        NSArray *animalArray=[[NSArray alloc]initWithObjects:tiger,bird, nil];
        //id可以是任意类型，类似auto
        //动态绑定下，也能分清调用的不同方法。
        id animal1=[animalArray objectAtIndex:0];
        [animal1 moveTo:@"its home"];
        id animal2=[animalArray objectAtIndex:1];
        [animal2 moveTo:@"its home"];
    }
    return 0;
}
