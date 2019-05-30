//
//  MGGlobalMacro.h
//  MGKit
//
//  Created by maling on 2019/2/15.
//  Copyright © 2019 maling. All rights reserved.
//

#ifndef MGGlobalMacro_h
#define MGGlobalMacro_h

#define MGObject(objectName) [[objectName alloc]init]


#define MGPropStatementAndPropSetFuncStatement(propertyModifier,className, propertyPointerType, propertyName)           \
@property(nonatomic,propertyModifier)propertyPointerType  propertyName;                                                 \
- (className * (^) (propertyPointerType propertyName)) propertyName##Set;

#define MGPropSetFuncImplementation(className, propertyPointerType, propertyName)                                       \
- (className * (^) (propertyPointerType propertyName))propertyName##Set{                                                \
return ^(propertyPointerType propertyName) {                                                                            \
_##propertyName = propertyName;                                                                                         \
return self;                                                                                                            \
};                                                                                                                      \
}

#endif /* MGGlobalMacro_h */
