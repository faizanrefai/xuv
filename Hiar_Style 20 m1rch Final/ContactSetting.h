//
//  ContactSetting.h
//  Hiar_Style_New
//
//  Created by Vivek Rajput on 8/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Global.h"
#define kNameValueTag2 1

@interface ContactSetting : UIViewController<UITableViewDelegate,UITableViewDataSource> {
	IBOutlet UITableView *tblcontactset;
		
}
-(IBAction)click;

@end
