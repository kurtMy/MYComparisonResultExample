//
//  ViewController.m
//  MYComparisonResultExample
//
//  Created by may on 2017/9/4.
//  Copyright © 2017年 may. All rights reserved.
//
//这里介绍一下NSComparisonResult的用法
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    NSComparisonResult 是一个枚举类型里面包含三个值NSOrderedAscending = -1L, NSOrderedSame, NSOrderedDescending
//    1.NSOrderedAscending 表示两个比较的对象前者小于后置
//    2.NSOrderedDescending 表示两个比较的对象前者大于后者
//    3.NSOrderedSame 表示比较的对象相等
 
//    升序排列
//    [self ascending];
//    降序排列
    [self descending];
}

//升序排列
- (void)ascending{
    
    /*
     我们知道compare方法返回的即是NSComparisonResult 的三种结果，而将其放到数组方法中应该拆分来看
     数组的排序方法sortUsingComparator 、sortedArrayUsingComparator的参数是一个block,根据block中的返回值对数组中的对象进行排序,将按照其index进行排序,而我们也可以手动控制，当返回值为NSOrderedDescending时，将会交换比较对象的index，当返回值为NSOrderedAscending则维持原顺序不变，所以我们可以手动控制，让其升序排列还是降序排列
     compare可以对字符串，nsnumber进行比较
     */
    

    //    首先创建两个数组样本
    NSArray *array = @[@1,@8,@4,@5,@2,@3];
    NSMutableArray *mutableArray1 = [NSMutableArray arrayWithArray:array];
    NSMutableArray *mutableArray2 = [NSMutableArray arrayWithArray:array];
    NSMutableArray *mutableArray3 = [NSMutableArray arrayWithArray:array];
    NSArray *stringArray = @[@"name",@"age",@"sex",@"height",@"weight",@"namy"];
    NSArray *mixArray = @[@"name",@8,@1,@"age",@"sex",@5,@"height",@"2",@"3"];
    NSArray *numArray = @[@"1",@"8",@"4",@"5",@"2",@"3"];
    
    //    1.当排序方法无法对数组中的对象进行排序的时候，会按照返回值对其所在数组对应的index进行排序。
    NSArray *mixArray1 = [mixArray sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return NSOrderedAscending;
    }];
    
    NSArray *numArray1 = [numArray sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return NSOrderedAscending;
    }];
    
    NSLog(@"mixArray1%@--numArray1%@",mixArray1,numArray1);
    
    NSArray *sourtArray1 = [stringArray sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        //        将数组中的字符串升序排列
        return NSOrderedAscending;
    }];
    
    NSLog(@"sourArray1%@",sourtArray1);
    
    [mutableArray1 sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        //        将数组中的对象升序排列
        return NSOrderedAscending;
    }];
    
    NSLog(@"mutableArray1%@",mutableArray1);

    
//    2.根据compare返回的结果，进行排序。如果返回的是NSOrderedAscending、NSOrderedSame则保持不变否则交换二者的位置,这其实是一种人为控制
    NSArray *sourtArray2 = [stringArray sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        //        将数组中的字符串升序排列
        return [obj1 compare:obj2];
    }];
    
    NSLog(@"sourArray2%@",sourtArray2);
    
    [mutableArray2 sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        //        将数组中的对象升序排列
        return [obj1 compare:obj2];
    }];
    
    NSLog(@"mutableArray2%@",mutableArray2);
    
//   看到这里可能有些人会有些懵，为什么 return [obj1 compare:obj2] 数组就会升序排列,那么看一下下面的例子你或许能明白
    
//    3.原理与2相同，只不过展示的方式更直观，2中只不过是利用compare的返回值，精简出来的写法。
    NSArray *sourtArray3 = [stringArray sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        //        将数组中的字符串升序排列
        if ([obj1 compare:obj2] == NSOrderedAscending) {
            return NSOrderedAscending;
        }else {
            return NSOrderedDescending;
        }
    }];
    
    NSLog(@"sourArray3%@",sourtArray3);
    
    [mutableArray3 sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        //        将数组中的对象升序排列
        if ([obj1 integerValue] > [obj2 integerValue]) {
            return NSOrderedDescending;
        }else {
            return NSOrderedAscending;
        }
    }];

    NSLog(@"mutableArray3%@",mutableArray3);
    
 
}

//降序排列
- (void)descending{
    
     /*
     我们知道compare方法返回的即是NSComparisonResult 的三种结果，而将其放到数组方法中应该拆分来看
     数组的排序方法sortUsingComparator 、sortedArrayUsingComparator的参数是一个block,根据block中的返回值对数组中的对象进行排序,将按照其index进行排序,而我们也可以手动控制，当返回值为NSOrderedDescending时，将会交换比较对象的index，当返回值为NSOrderedAscending则维持原顺序不变，所以我们可以手动控制，让其升序排列还是降序排列
     compare可以对字符串，nsnumber进行比较
     */

    
    
    //    首先创建两个数组样本
    NSArray *array = @[@1,@8,@4,@5,@2,@3];
    NSMutableArray *mutableArray1 = [NSMutableArray arrayWithArray:array];
    NSMutableArray *mutableArray2 = [NSMutableArray arrayWithArray:array];
    NSMutableArray *mutableArray3 = [NSMutableArray arrayWithArray:array];
    NSArray *stringArray = @[@"name",@"age",@"sex",@"height",@"weight",@"namy"];
    NSArray *mixArray = @[@"name",@8,@1,@"age",@"sex",@5,@"height",@"2",@"3"];
    NSArray *numArray = @[@"1",@"8",@"4",@"5",@"2",@"3"];
    
    //    1.当排序方法无法对数组中的对象进行排序的时候，会按照返回值对其所在数组对应的index进行排序。
    NSArray *mixArray1 = [mixArray sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return NSOrderedDescending;
    }];
    
    NSArray *numArray1 = [numArray sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return NSOrderedDescending;
    }];
    
    NSLog(@"mixArray1%@--numArray1%@",mixArray1,numArray1);
    
    NSArray *sourtArray1 = [stringArray sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        //        将数组中的字符串降序排列
        return NSOrderedDescending;
    }];
    
    NSLog(@"sourArray1%@",sourtArray1);
    
    [mutableArray1 sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        //        将数组中的对象降序排列
        return NSOrderedDescending;
    }];
    
    NSLog(@"mutableArray1%@",mutableArray1);
    
    
    //    2.根据compare返回的结果，进行排序。如果返回的是NSOrderedAscending、NSOrderedSame则保持不变否则交换二者的位置,这其实是一种人为控制
    NSArray *sourtArray2 = [stringArray sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        //        将数组中的字符串降序排列
        return [obj2 compare:obj1];
    }];
    
    NSLog(@"sourArray2%@",sourtArray2);
    
    [mutableArray2 sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        //        将数组中的对象降序排列
        return [obj2 compare:obj1];
    }];
    
    NSLog(@"mutableArray2%@",mutableArray2);
    
    //   看到这里可能有些人会有些懵，为什么 return [obj2 compare:obj1] 数组就会降序排列,那么看一下下面的例子你或许能明白
    
    //    3.原理与2相同，只不过展示的方式更直观，2中只不过是利用compare的返回值，精简出来的写法。
    NSArray *sourtArray3 = [stringArray sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        //        将数组中的字符串降序排列
        if ([obj1 compare:obj2] == NSOrderedDescending) {
            return NSOrderedAscending;
        }else {
            return NSOrderedDescending;
        }
    }];
    
    NSLog(@"sourArray3%@",sourtArray3);
    
    [mutableArray3 sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        //        将数组中的对象降序排列
        if ([obj1 integerValue] < [obj2 integerValue]) {
            return NSOrderedDescending;
        }else {
            return NSOrderedAscending;
        }
    }];
    
    NSLog(@"mutableArray3%@",mutableArray3);

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
