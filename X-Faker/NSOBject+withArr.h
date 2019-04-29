//
//  NSOBject+withArr.h
//  X-Faker
//
//  Created by whois on 2018/12/22.
//  Copyright © 2018年 whois. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface  NSObject(Arr)

- (id)performSelector:(SEL)aSelector withObjects:(NSArray *)objects;
@end


