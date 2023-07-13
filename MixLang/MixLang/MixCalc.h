//
//  MixCalc.h
//  MixLang
//
//  Created by 이재승 on 2023/07/13.
//

#import <Foundation/Foundation.h>

// 헤더 파일은 선언부만 있게 된다.

@interface MixCalc : NSObject

- (int)plus:(int)number1 with:(int)number2;
- (int)minus:(int)number1 with:(int)number2;
- (int)multiply:(int)number1 with:(int)number2;
- (int)divide:(int)number1 with:(int)number2;

@end
