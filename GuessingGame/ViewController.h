//
//  ViewController.h
//  GuessingGame
//
//  Created by hello on 16/3/11.
//  Copyright © 2016年 hello. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AboutViewController.h"


@interface ViewController : UIViewController<updateSecreTextDelegate>


- (void)updateSecretText:(NSString *)secretText;

@end

