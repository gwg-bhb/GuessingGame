//
//  ViewController.m
//  GuessingGame
//
//  Created by hello on 16/3/11.
//  Copyright © 2016年 hello. All rights reserved.
//

#import "ViewController.h"
#import "AboutViewController.h"

@interface ViewController ()
@property (nonatomic, assign) int number;
@property (nonatomic, assign) int times;
@property (weak, nonatomic) IBOutlet UITextField *numberTextField;
- (IBAction)submitAnswer:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.number = arc4random_uniform(100);
    self.times = 0;
    
    self.navigationController.navigationBarHidden = YES;
    
    
}

- (void)viewDidAppear:(BOOL)animated{

    [super viewDidAppear:animated];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateSecretText:(NSString *)secretText
{
    self.numberTextField.text = secretText;
}

- (IBAction)newGame:(UIButton *)sender {
    self.number = arc4random_uniform(100);
    self.times = 0;
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSString *segueID = segue.identifier;
    
    if ([segueID isEqualToString:@"showAbout"]) {
        
        AboutViewController *aboutVC = (AboutViewController *)segue.destinationViewController;
        
        aboutVC.delegate = self;
        
        NSString *numberText = [NSString stringWithFormat:@"%d", self.number];
        [aboutVC updateSecretLabel:numberText];
    }
}

- (IBAction)submitAnswer:(UIButton *)sender {
    UIAlertController *alert;
    NSString *resultText = self.numberTextField.text;
    int result;
    NSScanner *scan = [NSScanner scannerWithString:resultText];
    BOOL judgeInt = [scan scanInt:&result] && [scan isAtEnd];   //judege int number？

    
     result = [resultText intValue];
    if(result > 100 || result < 0 || !judgeInt)    //judge range of number
    {
        alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"数字不合法，需要输入0~100以内纯数字" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *actionOK = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:actionOK];
        [self presentViewController:alert animated:YES completion:nil];
        return;
    }
    self.times++;
    
    NSString *message = nil;
    if (result > self.number) {
        message = @"猜大了";
    }
    else if(result < self.number)
    {
        message = @"猜小了";
    }
    else
    {
        message = [NSString stringWithFormat:@"congratulation，你答对了，一共答了%d次", self.times];
    }
    
    alert = [UIAlertController alertControllerWithTitle:@"结果" message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
    
    [alert addAction:action];
    
    [self presentViewController:alert animated:YES completion:nil];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
@end
