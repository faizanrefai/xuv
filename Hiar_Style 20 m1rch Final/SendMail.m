//
//  SendMail.m
//  Hiar_Style_New
//
//  Created by Vivek Rajput on 8/30/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SendMail.h"
#import "Birthday_Reminder.h"

@implementation SendMail
@synthesize customcell;
static const CGFloat MINIMUM_SCROLL_FRACTION = 0.2;
static const CGFloat MAXIMUM_SCROLL_FRACTION = 0.8;
static const CGFloat KEYBOARD_ANIMATION_DURATION = 0.3;

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

#pragma mark-
#pragma mark TableView


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView    {

    return 2;
    

}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath    {



}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath   {



if(indexPath.section==1)
{

    return 250;
    
}
else{

    return 40;
    
}
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section==0)
    {
    return 3;
    }
    else{
    
        return 1;
        
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    static NSString *MyIdentifier=@"cellIdentifier";
	CustomCellForMail  *cell = (CustomCellForMail *)[tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    if (cell == nil)
    {
        
        [[NSBundle mainBundle] loadNibNamed:@"CustomCellForMail" owner:self options:nil];
        cell = customcell;
        
    }
    cell.btnAdd.tag=indexPath.row;
    
    if(indexPath.section==0)
    {
    
        switch (indexPath.row) {
            case 0:
                
                cell.lblHeader.text=@"To(bcc):";
                cell.btnAdd.hidden=FALSE;
               
                NSLog(@"RetainCountAfter%d",[strTOemail retainCount]);
                                
                cell.txtValue.text=[NSString stringWithFormat:@"%@%@",strTOemail,strCCemail];
                
                
                cell.txtmsg.hidden=TRUE;
                
                break;
            case 1:
                cell.lblHeader.text=@"From:";
              //  cell.btnAdd.hidden=FALSE;
                cell.txtValue.text=@"hairstyle@gmail.com";
                
                cell.txtmsg.hidden=TRUE;
                
                break;
            case 2:
                cell.lblHeader.text=@"Subject:";
                cell.txtValue.text=strSubject;
                cell.txtmsg.hidden=TRUE;
                
                break;
                
            default:
                break;
        }
    
    }
    else{
        cell.txtmsg.hidden=FALSE;
        cell.txtValue.hidden=TRUE;
        cell.txtmsg.text=strMessage;
        cell.txtmsg.text=[cell.txtmsg.text stringByAppendingFormat:@"\n\n"];
        
        if([[[NSUserDefaults standardUserDefaults]valueForKey:@"Signature"] isEqualToString:@"(null)"]||[[NSUserDefaults standardUserDefaults]valueForKey:@"Signature"]==nil)
        {
        
        
        }
        else{
        cell.txtmsg.text=[cell.txtmsg.text stringByAppendingFormat:@"%@",[[NSUserDefaults standardUserDefaults]valueForKey:@"Signature"]];
        }
        
        
    cell.lblHeader.text=@"";
        
    }
    
    return cell;
    
    
    
}
#pragma mark-
#pragma mark actions


-(IBAction)PhoneBook:(id)sender{
    
    UIButton *btn=(UIButton *)sender;
    
    int i=btn.tag;   
    objappdel.strselect=@"";
    objappdel.strselectemail=@"";
    if(i==0)
    {
         selectvalue=@"To";
        
    
    }
    else{
        
        selectvalue=@"Cc";
        
    
    }
    if(objcontact)
    {
        [objcontact release];
        
    
    }
    objcontact=[[ContactList alloc]initWithNibName:@"ContactList" bundle:nil];
    [self.navigationController presentModalViewController:objcontact animated:YES];
    
   
    
    


}
-(IBAction)back{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    objappdel=(Hiar_Style_NewAppDelegate *)[[UIApplication sharedApplication]delegate];
    strTOemail=@" ";
    strCCemail=@" ";
    
    self.navigationController.navigationBar.hidden=TRUE;
//	UIBarButtonItem *btnDone;
//    
//    btnDone=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(Send)];
//    
//    self.navigationController.navigationItem.rightBarButtonItem=btnDone;
    //     
    
   
    
    
   


	
}
-(void)viewWillAppear:(BOOL)animated    {
    
    [super viewWillAppear:YES];

    if([selectvalue isEqualToString:@"To"])
    {
        if([objappdel.strselectemail isEqualToString:@""]||objappdel.strselectemail==nil)
        {
        
        
        }
        else{
        
    strTOemail=[strTOemail stringByAppendingFormat:@"%@,",objappdel.strselectemail];
        }
            NSLog(@"RetainCountBefor%d",[strTOemail retainCount]);
        
        [strTOemail retain];
        
        NSLog(@"RetainCountAfter%d",[strTOemail retainCount]);
        
    }
   
    if([selectvalue isEqualToString:@"Cc"])
    {
        if([objappdel.strselectemail isEqualToString:@""]||objappdel.strselectemail==nil)
        {
            
            
        }
        else{
        strCCemail=[strCCemail stringByAppendingFormat:@"%@,",objappdel.strselectemail];
        }
           [strCCemail retain]; 
    
    }

        
    if([objappdel.strselect isEqualToString:@"Emailtemp"]){
        
            strMessage=objappdel.strMessage; 
            strSubject=objappdel.strSubject; 
        

    }
    else{
    
        if([[[NSUserDefaults standardUserDefaults]valueForKey:@"MailMerge"]isEqualToString:@"On"])
        {
            strMessage=[NSString stringWithFormat:@"Dear [%@]",objappdel.ClientNameForEmail];
            [strMessage retain];
            
        }
    }

      if([objappdel.strselect isEqualToString:@"Birthday"])
      {
          strTOemail=[strTOemail stringByAppendingFormat:@"%@,",objappdel.strMessage];
           [strTOemail retain];
      
      }

    if([objappdel.strselect isEqualToString:@"Absentees"])
    {
       strTOemail=[strTOemail stringByAppendingFormat:@"%@,",objappdel.strMessage];
         [strTOemail retain];
        
    }
    [tblemail reloadData];
    
    
}
-(IBAction)Send{
    
    UIActionSheet *action=[[UIActionSheet alloc]initWithTitle:@"" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Send & Save as Template" otherButtonTitles:@"Send Only", nil];
    
    [action showInView:self.view];
    
     [action release];
    
   }
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex    {
    NSLog(@"%d",buttonIndex);
    if(buttonIndex  ==0)
    {
    
    
        
        
        [self SendEmail];
        [self AddinTemplate];
    
    }
if(buttonIndex==1)
{
    [self SendEmail];
    
    

}


}
-(void)SendEmail{


    arremaildata=[[NSMutableArray alloc]init];
    
    
    
    
    CustomCellForMail *cell;
	
    for(int i=0;i<3;i++)
    {
        
        
        cell = (CustomCellForMail *)[tblemail cellForRowAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
        NSLog(@"Value%d%@",i,cell.txtValue.text);
        if([cell.txtValue.text isEqualToString:@""]||[cell.txtValue.text isEqualToString:@"(null)"]||cell.txtValue.text==nil)
        {
            cell.txtValue.text=@" ";
            
        }
        [arremaildata addObject:cell.txtValue.text];
        
    }
    
    
    cell = (CustomCellForMail *)[tblemail cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:1]];
    if([cell.txtmsg.text isEqualToString:@""])
    {
        cell.txtmsg.text=@" ";
        
    }
    NSLog(@"Value%@",cell.txtmsg.text);
    
    [arremaildata   addObject:cell.txtValue.text];
    
    NSString *strToEmails;
    strToEmails=[arremaildata objectAtIndex:0];
    NSString *strCCEmails;
strCCEmails=@"";
    
    if([arremaildata count]>0){
    strCCEmails=[arremaildata objectAtIndex:1];
    }
    NSString *stremails;
    stremails=[strToEmails stringByAppendingFormat:@"%@",strCCEmails];
    
    stremails=[stremails stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    
    
    
    strSubjectTect=[arremaildata objectAtIndex:2];    strmessabges=[arremaildata objectAtIndex:3];
    
    
    //    NSLog(@"To%@BCC%@Subj%@Msg%@",txtto.text,txtcc.text,txtsubj.text,txtmsg.text);
    //   // http://openxcellaus.info/HairStyle/send_mail.php?to=tanna.hardik@gmail.com,openexcellwebservices@gmail.com
    //    
    //    NSString *stremails;
    //    stremails=[txtto.text stringByAppendingFormat:@"%@",txtcc.text];
    //    
    //   // NSString *text = (NSString *) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)stremails, NULL, CFSTR(":/?#[]@!$&’()*+,;="), kCFStringEncodingUTF8);
    NSString *text1 = (NSString *) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)strmessabges, NULL, CFSTR(":/?#[]@!$&’()*+,;="), kCFStringEncodingUTF8);
    NSString *text2 = (NSString *) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)strSubjectTect, NULL, CFSTR(":/?#[]@!$&’()*+,;="), kCFStringEncodingUTF8);
    //    
    //    
    
    NSString *urlString = [NSString stringWithFormat:@"http://openxcellaus.info/HairStyle/send_mail.php?to=%@&mail_body=%@&subject=%@",stremails,text1,text2];
    //    
    //    [text1 release];
    //    [text2 release];
    //    
    //    
    
    
    
    //  NSLog(@"%@",urlString);
    
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    
    parser= [[JSONParser alloc] initWithRequestForThread:request sel:@selector(datafatch:) andHandler:self] ;

}
-(void)datafatch:(NSDictionary*)dictionary{
        
        NSLog(@"%@",dictionary);
    
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Message" message:[dictionary valueForKey:@"msg"] delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    [alert show];
    [alert release];
    
    
    }
-(IBAction)click{


}
-(void)AddinTemplate{

    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"Hairstyle.sqlite"];
	
	if (sqlite3_open([path UTF8String], &database) == SQLITE_OK) 
	{
		
		static sqlite3_stmt *statement;
		statement = nil;
		
		
		const char *sql="insert into EMailTemp(Subject,Message) values(?,?)";
		
		if(sqlite3_prepare_v2(database, sql , -1, &statement, NULL) == SQLITE_OK)
		{
			
            
			sqlite3_bind_text(statement, 1, [strSubjectTect UTF8String], -1, SQLITE_TRANSIENT);
			sqlite3_bind_text(statement, 2, [strmessabges UTF8String], -1, SQLITE_TRANSIENT);
			
		}
		else
		{
			
			NSAssert1(0, @"Error while creating insert statement. '%s'", sqlite3_errmsg(database));
		}
		
		if(sqlite3_step(statement) == SQLITE_DONE) 
		{
			sqlite3_finalize(statement);
			
			
		}
		else
		{
			NSAssert1(0, @"Error while inserting. '%s'", sqlite3_errmsg(database));
		}
		sqlite3_close(database);
		
	}
	else 
	{
		sqlite3_close(database);
		NSAssert1(0, @"Failed to open database with message '%s'.", sqlite3_errmsg(database));
	}
	


}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex   {

    [self.navigationController  popViewControllerAnimated:YES];
    

}
- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
     [objcontact release];
    [parser release];
    
}


@end
