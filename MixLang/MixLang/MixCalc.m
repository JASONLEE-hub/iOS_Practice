//
//  MixCalc.m
//  MixLang
//
//  Created by 이재승 on 2023/07/13.
//

#import <Foundation/Foundation.h>

#import "MixCalc.h"

// 구체적인 구현 내용을 작성한다.

@implementation MixCalc

- (int)divide:(int)number1 with:(int)number2 {
    return number1 / number2;
}

- (int)minus:(int)number1 with:(int)number2 {
    return number1 - number2;
}

- (int)multiply:(int)number1 with:(int)number2 {
    return number1 * number2;
}

- (int)plus:(int)number1 with:(int)number2 {
    return number1 + number2;
}

@end
