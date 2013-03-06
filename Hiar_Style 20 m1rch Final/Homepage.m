//
//  Homepage.m
//  Hiar_Style_New
//
//  Created by apple on 12/5/11.
//  Copyright 2011 354456. All rights reserved.
//

#import "Homepage.h"


@implementation Homepage

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
   self.title=@"Home";
    self.navigationController.navigationBarHidden=TRUE;
    
//    for (id view in self.view.subviews) {
//        if ([view isKindOfClass:[UITextField class]]) {
//            [(UITextField *)view setInputAccessoryView:keyboardToolbar];
//            [(UITextField *)view setLeftView:paddingView];
//            [(UITextField *)view setLeftViewMode:UITextFieldViewModeAlways];
//            
//        }
//    }
//    
    
    // Do any additional setup after loading the view from its nib.
}
-(IBAction)Directory{

   if(!objhome)
   {
       objhome=[[HomeDire alloc]initWithNibName:@"HomeDire" bundle:nil];
       
   }
 
    [self.navigationController  pushViewController:objhome animated:YES];
       
}
-(IBAction)Relation{
    if(objClient_Relation)
    {
    
    //    [objClient_Relation release];
        
    }
    objClient_Relation=[[Client_Relation alloc]initWithNibName:@"Client_Relation" bundle:nil];
    [self.navigationController  pushViewController:objClient_Relation animated:YES];
    


}
-(IBAction)Settings{
    if(objSetting)
    {
        
        [objSetting release];
        
    }
    objSetting=[[SettingHome alloc]initWithNibName:@"SettingHome" bundle:nil];
    [self.navigationController  pushViewController:objSetting animated:YES];
       
}
-(IBAction)Reports{
    
    if(objReportHomeScreen)
    {
        [objReportHomeScreen release];
        
    }
    
   objReportHomeScreen=[[ReportHomeScreen alloc]initWithNibName:@"ReportHomeScreen" bundle:nil];
    [self.navigationController  pushViewController:objReportHomeScreen animated:YES];
    

}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
