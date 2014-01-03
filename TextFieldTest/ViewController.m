//
//  ViewController.m
//  TextFieldTest
//
//  Created by SDT-1 on 2014. 1. 3..
//  Copyright (c) 2014년 SDT-1. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textInput;

@end

@implementation ViewController

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    if(2 == textField.tag)return NO;
    return YES;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    NSLog(@"input : %@",textField.text);
    [textField resignFirstResponder];
    return YES;
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if(3 == textField.tag && NSOrderedSame == [string compare:@"z" options:NSCaseInsensitiveSearch])return NO;
    //z가 입력된경우 는 return NO
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self.textInput becomeFirstResponder];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 205, 0, 0)];
    label.text = @"z입력금지";
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor clearColor];
    [label sizeToFit];
    [self.view addSubview:label];
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(130, 200, 171, 31)];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.delegate = self;
    textField.tag = 3;
    
    [self.view addSubview:textField];
}

- (IBAction)keyboardOff:(id)sender {
     [self.textInput resignFirstResponder];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
