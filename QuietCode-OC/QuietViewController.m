//
//  ViewController.m
//  QuietCode-OC
//
//  Created by rongtong on 16/3/8.
//  Copyright © 2016年 iosqun328218600. All rights reserved.
//

#import "QuietViewController.h"

@interface QuietViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;
@end

@implementation QuietViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    /*
     self.var 通过访问方法的引用(包括set和get方法)
     _var  直接引用（不通过set和get方法）
     http://www.cnblogs.com/liukunpeng/p/3738202.html
     手动管理内存的时候不要用使用“.”语法来初始化变量的时候，会产生内存泄漏的问题：
     self.nameArray = [NSMutaleArray alloc] init];
     上述代码，造成的问题是，在self.nameArray的时候相当于调用了set方法，引用计数＋1，后面alloc的时候，引用计数再次＋1。
     在我们最后dealloc中release的时候，引用计数只减了一次，并没有完成全部释放，这样就造成了内存泄漏的问题。
     解决方法：就是用“_”来初始化以及访问变量，这样就不会产生内存问题，虽不是什么高明的办法，但的确有效。
     如果是在ARC（自动管理内存）的情况下虽然不存在上述问题，但从编码规范来考虑，还是注意点儿的好。
     */
 
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,0, self.view.frame.size.width, self.view.frame.size.height)];
    
    _tableView.delegate = self;
    
    _tableView.dataSource = self;
 
    [self.view addSubview:_tableView];
    
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addActionPlan)];
    
    self.navigationItem.rightBarButtonItem =barButtonItem;
    
}

- (void)addActionPlan
{
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifierStr = @"identifierStr";
    
    UITableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:identifierStr];
    
    if(!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierStr];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
