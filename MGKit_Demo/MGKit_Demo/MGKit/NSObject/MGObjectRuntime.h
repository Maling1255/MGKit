//
//  MGObjectRuntime.h
//  MGKit_Demo
//
//  Created by maling on 2019/5/31.
//  Copyright © 2019 maling. All rights reserved.
//

#import <Foundation/Foundation.h>

/// 获取一个类的所有属性名字:类型的名字，具有@property的, 父类的获取不了！
NSDictionary *MGGetPropertyListOfObject(NSObject *object);
NSDictionary *MGGetPropertyListOfClass(Class cls);

void Swizzle(Class c, SEL origSEL, SEL newSEL);

