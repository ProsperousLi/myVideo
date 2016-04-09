//
//  viewDesign.m
//  42Certer-Three
//
//  Created by dragon on 15/11/29.
//  Copyright © 2015年 dragon. All rights reserved.
//

#import "LoginView.h"

static NSString *indexString = nil;
@implementation LoginView

-(id) init {
    if (self = [super init]) {
        CGRect frame = [[UIScreen mainScreen] bounds];
        self.frame = frame;
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.loginText];
        [self addSubview:self.passwordText];
        [self addSubview:self.loginLabel];
        [self addSubview:self.passwordLabel];
        [self addSubview:self.loginButton];
        [self addSubview:self.loginOutButton];
        [self addSubview:self.remberPwdSwitch];
        [self addSubview:self.loginInfo];
        [self addSubview:self.remberPwdLabel];
    }
    return self;
}

-(UITextField*)loginText {
    
    if (!_loginText) {
        _loginText = [[UITextField alloc] initWithFrame:CGRectMake((ScreenWidth)/5, (ScreenHeight)/5 ,2*(ScreenWidth)/3,(ScreenHeight)/13)];
        _loginText.backgroundColor = [UIColor grayColor]; // 账号输入框设置为白色
        _loginText.placeholder = [NSString stringWithFormat:deLoginTextInfo];
        _loginText.clearButtonMode = UITextFieldViewModeWhileEditing;
        _loginText.keyboardType = UIKeyboardTypeNumberPad;
        _loginText.layer.cornerRadius = 10;//圆角
    }
    
    return _loginText;
}

-(UITextField*)passwordText {
    if (!_passwordText) {
        _passwordText = [[UITextField alloc] initWithFrame:CGRectMake((ScreenWidth)/5, (ScreenHeight)/5 +  (ScreenHeight)/9 , 2*(ScreenWidth)/3, (ScreenHeight)/13)];
        _passwordText.backgroundColor = [UIColor grayColor]; // 账号输入框设置为白色
        _passwordText.placeholder = [NSString stringWithFormat:dePwdInTextInfo];
        _passwordText.clearButtonMode = UITextFieldViewModeWhileEditing;
        _passwordText.secureTextEntry = YES;
        _passwordText.clearsOnBeginEditing = YES;
        _passwordText.layer.cornerRadius = 10;
    }
    
    return _passwordText;
}

-(UILabel*)loginLabel {
    
    if (!_loginLabel) {
        _loginLabel = [[UILabel alloc] initWithFrame:CGRectMake(10,(ScreenHeight)/5,50,40)];
        [_loginLabel setText:deLoginLabelInfo];
        _loginLabel.backgroundColor = [UIColor whiteColor];
    }
    return _loginLabel;
}

-(UILabel*)passwordLabel {
    if (!_passwordLabel) {
        _passwordLabel = [[UILabel alloc] initWithFrame:CGRectMake(10,(ScreenHeight)/5 + (ScreenHeight)/9,50,40)];
        [_passwordLabel setText:@"密码"];
        _passwordLabel.backgroundColor = [UIColor whiteColor];
    }
    return _passwordLabel;
}

-(UIButton*)loginButton {
    if (!_loginButton) {
        _loginButton = [[UIButton alloc] initWithFrame:CGRectMake((ScreenWidth)/4, (ScreenHeight)/3 + (ScreenHeight)/6, (ScreenWidth)/2, (ScreenWidth)/10)];
        [_loginButton setTintColor:[UIColor whiteColor]];
        [_loginButton setTitle:@"登陆" forState:UIControlStateNormal];
        _loginButton.backgroundColor = [UIColor redColor];
        [_loginButton addTarget:self action:@selector(LoginButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    return _loginButton;
}

-(UIButton*)loginOutButton {
    if (!_loginOutButton) {
        _loginOutButton = [[UIButton alloc] initWithFrame:CGRectMake((ScreenWidth)/4, (ScreenHeight)/3 + (ScreenHeight)/6+(ScreenWidth)/7, (ScreenWidth)/2, (ScreenWidth)/10)];
        [_loginOutButton setTintColor:[UIColor whiteColor]];
        [_loginOutButton setTitle:@"注销" forState:UIControlStateNormal];
        _loginOutButton.backgroundColor = [UIColor redColor];
        [_loginOutButton addTarget:self action:@selector(LoginOutButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return _loginOutButton;
}

-(UISwitch*)remberPwdSwitch {
    if (!_remberPwdSwitch) {
        _remberPwdSwitch = [[UISwitch alloc] initWithFrame:CGRectMake((ScreenWidth)/3 + (ScreenWidth)/5, (ScreenHeight)/3 + (ScreenHeight)/13, (ScreenWidth)/10, (ScreenWidth)/10)];
        [_remberPwdSwitch addTarget:self action:@selector(isRemeberPwd:) forControlEvents:UIControlEventTouchUpInside];
        _remberPwdSwitch.layer.cornerRadius = 10;
    }
    
    return _remberPwdSwitch;
}

-(UILabel*)loginInfo {
    if (!_loginInfo) {
        _loginInfo = [[UILabel alloc] initWithFrame:CGRectMake(10, 3*(ScreenHeight)/4, 8 * (ScreenWidth)/9, (ScreenWidth)/9)];
        [_loginInfo setTintColor:[UIColor redColor]];
        _loginInfo.backgroundColor = [UIColor grayColor];
    }
    return _loginInfo;
}

-(UILabel*)remberPwdLabel {
    if (!_remberPwdLabel) {
        _remberPwdLabel = [[UILabel alloc] initWithFrame:CGRectMake( (ScreenWidth)/5, (ScreenHeight)/3 + (ScreenHeight)/13, (ScreenWidth)/3, (ScreenWidth)/10)];
        _remberPwdLabel.backgroundColor = [UIColor whiteColor];
        [_remberPwdLabel setText:@"记住密码"];
    }
    return _remberPwdLabel;
}

#pragma mark 活动指示器
-(UIActivityIndicatorView *)act {
    if (!_act) {
        _act = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(ScreenWidth/2 - ScreenWidth/10, ScreenHeight/2 - ScreenHeight/10, ScreenWidth/5, ScreenHeight/5)];
        _act.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
        //_act.color = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:LoadViewPicture]];
        _act.color = [UIColor grayColor];
        //_act.hidesWhenStopped = NO;
    }
    return _act;
}

#pragma mark 注销
-(void)LoginOutButtonAction:(id)button {
    
    NSURL * url = [NSURL URLWithString:LOGIOUTURL];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"GET"];
    [request setTimeoutInterval:2.0];
    
    
    NSOperationQueue * queue = [NSOperationQueue mainQueue];//声明线程队列
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *returnResponse,NSData *data,NSError * error){//异步请求
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) returnResponse; //响应
        [httpResponse statusCode];//状态码
        //NSDictionary *responseHeaders = [httpResponse allHeaderFields]; //头信息
        if (error || data == nil){
            NSLog(@"请求失败");
        }
        else {
//            NSLog(@"%ld",(long)[httpResponse statusCode]);
//            NSLog(@"%@",responseHeaders);
//            NSLog(@"%s",data.bytes);
        }
        
    }];
    
    if (indexString == nil) {
        _loginText.text = nil;
        _passwordText.text = nil;
    }
    _loginText.enabled = YES;
    _passwordText.enabled = YES;
    _loginInfo.text = @"注销成功";
    _loginButton.enabled = YES;
    

    

    
    //[self presentViewController:alert animated:YES completion:nil];
    
}


#pragma mark 登录
-(void)LoginButtonAction:(id)button {
    
    //活动指示器

    [self addSubview:self.act];
    [self bringSubviewToFront:_act];
    [_act startAnimating];
    //开启定时器
    NetOperation *net = [[NetOperation alloc] init];
    [net connectNet:_loginText.text WithPassword:_passwordText.text];
    NSString *userFromData = @"13342232809"; //从数据库中拿到账号密码，暂定为固定的
    NSString *pwdFromData = @"caonima";
    
    //延迟函数
    double delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){

        [_act stopAnimating];
        if ([[self.loginText text]  isEqual: userFromData] && [[self.passwordText text] isEqual:pwdFromData]) {
            self.loginText.enabled = NO; //用户名不可修改
            self.passwordText.enabled = NO;  //密码不可修改
            self.loginButton.enabled = NO; // 按钮不可点击
            self.loginInfo.text = @"登陆成功"; //显示登录成功
        }
        else {
            //设置提醒框
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:AlertTitle message:@"账号或者密码错误" delegate:nil cancelButtonTitle:AlertActionTitleOK  otherButtonTitles:nil, nil];
            //UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"账号或者密码错误" preferredStyle:UIAlertControllerStyleAlert];
            [alert show];
        }
    });
}

#pragma mark 记住密码
-(void)isRemeberPwd:(id)sender {
    UISwitch *mySwitch = (UISwitch*)sender;
    if (mySwitch.isOn) {
        indexString = @"has a value";

    }
    else {
        indexString = nil;
    }

    
}

#pragma mark 提醒框
-(UIAlertController*)LoginOutAlert {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:AlertTitle message:@"注销成功!" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *alertAction = [UIAlertAction actionWithTitle:AlertTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * action){}];
    [alert addAction:alertAction];
    return alert;
}


#pragma mark 实现touch
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [_loginText resignFirstResponder];
    [_passwordText resignFirstResponder];
    [_loginButton resignFirstResponder];
}


@end
