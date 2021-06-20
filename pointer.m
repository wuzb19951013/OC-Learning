//
//  main.m
//  Pointer
//
//  Created by apple on 2021/6/20.
//

#import <Foundation/Foundation.h>

//指针参数，便于修改，c++引用相关
@interface halfclass : NSObject
-(void)gethalf:(int *)pointer;
@end

@implementation halfclass
-(void)gethalf:(int *)pointer{
    *pointer/=2;
    //*pointer=*pointer/2;//效果一致
    return;
}
@end

@interface randomclass : NSObject
-(int *) getrandomNums;
@end

@implementation randomclass
-(int *)getrandomNums{
    static int random[5];
    srand((unsigned)time(NULL));//随机种子，避免随机数相同
    for (int i=0; i<5; ++i) {
        random[i]=rand();
        NSLog(@"%d\n",random[i]);
    }
    return random;
}
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        double *dpointer;
        NSLog(@"%d",(int)sizeof(dpointer));//所以指针占8个字节，十六进制表示
        int star=10;
        int *spointer=&star;
        NSLog(@"address:%x\n",&star);
        NSLog(@"address:%x\n",spointer);//与&star一致
        NSLog(@"address:%d\n",*spointer);
        
        //指针遍历
        int num[]={1,2,3,4};
        int index,*n_p;
        n_p=num;//指向第一个元素内存
        for(index=0;index<4;index++,n_p++){
            NSLog(@"the address of num[%d]=%x, the value of num[%d]=%d\n",index,n_p,index,*n_p);
        }// 指针+1移动存储类型的长度，此时指针越界
        n_p-=1;
        while (n_p>=&num[0]) {
            NSLog(@"the address of num[%d]=%x, the value of num[%d]=%d\n",index,n_p,index,*n_p);
            index--;
            n_p--;
        }
        
        //数组存放指针
        int *ns_p[4];
        for(int index=0;index<4;index++){
            ns_p[index]=&num[index];
        }// 此时index=4,越界

        //字符串数组
        char* lang[]={"c++","c","java"};
        for (int i=0; i<3; i++) {
            NSLog(@"%s\n",lang[i]);
        }
        
//        指向指针的指针,指针链
        int *star_p;
        int **star_p_p;

        star_p=&star;
        star_p_p=&star_p;
        NSLog(@"num_address:%x\n",star_p);
        NSLog(@"num_p_address:%x\n",star_p_p);

        NSLog(@"%d\n",*star_p);//都是star，10
        NSLog(@"%d\n",**star_p_p);//都是star，10
        
        int n=10;
        halfclass *obj=[[halfclass alloc] init];
        [obj gethalf:&n];
        NSLog(@"%d",n);
        
        int *p;
        randomclass *robj=[[randomclass alloc] init];
        p=[robj getrandomNums];
        for(int i=0;i<5;i++){
            NSLog(@"%d",*(p+i));
        }
    }
    return 0;
}
