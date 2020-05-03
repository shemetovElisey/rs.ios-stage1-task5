#import "Converter.h"

// Do not change
NSString *KeyPhoneNumber = @"phoneNumber";
NSString *KeyCountry = @"country";

@implementation PNConverter
- (NSDictionary*)converToPhoneNumberNextString:(NSString*)string; {
    
    NSMutableString *num = [NSMutableString stringWithString:string];
    NSMutableString *countryKey = [NSMutableString new];
    NSMutableString *countryKeyNum = [NSMutableString new];
    NSMutableString *result = [NSMutableString new];
    
    if ([num hasPrefix:@"+"]) {
        [num deleteCharactersInRange:NSMakeRange(0, 1)];
    }
    
    if (![num isEqual:@""]) {
        if ([[num substringWithRange:NSMakeRange(0, 1)] isEqual:@"7"]) {
            if (num.length > 1 && [[num substringWithRange:NSMakeRange(1, 1)] isEqual:@"7"]) {
                countryKey = [NSMutableString stringWithString:@"KZ"];
                countryKeyNum = [NSMutableString stringWithString:@"+7"];
                [num deleteCharactersInRange:NSMakeRange(0, 1)];
            } else {
                countryKey = [NSMutableString stringWithString:@"RU"];
                countryKeyNum = [NSMutableString stringWithString:@"+7"];
                [num deleteCharactersInRange:NSMakeRange(0, 1)];
            }
        } else if ([[num substringWithRange:NSMakeRange(0, 1)] isEqual:@"3"] && num.length > 2) {
            if ([[num substringWithRange:NSMakeRange(0, 3)] isEqual:@"373"]) {
                countryKey = [NSMutableString stringWithString:@"MD"];
                countryKeyNum = [NSMutableString stringWithString:@"+373"];
                [num deleteCharactersInRange:NSMakeRange(0, 3)];
            } else if ([[num substringWithRange:NSMakeRange(0, 3)] isEqual:@"374"]) {
                countryKey = [NSMutableString stringWithString:@"AM"];
                countryKeyNum = [NSMutableString stringWithString:@"+374"];
                [num deleteCharactersInRange:NSMakeRange(0, 3)];
            } else if ([[num substringWithRange:NSMakeRange(0, 3)] isEqual:@"380"]) {
                countryKey = [NSMutableString stringWithString:@"UA"];
                countryKeyNum = [NSMutableString stringWithString:@"+380"];
                [num deleteCharactersInRange:NSMakeRange(0, 3)];
            } else if ([[num substringWithRange:NSMakeRange(0, 3)] isEqual:@"375"]) {
                countryKey = [NSMutableString stringWithString:@"BY"];
                countryKeyNum = [NSMutableString stringWithString:@"+375"];
                [num deleteCharactersInRange:NSMakeRange(0, 3)];
            }
        } else if ([[num substringWithRange:NSMakeRange(0, 1)] isEqual:@"9"] && num.length > 2) {
            if ([[num substringWithRange:NSMakeRange(0, 3)] isEqual:@"992"]) {
                countryKey = [NSMutableString stringWithString:@"TJ"];
                countryKeyNum = [NSMutableString stringWithString:@"+992"];
                [num deleteCharactersInRange:NSMakeRange(0, 3)];
            } else if ([[num substringWithRange:NSMakeRange(0, 3)] isEqual:@"993"]) {
                countryKey = [NSMutableString stringWithString:@"TM"];
                countryKeyNum = [NSMutableString stringWithString:@"+993"];
                [num deleteCharactersInRange:NSMakeRange(0, 3)];
            } else if ([[num substringWithRange:NSMakeRange(0, 3)] isEqual:@"994"]) {
                countryKey = [NSMutableString stringWithString:@"AZ"];
                countryKeyNum = [NSMutableString stringWithString:@"+994"];
                [num deleteCharactersInRange:NSMakeRange(0, 3)];
            } else if ([[num substringWithRange:NSMakeRange(0, 3)] isEqual:@"996"]) {
                countryKey = [NSMutableString stringWithString:@"KG"];
                countryKeyNum = [NSMutableString stringWithString:@"+996"];
                [num deleteCharactersInRange:NSMakeRange(0, 3)];
            } else if ([[num substringWithRange:NSMakeRange(0, 3)] isEqual:@"998"]) {
                countryKey = [NSMutableString stringWithString:@"UZ"];
                countryKeyNum = [NSMutableString stringWithString:@"+998"];
                [num deleteCharactersInRange:NSMakeRange(0, 3)];
            }
        } else {
                if (num.length > 12) {
                    result = [NSMutableString stringWithFormat:@"+%@", [num substringWithRange:NSMakeRange(0, 12)]];
                    num = [NSMutableString stringWithFormat:@""];
                } else {
                    result = [NSMutableString stringWithFormat:@"+%@", num];
                    num = [NSMutableString stringWithFormat:@""];
                }
        }
    } else {
        result = [NSMutableString stringWithFormat:@"+%@", num];
        num = [NSMutableString stringWithFormat:@""];
    }
    
    if ([countryKey isEqual:@"RU"] || [countryKey isEqual:@"KZ"]) {
        if ([num isEqual:@""]) {
            result = countryKeyNum;
        } else {
            result = [NSMutableString stringWithFormat:@"%@ (XXX) XXX-XX-XX", countryKeyNum];
        }
        for (int i = 0; i < num.length; i++) {
            for (int k = 0; k < result.length; k++) {
                if ([result characterAtIndex:k] == 'X') {
                    NSString *str = [NSString stringWithFormat:@"%c", [num characterAtIndex:i]];
                    [result replaceCharactersInRange:NSMakeRange(k, 1) withString:str];
                    break;
                }
            }
        }
       } else if ([countryKey isEqual:@"BY"] || [countryKey isEqual:@"UA"] || [countryKey isEqual:@"TJ"] || [countryKey isEqual:@"AZ"] || [countryKey isEqual:@"KG"] || [countryKey isEqual:@"UZ"]) {
           if ([num isEqual:@""]) {
               result = countryKeyNum;
           } else {
              result = [NSMutableString stringWithFormat:@"%@ (XX) XXX-XX-XX", countryKeyNum];
               for (int i = 0; i < num.length; i++) {
                   for (int k = 0; k < result.length; k++) {
                       if ([result characterAtIndex:k] == 'X') {
                           NSString *str = [NSString stringWithFormat:@"%c", [num characterAtIndex:i]];
                           [result replaceCharactersInRange:NSMakeRange(k, 1) withString:str];
                           break;
                       }
                   }
               }
           }
              
        } else if ([countryKey isEqual:@"MD"] || [countryKey isEqual:@"AM"] || [countryKey isEqual:@"TM"]) {
            if ([num isEqual:@""]) {
                result = countryKeyNum;
            } else {
               result = [NSMutableString stringWithFormat:@"%@ (XX) XXX-XXX", countryKeyNum];
            }
            for (int i = 0; i < num.length; i++) {
                for (int k = 0; k < result.length; k++) {
                    if ([result characterAtIndex:k] == 'X') {
                        NSString *str = [NSString stringWithFormat:@"%c", [num characterAtIndex:i]];
                        [result replaceCharactersInRange:NSMakeRange(k, 1) withString:str];
                        break;
                    }
                }
            }
    }
    
    for (int i = 0; i < result.length; i++) {
        if ([result characterAtIndex:i] == 'X') {
            NSUInteger k = [result length] - i;
            if ([result characterAtIndex:i-1] == '-') {
                [result deleteCharactersInRange:NSMakeRange(i - 1, k + 1)];
            } else if ([result characterAtIndex:i-1] == ' ') {
                [result deleteCharactersInRange:NSMakeRange(i-2, k+2)];
            } else {
                [result deleteCharactersInRange:NSMakeRange(i, k)];
            }
            break;
        }
    }
    
    return @{KeyPhoneNumber: result,
             KeyCountry: countryKey};
}
@end
