//
//  MGArchiveBaseModel.m
//  MGKit
//
//  Created by maling on 2019/5/31.
//  Copyright © 2019 maling. All rights reserved.
//

#import "MGArchiveBaseModel.h"
#import <Objc/runtime.h>
@implementation MGArchiveBaseModel

//解归档的方法
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    if (self) {
        //获取所有属性
        NSArray * porpertyArray = [self getAllPropertys];
        for (NSString * name in porpertyArray) {
            //去掉属性名前面的_
            NSString * key = [name substringFromIndex:1];
            //约定好的键值对 c+key
            NSString *newKey = [NSString stringWithFormat:@"c%@",key];
            id value = [coder decodeObjectForKey:newKey];
            if (value) {
                [self setValue:value forKey:key];
            } else {
                id unKnowValue = [self valueForKey:key];
                [self setValue:unKnowValue forKey:key];
            }
        }
    }
    return self;
}

//归档
- (void)encodeWithCoder:(NSCoder *)coder
{
    //获取所有属性
    NSArray * porpertyArray = [self getAllPropertys];
    for (NSString * name in porpertyArray) {
        //去掉属性名前面的_
        NSString * key = [name substringFromIndex:1];
        //约定好的键值对 c+key
        id value = [self valueForKey:key];
        if (value) {
            [coder encodeObject:value forKey:[NSString stringWithFormat:@"c%@",key]];
        }
    }
}

//获取model所有属性
- (NSArray *)getAllPropertys{
    NSMutableArray * array = [[NSMutableArray alloc]init];
    
    unsigned int *count = malloc(sizeof(unsigned int));
    //调用runtime的方法
    //Ivar：方法返回的对象内容对象，这里将返回一个Ivar类型的指针
    //class_copyIvarList方法可以捕获到类的所有变量，将变量的数量存在一个unsigned int的指针中
    Ivar *mem = class_copyIvarList([self class], count);
    //进行遍历
    for (int i = 0; i < *count ; i++)
    {
        //通过移动指针进行遍历
        Ivar var = * (mem+i);
        //获取变量的名称
        const char * name = ivar_getName(var);
        NSString * str = [NSString stringWithCString:name encoding:NSUTF8StringEncoding];
        [array addObject:str];
    }
    //释放内存
    free(count);
    free(mem);
    //注意处理野指针
    count = nil;
    return array;
}


//- (NSString *)description
//{
//    // warning : 一定要引入头文件  #import <objc/runtime.h>
//    NSString * desc= [super description];
//    desc = [NSString stringWithFormat:@"\n  %@\n", desc];
//
//    unsigned int outCount;
//    //获取obj的属性数目
//    objc_property_t *properties = class_copyPropertyList([self class], &outCount);
//
//    for (int i = 0; i < outCount; i ++) {
//        objc_property_t property = properties[i];
//        //获取property的C字符串
//        const char * propName = property_getName(property);
//        if (propName) {
//            //获取NSString类型的property名字
//            NSString    * prop = [NSString stringWithCString:propName encoding:[NSString defaultCStringEncoding]];
//            //获取property对应的值
//            id obj = [self valueForKey:prop];
//            //将属性名和属性值拼接起来
//            desc = [desc stringByAppendingFormat:@"  %@ : %@,\n",prop,obj];
//        }
//    }
//
//    free(properties);
//    return desc;
//}

@end
