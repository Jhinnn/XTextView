//
//  ViewController.m
//  XTextView
//
//  Created by pengpeng on 2017/3/14.
//  Copyright © 2017年 Arthur. All rights reserved.
//

#import "ViewController.h"
#import "UITextView+PlaceHolder.h"
@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textView;

@property (weak, nonatomic) IBOutlet UILabel *wordLabel;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textViewEditChanged:) name:UITextViewTextDidChangeNotification object:nil];
    
    self.textView.placeholder = @"说点什么吧!";
    self.wordLabel.text = @"140";
}


- (void)textViewEditChanged:(NSNotification*)obj {
    UITextView *textView = self.textView;
    NSString *textStr = textView.text;
    NSInteger fontNum = 140 - textStr.length;
    fontNum = fontNum < 0 ? 0 : fontNum;
    self.wordLabel.text = [NSString stringWithFormat:@"%@",@(fontNum)];
    if (textStr.length > 140) {
        textView.text = [textStr substringToIndex:140];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
