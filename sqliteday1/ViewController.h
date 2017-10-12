//
//  ViewController.h
//  sqliteday1
//
//  Created by Felix-ITS 004 on 06/10/17.
//  Copyright © 2017 sonal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>
#import "Directory.h"
@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

- (IBAction)Search:(id)sender;

@property (strong, nonatomic) IBOutlet UITableView *taskTableView;
// NSInteger id;

@end

