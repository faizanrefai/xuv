//
//  EmailSetting.m
//  Hiar_Style_New
//
//  Created by Vivek Rajput on 8/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EmailSetting.h"

#import "SettingHome.h"
static const CGFloat MINIMUM_SCROLL_FRACTION = 0.2;
static const CGFloat MAXIMUM_SCROLL_FRACTION = 0.8;
static const CGFloat KEYBOARD_ANIMATION_DURATION = 0.3;

@implementation EmailSetting

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
-(void)viewWillAppear:(BOOL)animated{
    objappdel=(Hiar_Style_NewAppDelegate *)[[UIApplication sharedApplication]delegate];
    txtSignature.text=[[NSUserDefaults standardUserDefaults]valueForKey:@"Signature"];
    txtSignature.layer.cornerRadius = 7.0;
    pickerView1.hidden=TRUE;

}
- (void)viewDidLoad {
    [super viewDidLoad];
    pickerView1.hidden=TRUE;
    
	self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];

	self.title=@"E-Mail Setting";
	tblcontactset1 = [[UITableView alloc]initWithFrame:CGRectMake(10, 70, 300,200) style:UITableViewStyleGrouped];
	//[RegScroll addSubview:countryTable];
	tblcontactset1.delegate=self;
	tblcontactset1.dataSource=self;
	tblcontactset1.backgroundColor=[UIColor clearColor];
	[self.view addSubview:tblcontactset1];
	tblcontactset1.hidden=FALSE;
	tblcontactset1.scrollEnabled=FALSE;
	
		
}
#pragma Mark TableView #pragma mark -

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	
			return 3;
	
	
	
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier] autorelease];
        
        
        CGRect nameLabelRect = CGRectMake(115,12,140,20);
		UILabel *nameLabel = [[UILabel alloc] initWithFrame:nameLabelRect];		
		nameLabel.tag=kNameValueTag;
 		nameLabel.backgroundColor=[UIColor clearColor];
		nameLabel.textColor=[UIColor blackColor];
        
		nameLabel.textAlignment = UITextAlignmentRight;
		nameLabel.font = [UIFont fontWithName:@"Arial" size:14];
		[cell.contentView addSubview: nameLabel];
		[nameLabel release];		

        
		onoff = [[UISwitch alloc] initWithFrame:  CGRectMake(190,10,79,27)];
        
        [onoff addTarget: self action: @selector(flip:) forControlEvents: UIControlEventValueChanged];
        onoff.tag=indexPath.row;
        
        [cell.contentView addSubview:onoff];
        [onoff release];
        
    }
	cell.selectionStyle=UITableViewCellSelectionStyleNone;
    UILabel *name = (UILabel *)[cell.contentView viewWithTag:kNameValueTag];
    
    //cell.textLabel.font = [UIFont fontWithName:@"Arial" size:17];
    
    name.font = [UIFont fontWithName:@"Arial" size:14];
   
    name.textColor=[UIColor blueColor];
    
    
    cell.textLabel.font=[UIFont fontWithName:@"Arial" size:14.0];
    cell.textLabel.font=[UIFont boldSystemFontOfSize:14.0];

    
			
		switch (indexPath.row) {
			case 0:
				cell.textLabel.text=@"Birthday Alerts";
                name.text=[[NSUserDefaults standardUserDefaults]valueForKey:@"BirthdayReminder"];
                onoff.hidden=TRUE;
                cell.accessoryType =UITableViewCellAccessoryDisclosureIndicator;
				break;
			case 1:
				cell.textLabel.text=@"Absentee Alerts";
                name.text=[[NSUserDefaults standardUserDefaults]valueForKey:@"EmailReminder"];
                onoff.hidden=TRUE;
                cell.accessoryType =UITableViewCellAccessoryDisclosureIndicator;
                break;
			case 2:
				cell.textLabel.text=@"Mail merge";
                  onoff.hidden=FALSE;
                cell.accessoryType =UITableViewCellAccessoryNone;
               
                if([[[NSUserDefaults standardUserDefaults]valueForKey:@"MailMerge"] isEqualToString:@"On"])
                {
                    onoff.on=YES;
                    
                    
                
                }
                else{
                    onoff.on=FALSE;
                    
                
                }
				break;
				
			default:
				break;
				
		}
		return cell;
		
		
	
	
	
	// Configure the cell.
	
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath  {

    switch (indexPath.row) {
        case 0:
            selectedRow=0;
            pickerView1.hidden=FALSE;
            
            arrlist=nil;
            arrlist=[[NSMutableArray alloc]initWithObjects:@"Off",@"At time of event",@"1 day prior",@"2 days prior",@"1 week prior",@"2 weeks prior",@"3 weeks prior",@"4 weeks prior", nil];
            [pickerView1 reloadAllComponents];
            
            
            break;
        case 1:
			selectedRow=1;
            pickerView1.hidden=FALSE;
            
            arrlist=nil;
            arrlist=[[NSMutableArray alloc]initWithObjects:@"Off",@"After 30 days",@"After 60 days",@"After 90 days",@"After 120 days", nil];
            [pickerView1 reloadAllComponents];
            
            break;
        case 2:
			selectedRow=2;
            pickerView1.hidden=TRUE;
            
            
            
            break;
            
        default:
            break;
            
    }



}
-(IBAction)flip:(id)sender{
if(onoff.on==TRUE)
{
    [[NSUserDefaults standardUserDefaults]setValue:@"On" forKey:@"MailMerge"];
    [[NSUserDefaults standardUserDefaults] synchronize];

}
else{
    [[NSUserDefaults standardUserDefaults]setValue:@"Off" forKey:@"MailMerge"];
    [[NSUserDefaults standardUserDefaults] synchronize];

}
    // [tblcontactset1 reloadData];
    
}
-(IBAction)click{
    [self.navigationController popViewControllerAnimated:YES];
  	
	
}
#pragma Mark TextView

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range 
 replacementText:(NSString *)text
{
	
	// Any new character added is passed in as the "text" parameter
    if ([text isEqualToString:@"\n"]) {
        // Be sure to test for equality using the "isEqualToString" message
        [textView resignFirstResponder];
		
        // Return FALSE so that the final '\n' character doesn't get added
        return FALSE;
    }
    // For any other character return TRUE so that the text gets added to the view
    return TRUE;
}

-(void) textViewDidBeginEditing:(UITextView *)textView{
    
	CGRect textFieldRect =[self.view.window convertRect:textView.bounds fromView:textView];
	CGRect viewRect =[self.view.window convertRect:self.view.bounds fromView:self.view];
	
	CGFloat midline = textFieldRect.origin.y + 1.0 * textFieldRect.size.height;
	CGFloat numerator =midline - viewRect.origin.y- MINIMUM_SCROLL_FRACTION * viewRect.size.height;
	CGFloat denominator =(MAXIMUM_SCROLL_FRACTION - MINIMUM_SCROLL_FRACTION)* viewRect.size.height;
	CGFloat heightFraction = numerator / denominator;
	
	animatedDistance = floor(162.0 * heightFraction);
	
	CGRect viewFrame = self.view.frame;
	
	viewFrame.origin.y -= animatedDistance;
	
	[UIView beginAnimations:nil context:NULL];
	[UIView setAnimationBeginsFromCurrentState:YES];
	[UIView setAnimationDuration:KEYBOARD_ANIMATION_DURATION];
	
	[self.view setFrame:viewFrame];
    [UIView commitAnimations];   
    
}
-(void) textViewDidEndEditing:(UITextView *)textView{
	//CGRect viewFrame = ;
	self.view.frame=CGRectMake(0, 0, 320, 460);
    
	//self.view.frame;
//	viewFrame.origin.y += animatedDistance;
	
	    [UIView commitAnimations];  
    
    [[NSUserDefaults standardUserDefaults]setValue:txtSignature.text forKey:@"Signature"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    
    
    [txtSignature resignFirstResponder];
    [textView resignFirstResponder];
    
	
	
}
#pragma Mark Pickerview #pragma mark -

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;
{
    
    return 1;
    
     

}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
    if(selectedRow==0)
    {
        [[NSUserDefaults standardUserDefaults]setValue:[arrlist objectAtIndex:row] forKey:@"BirthdayReminder"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [tblcontactset1 reloadData];
        if([[[NSUserDefaults standardUserDefaults] valueForKey:@"Nottification"] isEqualToString:@"On"])
        {
            [objappdel SetNottification];
            
        }
        else{
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"Message" message:@"Please Turn On Set Nottification" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alert1 show];
            [alert1 release];
            [[NSUserDefaults standardUserDefaults]setValue:@"Off" forKey:@"BirthdayReminder"];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }
        

    }   
    else
    {
        [[NSUserDefaults standardUserDefaults]setValue:[arrlist objectAtIndex:row] forKey:@"EmailReminder"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [tblcontactset1 reloadData];
        if([[[NSUserDefaults standardUserDefaults] valueForKey:@"Nottification"] isEqualToString:@"On"])
        {
            [objappdel SetEmailNottification];
            
        }
        else{
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"Message" message:@"Please Turn On Set Nottification" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [alert1 show];
            [alert1 release];
            [[NSUserDefaults standardUserDefaults]setValue:@"Off" forKey:@"EmailReminder"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            
        }
        
        

    }  
    
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;
{
    return [arrlist count];
	
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component;
{
    return [arrlist objectAtIndex:row];	
}
/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/
#pragma Mark nottification -



//- (void)scheduleNotificationWithItem:(NSDictionary*)item  {
//    
//    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
//    
//    if (localNotification == nil)   return;
//    
//    localNotification.fireDate =  [item valueForKey:@"FIRE_TIME_KEY"];
//    
//    localNotification.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"GMT"];
//    
//    localNotification.alertBody = [NSString stringWithFormat:NSLocalizedString(@"%@", nil), [item valueForKey:@"NOTIFICATION_MESSAGE_KEY"]];
//    
//    localNotification.alertAction = NSLocalizedString(@"View Details", nil);
//    
//    localNotification.soundName = UILocalNotificationDefaultSoundName;
//    
//    localNotification.userInfo = item;
//    
//    localNotification.repeatInterval = NSDayCalendarUnit;
//    
//    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
//    
//    [localNotification release];
//}
//




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
}


@end
