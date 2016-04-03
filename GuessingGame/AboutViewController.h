//
//  AboutViewController.h
//  GuessingGame
//
//  Created by hello on 16/3/18.
//  Copyright © 2016年 hello. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@protocol updateSecreTextDelegate <NSObject>

-(void) updateSecretText:(NSString *)secretText;

@end

@interface AboutViewController : UIViewController


-(void) updateSecretLabel:(NSString *)number;

@property (nonatomic, strong) ViewController *vc;
@end
