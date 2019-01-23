# using SendGrid's Ruby Library
# https://github.com/sendgrid/sendgrid-ruby
# This script builds a json payload for SG v3 mail send

require 'sendgrid-ruby'
include SendGrid


def asm

  puts ""
  puts "Enter a group_id:"
  group_id = gets.chomp
  puts ""
  puts "Enter the groups you would like displayed (example: 1,2,3):"
  groups_to_display = gets.chomp

  #create asm payload
  asm_payload = "\"asm\": {\"group_id\": #{group_id}, \"groups_to_display\": [#{groups_to_display}] } "
  asm_payload2 = ", \"asm\": {\"group_id\": #{group_id}, \"groups_to_display\": [#{groups_to_display}] } "

  if @payload.empty?
    @payload << asm_payload
  else 
    @payload << asm_payload2
  end

end

def asm_dummy

  puts "ASM has been added successfully!"

  #create asm payload
  asm_payload = "\"asm\": {\"group_id\": 3, \"groups_to_display\": [1, 2, 3] } "
  asm_payload2 = ", \"asm\": {\"group_id\": 3, \"groups_to_display\": [1, 2, 3] } "

  if @payload.empty?
    @payload << asm_payload
  else 
    @payload << asm_payload2
  end

end


def batch
  puts ""
  puts "Enter a batch_id:"
  batch_id = gets.chomp

  batch_id_payload = "\"batch_id\": \"#{batch_id}\""
  batch_id_payload2 = ", \"batch_id\": \"#{batch_id}\""


  if @payload.empty?
    @payload << batch_id_payload
  else 
    @payload << batch_id_payload2
  end

end

def batch_dummy
  puts "A batch_id has been added successfully!"

  batch_id_payload = "\"batch_id\": \"YTk0NmUyODQtMWE2Yy0xMWU5LTg2NDYtNTI1NDAwZGQzN2EwLTc3ZmZhMTIzNQ\""
  batch_id_payload2 = ", \"batch_id\": \"YTk0NmUyODQtMWE2Yy0xMWU5LTg2NDYtNTI1NDAwZGQzN2EwLTc3ZmZhMTIzNQ\""


  if @payload.empty?
    @payload << batch_id_payload
  else 
    @payload << batch_id_payload2
  end

end


def categories

  array = []
  categories = []

  puts ""
  puts "Enter your categories separated by commas (example: category1, category2, category3):"
  userinput = gets.chomp
  array = userinput.split(/[\s,]+/)

  array.each do | category |
    categories << "\"#{category}\""
  end
  
  categories = categories.join(",")
  categories_payload = "\"categories\": [#{categories}]"
  categories_payload2 = " ,\"categories\": [#{categories}]"


  if @payload.empty?
    @payload << categories_payload
  else 
    @payload << categories_payload2
  end

end

def categories_dummy

  puts "Categories have been added successfully!"  
  
  categories_payload = "\"categories\": [\"category1\",\"category2\",\"category3\"]"
  categories_payload2 = " ,\"categories\": [\"category1\",\"category2\",\"category3\"]"


  if @payload.empty?
    @payload << categories_payload
  else 
    @payload << categories_payload2
  end

end


def custom_args
  
  array = []
  arguments = []
  
  puts ""
  puts "Enter your custom args using the format in the example: (\"custom_arg1\" : \"value1\", \"custom_arg2\" : \"value2\", \"custom_arg3\" : \"value3\")"
  userinput = gets.chomp

  array = userinput.split(",")

  array.each do | argument |
    #argument.strip
    arguments << "#{argument.strip}"
  end

  arguments = arguments.join(",")
  arguments_payload = "\"custom_args\": {#{arguments} }"
  arguments_payload2 = " ,\"custom_args\": {#{arguments} }"

  if @payload.empty?
    @payload << arguments_payload
  else 
    @payload << arguments_payload2
  end

end

def custom_args_dummy
  
  puts "Custom Arguments have been added successfully!"  

  arguments_payload = "\"custom_args\": {\"custom_arg1\" : \"value1\", \"custom_arg2\" : \"value2\", \"custom_arg3\" : \"value3\" }"
  arguments_payload2 = " ,\"custom_args\": {\"custom_arg1\" : \"value1\", \"custom_arg2\" : \"value2\", \"custom_arg3\" : \"value3\" }"

  if @payload.empty?
    @payload << arguments_payload
  else 
    @payload << arguments_payload2
  end

end


def to

  puts ""
  puts "Enter the To email:"
  to_email = gets.chomp

  puts ""
  puts "Enter the To name:"
  to_name = gets.chomp

  to_payload = "\"to\": {\"email\": \"#{to_email}\", \"name\": \"#{to_name}\"}"
  to_payload2 = " ,\"to\": {\"email\": \"#{to_email}\", \"name\": \"#{to_name}\"}"

  if @payload.empty?
    @payload << to_payload
  else 
    @payload << to_payload2
  end
end

def to_dummy

  puts "The TO email has been added successfully!"

  to_payload = "\"to\": {\"email\": \"sendgridtesting@gmail.com\", \"name\": \"SendGrid Support\"}"
  to_payload2 = " ,\"to\": {\"email\": \"sendgridtesting@gmail.com\", \"name\": \"SendGrid Support\"}"

  if @payload.empty?
    @payload << to_payload
  else 
    @payload << to_payload2
  end
end

def from

  puts ""
  puts "Enter the From email:"
  from_email = gets.chomp

  puts ""
  puts "Enter the From name:"
  from_name = gets.chomp

  from_payload = "\"from\": {\"email\": \"#{from_email}\", \"name\": \"#{from_name}\"}"
  from_payload2 = " ,\"from\": {\"email\": \"#{from_email}\", \"name\": \"#{from_name}\"}"

  if @payload.empty?
    @payload << from_payload
  else 
    @payload << from_payload2
  end
end

def from_dummy

  puts "The FROM email has been added successfully!"


  from_payload = "\"from\": {\"email\": \"theoffice@sendgrid.com\", \"name\": \"Michael Scott\"}"
  from_payload2 = " ,\"from\": {\"email\": \"theoffice@sendgrid.com\", \"name\": \"Michael Scott\"}"

  if @payload.empty?
    @payload << from_payload
  else 
    @payload << from_payload2
  end
end

def reply_to

  puts ""
  puts "Enter the reply-to email:"
  reply_to_email = gets.chomp

  puts ""
  puts "Enter the reply-to name:"
  reply_to_name = gets.chomp

  reply_to_payload = "\"reply_to\": {\"email\": \"#{reply_to_email}\", \"name\": \"#{reply_to_name}\"}"
  reply_to_payload2 = " ,\"reply_to\": {\"email\": \"#{reply_to_email}\", \"name\": \"#{reply_to_name}\"}"

  if @payload.empty?
    @payload << reply_to_payload
  else 
    @payload << reply_to_payload2
  end

end

def reply_to_dummy

  puts "The REPLY-TO email has been added successfully!"

  reply_to_payload = "\"reply_to\": {\"email\": \"noreply@sendgrid.com\", \"name\": \"Not Here\"}"
  reply_to_payload2 = " ,\"reply_to\": {\"email\": \"noreply@sendgrid.com\", \"name\": \"Not Here\"}"

  if @payload.empty?
    @payload << reply_to_payload
  else 
    @payload << reply_to_payload2
  end

end

def ip_pool
  puts ""
  puts "Enter the IP pool name:"
  ip_pool_name = gets.chomp

  ip_pool_payload = "\"ip_pool_name\": \"#{ip_pool_name}\""
  ip_pool_payload2 = " ,\"ip_pool_name\": \"#{ip_pool_name}\""

  if @payload.empty?
    @payload << ip_pool_payload
  else 
    @payload << ip_pool_payload2
  end

end

def ip_pool_dummy

  puts "The IP Pool has been added successfully!"

  ip_pool_payload = "\"ip_pool_name\": \"marketing email pool\""
  ip_pool_payload2 = " ,\"ip_pool_name\": \"marketing email pool\""

  if @payload.empty?
    @payload << ip_pool_payload
  else 
    @payload << ip_pool_payload2
  end

end


def subject
  puts ""
  puts "Enter the subject line:"
  subject = gets.chomp

  subject_payload = "\"subject\": \"#{subject}\""
  subject_payload2 = " ,\"subject\": \"#{subject}\""

  if @payload.empty?
    @payload << subject_payload
  else 
    @payload << subject_payload2
  end

end

def subject_dummy

  puts "The Subject has been added successfully!"
  
  subject_payload = "\"subject\": \"This is a test message sent from SendGrid Support!\""
  subject_payload2 = " ,\"subject\": \"This is a test message sent from SendGrid Support!\""

  if @payload.empty?
    @payload << subject_payload
  else 
    @payload << subject_payload2
  end

end


def template
  puts ""
  puts "Enter the template_id:"
  template_id = gets.chomp

  template_payload = "\"template_id\": \"#{template_id}\""
  template_payload2 = " ,\"template_id\": \"#{template_id}\""

  if @payload.empty?
    @payload << template_payload
  else 
    @payload << template_payload2
  end
end


def template_dummy

  puts "A Template-id has been added successfully!"

  template_payload = "\"template_id\": \"d-751f9d5dd84f4edab77cf56edc65cd33\""
  template_payload2 = " ,\"template_id\": \"d-751f9d5dd84f4edab77cf56edc65cd33\""

  if @payload.empty?
    @payload << template_payload
  else 
    @payload << template_payload2
  end
end


def send_at
  puts ""
  puts "Enter the send time in EPOCH format:"
  send_at = gets.chomp

  send_at_payload = "\"send_at\": \"#{send_at}\""
  send_at_payload2 = " ,\"send_at\": \"#{send_at}\""

  if @payload.empty?
    @payload << send_at_payload
  else 
    @payload << send_at_payload2
  end
end

def send_at_dummy

  puts "A send_at time has been added!"

  send_at_payload = "\"send_at\": \"1547740424\""
  send_at_payload2 = " ,\"send_at\": \"1547740424\""

  if @payload.empty?
    @payload << send_at_payload
  else 
    @payload << send_at_payload2
  end
end

def content
puts ""
puts "Content has been added!"

  content_payload = "\"content\": [ {\"type\": \"text/html\", \"value\": \"<html><p>Hello, world!</p><img src=https://pbs.twimg.com/profile_images/1013810799347814401/Qm4aPvEh_400x400.jpg></img></html>\"}]"
  content_payload2 = " ,\"content\": [ {\"type\": \"text/html\", \"value\": \"<html><p>Hello, world!</p><img src=https://pbs.twimg.com/profile_images/1013810799347814401/Qm4aPvEh_400x400.jpg></img></html>\"}]"

  if @payload.empty?
    @payload << content_payload
  else 
    @payload << content_payload2
  end
end



def mail_settings

  choices = []
  mail_settings = ""

  puts ""
  puts "Which mail settings would you like to add?"
  puts "Enter in the number separated by commas for your selection (example: 1,4,5,10)"
  puts ""
  puts "1. BCC"
  puts "2. BYPASS LIST MANAGEMENT"
  puts "3. FOOTER"
  puts "4. SANDBOX MODE"
  puts "5. SPAM CHECK"

  userinput = gets.chomp
  puts ""
  choices = userinput.split(/[\s,]+/)

  choices.each do | choice |

  if choice == "1"
    puts ""
    puts "Enter a bcc address:"
    bcc_email = gets.chomp

    bcc_payload = "\"bcc\": { \"email\": \"#{bcc_email}\", \"enable\": true }"
    bcc_payload2 = " ,\"bcc\": { \"email\": \"#{bcc_email}\", \"enable\": true }"

    if mail_settings.empty?
      mail_settings << bcc_payload
    elsif 
      mail_settings << bcc_payload2
    end

  elsif choice == "2"
    puts "Bypass list management has been enabled successfully!"

    bypass_payload = "\"bypass_list_management\": { \"enable\": true}"
    bypass_payload2 = " ,\"bypass_list_management\": { \"enable\": true}"

    if mail_settings.empty?
      mail_settings << bypass_payload
    else 
      mail_settings << bypass_payload2
    end

  elsif choice == "3"
    puts "A footer has been enabled and added with dummy content!"

    footer_payload = "\"footer\": { \"enable\": true, \"html\": \"<p>This is a <br>test</br> footer.</p>}\", \"text\": \"This is your footer!\"}"
    footer_payload2 = " ,\"footer\": { \"enable\": true, \"html\": \"<p>This is a <br>test</br> footer.</p>}\", \"text\": \"This is your footer!\"}"

    if mail_settings.empty?
      mail_settings << footer_payload
    else 
      mail_settings << footer_payload2
    end

    elsif choice == "4"
    puts "Sandbox mode has been enabled successfully!"


    sandbox_payload = "\"sandbox_mode\": { \"enable\": true}"
    sandbox_payload2 = " ,\"sandbox_mode\": { \"enable\": true}"

    if mail_settings.empty?
      mail_settings << sandbox_payload
    else 
      mail_settings << sandbox_payload2
    end

    elsif choice == "5"

    puts ""
    puts "The threshold used to determine if your content qualifies as spam on a scale from 1 to 10, with 10 being most strict, or most likely to be considered as spam."
    puts "Set the spam check threshold:"
    
    threshold = gets.chomp
    
    puts ""
    puts "An Inbound Parse URL that you would like a copy of your email along with the spam report to be sent to."
    puts "Do you want to add a parse URL for spam check? (y/n)"
    
    parse = gets.chomp.downcase
    
    if parse == "y" || parse == "yes"
      puts "Enter in the URL:"
      url = gets.chomp
    end

    spam_check_payload = "\"spam_check\": { \"enable\": true, \"post_to_url\":\"#{url}\", \"threshold\":\"#{threshold}\"}"
    spam_check_payload2 = " ,\"spam_check\": { \"enable\": true, \"post_to_url\":\"#{url}\", \"threshold\":\"#{threshold}\"}"

    if mail_settings.empty?
      mail_settings << spam_check_payload
    else 
      mail_settings << spam_check_payload2
    end

  end
end

final_mail_settings = "\"mail_settings\": {#{mail_settings}}"
final_mail_settings2 = " ,\"mail_settings\": {#{mail_settings}}"

  #add to payload
  if @payload.empty?
    @payload << "#{final_mail_settings}"
  else 
    @payload << "#{final_mail_settings2}"
  end
    
end


def mail_settings_dummy

  choices = []
  mail_settings = ""

  puts ""
  puts "Which mail settings would you like to add?"
  puts "Enter in the number separated by commas for your selection (example: 1,4,5,10)"
  puts ""
  puts "1. BCC"
  puts "2. BYPASS LIST MANAGEMENT"
  puts "3. FOOTER"
  puts "4. SANDBOX MODE"
  puts "5. SPAM CHECK"

  
  userinput = gets.chomp
  choices = userinput.split(/[\s,]+/)

  choices.each do | choice |
  if choice == "1"
    puts "A BCC email has been added successfully!"

    bcc_payload = "\"bcc\": { \"email\": \"sendgridtesting@yahoo.com\", \"enable\": true }"
    bcc_payload2 = " ,\"bcc\": { \"email\": \"sendgridtesting@yahoo.com\", \"enable\": true }"

      if mail_settings.empty?
        mail_settings << bcc_payload
      elsif 
        mail_settings << bcc_payload2
      end

  elsif choice == "2"
    puts "Bypass list management has been enabled successfully!"

    bypass_payload = "\"bypass_list_management\": { \"enable\": true}"
    bypass_payload2 = " ,\"bypass_list_management\": { \"enable\": true}"

      if mail_settings.empty?
        mail_settings << bypass_payload
      else 
        mail_settings << bypass_payload2
      end

  elsif choice == "3"
    puts "A footer has been added successfully!"


    footer_payload = "\"footer\": { \"enable\": true, \"html\": \"<p>This is a <br>test</br> footer.</p>}\", \"text\": \"This is your footer!\"}"
    footer_payload2 = " ,\"footer\": { \"enable\": true, \"html\": \"<p>This is a <br>test</br> footer.</p>}\", \"text\": \"This is your footer!\"}"


    if mail_settings.empty?
      mail_settings << footer_payload
    else 
      mail_settings << footer_payload2
    end

    elsif choice == "4"
    puts "Sandbox mode has been enabled successfully!"


    sandbox_payload = "\"sandbox_mode\": { \"enable\": true}"
    sandbox_payload2 = " ,\"sandbox_mode\": { \"enable\": true}"

    if mail_settings.empty?
      mail_settings << sandbox_payload
    else 
      mail_settings << sandbox_payload2
    end

    elsif choice == "5"

    puts "Spam Check has been added successfully!"
    
  
    spam_check_payload = "\"spam_check\": { \"enable\": true, \"post_to_url\":\"http://post.sendgrid.com\", \"threshold\":\"3\"}"
    spam_check_payload2 = " ,\"spam_check\": { \"enable\": true, \"post_to_url\":\"http://post.sendgrid.com\", \"threshold\":\"3\"}"

    if mail_settings.empty?
      mail_settings << "#{spam_check_payload}"
    else 
      mail_settings << "#{spam_check_payload2}"
    end

  end
end

  final_mail_settings = "\"mail_settings\": {#{mail_settings}}"
  final_mail_settings2 = " ,\"mail_settings\": {#{mail_settings}}"

    #add to payload
    if @payload.empty?
      @payload << "#{final_mail_settings}"
    else 
      @payload << "#{final_mail_settings2}"
    end
  
end

def tracking_settings

  choices = []
  tracking_settings = ""

  puts ""
  puts "Which tracking settings would you like to add?"
  puts "Enter in the number separated by commas for your selection (example: 1,4,5,10)"
  puts ""
  puts "1. CLICK TRACKING"
  puts "2. OPEN TRACKING"
  puts "3. SUBSCRIPTION TRACKING"


  userinput = gets.chomp
  choices = userinput.split(/[\s,]+/)

  choices.each do | choice |

  if choice == "1"
    puts "Click tracking has been enabled and added to the payload successfully!"

    click_payload = "\"click_tracking\": { \"enable_text\": true, \"enable\": true }"
    click_payload2 = " ,\"click_tracking\": { \"enable_text\": true, \"enable\": true }"

    if tracking_settings.empty?
      tracking_settings << click_payload
    elsif 
      tracking_settings << click_payload2
    end
 
 elsif choice == "2"
    puts "Open tracking has been enabled and added to the payload successfully!"
    puts ""
    puts "Do you want to add a substitution tag? (y/n)"

    tag = gets.chomp.downcase
    
    if tag == "y" || tag == "yes"
      puts "Enter your substitution tag:"
      subtag = gets.chomp
    end

    open_payload = "\"open_tracking\": { \"enable\": true, \"substitution_tag\": \"#{subtag}\" }"
    open_payload2 = " ,\"open_tracking\": { \"enable\": true, \"substitution_tag\": \"#{subtag}\" }"

    if tracking_settings.empty?
      tracking_settings << open_payload
    elsif 
      tracking_settings << open_payload2
    end

   elsif choice == "3"
    puts "Subscription tracking has been enabled and added to the payload successfully!"
    puts ""
    puts "Do you want to add a substitution tag? (y/n)"

    tag2 = gets.chomp.downcase
    
    if tag2 == "y" || tag2 == "yes"
      puts "Enter your substitution tag:"
      subtag2 = gets.chomp
    end

    subscription_payload = "\"subscription_tracking\": { \"enable\": true, \"html\": \"If you would like to unsubscribe and stop receiving these emails <% clickhere %>.\", \"text\": \"If you would like to unsubscribe and stop receiveing these emails <% click here %>.\", \"substitution_tag\": \"#{subtag2}\" }"
    subscription_payload2 = " ,\"subscription_tracking\": { \"enable\": true, \"html\": \"If you would like to unsubscribe and stop receiving these emails <% clickhere %>.\", \"text\": \"If you would like to unsubscribe and stop receiveing these emails <% click here %>.\", \"substitution_tag\": \"#{subtag2}\" }"

    if tracking_settings.empty?
      tracking_settings << subscription_payload
    elsif 
      tracking_settings << subscription_payload2
    end

  end
end

  final_tracking_settings = "\"tracking_settings\": {#{tracking_settings}}"
  final_tracking_settings2 = " ,\"tracking_settings\": {#{tracking_settings}}"

    #add to payload
    if @payload.empty?
      @payload << "#{final_tracking_settings}"
    else 
      @payload << "#{final_tracking_settings2}"
    end
  
end


def tracking_settings_dummy

  choices = []
  tracking_settings = ""

  puts ""
  puts "Which tracking settings would you like to add?"
  puts "Enter in the number separated by commas for your selection (example: 1,4,5,10)"
  puts ""
  puts "1. CLICK TRACKING"
  puts "2. OPEN TRACKING"
  puts "3. SUBSCRIPTION TRACKING"


  userinput = gets.chomp
  choices = userinput.split(/[\s,]+/)

  choices.each do | choice |

  if choice == "1"
    puts "Click tracking has been enabled and added to the payload successfully!"

    click_payload = "\"click_tracking\": { \"enable_text\": true, \"enable\": true }"
    click_payload2 = " ,\"click_tracking\": { \"enable_text\": true, \"enable\": true }"

    if tracking_settings.empty?
      tracking_settings << click_payload
    elsif 
      tracking_settings << click_payload2
    end
 
 elsif choice == "2"
    puts "Open tracking has been enabled and added to the payload successfully!"

    open_payload = "\"open_tracking\": { \"enable\": true, \"substitution_tag\": \"%my_sub_tag%\" }"
    open_payload2 = " ,\"open_tracking\": { \"enable\": true, \"substitution_tag\": \"%my_sub_tag%\" }"

    if tracking_settings.empty?
      tracking_settings << open_payload
    elsif 
      tracking_settings << open_payload2
    end

   elsif choice == "3"
    puts "subscription tracking has been enabled and added to the payload successfully!"
   
    subscription_payload = "\"subscription_tracking\": { \"enable\": true, \"html\": \"If you would like to unsubscribe and stop receiving these emails <% clickhere %>.\", \"text\": \"If you would like to unsubscribe and stop receiveing these emails <% click here %>.\", \"substitution_tag\": \"%my_sub_tag%\" }"
    subscription_payload2 = " ,\"subscription_tracking\": { \"enable\": true, \"html\": \"If you would like to unsubscribe and stop receiving these emails <% clickhere %>.\", \"text\": \"If you would like to unsubscribe and stop receiveing these emails <% click here %>.\", \"substitution_tag\": \"%my_sub_tag%\" }"

    if tracking_settings.empty?
      tracking_settings << subscription_payload
    elsif 
      tracking_settings << subscription_payload2
    end

  end
end

  final_tracking_settings = "\"tracking_settings\": {#{tracking_settings}}"
  final_tracking_settings2 = " ,\"tracking_settings\": {#{tracking_settings}}"

    #add to payload
    if @payload.empty?
      @payload << "#{final_tracking_settings}"
    else 
      @payload << "#{final_tracking_settings2}"
    end
  
end



def personalization_dummy

puts "A personalization block has been added to the payload successfully!"


personalization = "\"personalizations\": [{\"to\": [{\"email\": \"sendgridtesting@gmail.com\",\"name\": \"SendGrid Support Gmail\"}]},{\"to\": [{ \"email\": \"sendgridtesting@yahoo.com\",\"name\": \"SendGrid Support Yahoo\"}]},{\"to\": [{\"email\": \"sendgridtesting@hotmail.com\",\"name\": \"SendGrid Support Microsoft\"}]}]"
personalization2= " ,\"personalizations\": [{\"to\": [{\"email\": \"sendgridtesting@gmail.com\",\"name\": \"SendGrid Support Gmail\"}]},{\"to\": [{ \"email\": \"sendgridtesting@yahoo.com\",\"name\": \"SendGrid Support Yahoo\"}]},{\"to\": [{\"email\": \"sendgridtesting@hotmail.com\",\"name\": \"SendGrid Support Microsoft\"}]}]"

#add to payload
if @payload.empty?
  @payload << "#{personalization}"
else 
  @payload << "#{personalization2}"
end


end



#===============================================================================================================================================
#===============================================================================================================================================
# WHERE ALL IS DECIDED
#===============================================================================================================================================
#===============================================================================================================================================

@payload = ""
choices = []


puts ""

puts "This script will build a v3 json payload :)"
puts ""

puts "Do you want to use:"
puts "1. Custom Data"
puts "2. Dummy Data"

@data_type = gets.chomp


puts ""
puts "Which parameters do you want to build into your json payload?"
puts "Enter in the number separated by commas for your selection (example: 1,4,5,10)"
puts ""
puts "1. TO"
puts "2. FROM"
puts "3. REPLY-TO"
puts "4. SUBJECT LINE"
puts "5. CONTENT"
puts "6. BATCH_ID"
puts "7. CATEGORIES"
puts "8. CUSTOM ARGUMENTS"
puts "9. ASM"
puts "10. IP POOL"
puts "11. TEMPLATE"
puts "12. SEND AT"
puts "13. MAIL SETTINGS (footer, sandbox mode, spam check, bcc, bypass list management)"
puts "14. TRACKING SETTINGS (open, click, subscription)"
puts "15. PERSONALIZATION BLOCK"

userinput = gets.chomp
puts ""
choices = userinput.split(/[\s,]+/)


if @data_type == "1"
  choices.each do | choice |
    if choice == "1" 
      to
    elsif choice == "2"
      from
    elsif choice == "3"
      reply_to
    elsif choice == "4"
      subject
    elsif choice == "5"
      content
    elsif choice == "6"
      batch
    elsif choice == "7"
      categories
    elsif choice == "8"
      custom_args
    elsif choice == "9"
      asm
    elsif choice == "10"
      ip_pool
    elsif choice == "11"
      template
    elsif choice == "12"
      send_at
    elsif choice == "13"
      mail_settings
    elsif choice == "14"
        tracking_settings
    elsif choice == "15"
        personalization_dummy
    else
      puts "ERROR: Selection was not found"
    end
  end
elsif @data_type == "2"
  choices.each do | choice |
    if choice == "1" 
      to_dummy
    elsif choice == "2"
      from_dummy
    elsif choice == "3"
      reply_to_dummy
    elsif choice == "4"
      subject_dummy
    elsif choice == "5"
      content
    elsif choice == "6"
      batch_dummy
    elsif choice == "7"
      categories_dummy
    elsif choice == "8"
      custom_args_dummy
    elsif choice == "9"
      asm_dummy
    elsif choice == "10"
      ip_pool_dummy
    elsif choice == "11"
      template_dummy
    elsif choice == "12"
      send_at_dummy
    elsif choice == "13"
      mail_settings_dummy
    elsif choice == "14"
      tracking_settings_dummy
      elsif choice == "15"
        personalization_dummy
    else
      puts "ERROR: Selection was not found"
    end
  end
end

@final_payload = "{#{@payload}}"
    
puts ""
puts ""
puts "Here is your payload:"
puts ""
puts @final_payload
puts ""
puts ""

