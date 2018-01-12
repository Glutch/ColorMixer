//
//  ViewController.m
//  ColorMixer
//
//  Created by Oliver Johansson on 2018-01-12.
//  Copyright © 2018 Oliver Johansson. All rights reserved.
//

#import "ViewController.h"

NSString *hello = @"hej";

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISlider *redAmount;
@property (weak, nonatomic) IBOutlet UISlider *greenAmount;
@property (weak, nonatomic) IBOutlet UISlider *blueAmount;
@property (weak, nonatomic) IBOutlet UIView *colorDisplay;
@property (weak, nonatomic) IBOutlet UILabel *hexLabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self refresh];
}

- (void)refresh {
    self.colorDisplay.backgroundColor = [self currentColor];
    self.hexLabel.text = [self rgbToHex:self.currentColor];
    self.hexLabel.text = hello;
}

- (IBAction)sliderChanged:(id)sender {
    [self refresh];
}

- (IBAction)reset:(id)sender {
    self.redAmount.value = 0.5f;
    self.greenAmount.value = 0.5f;
    self.blueAmount.value = 0.5f;
    [self refresh];
}

- (IBAction)invert:(id)sender {
    self.redAmount.value = 1 - self.redAmount.value;
    self.greenAmount.value = 1 - self.greenAmount.value;
    self.blueAmount.value = 1 - self.blueAmount.value;
    [self refresh];
}

- (IBAction)random:(id)sender {
    self.redAmount.value = (float)arc4random_uniform(1000) / 1000;
    self.greenAmount.value = (float)arc4random_uniform(1000) / 1000;
    self.blueAmount.value = (float)arc4random_uniform(1000) / 1000;
    [self refresh];
}

- (UIColor*)currentColor {
    return [UIColor colorWithRed:self.redAmount.value green:self.greenAmount.value blue:self.blueAmount.value alpha:1.0f];
}

- (NSString*)rgbToHex:(UIColor*)color {
    const CGFloat *components = CGColorGetComponents(color.CGColor);
    CGFloat r = components[0];
    CGFloat g = components[1];
    CGFloat b = components[2];
    NSString *hexString=[NSString stringWithFormat:@"%02X%02X%02X", (int)(r * 255), (int)(g * 255), (int)(b * 255)];
    return hexString;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
