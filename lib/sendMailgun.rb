class SendMailgun
   def send_simple_message
     RestClient.post "https://api:key-e7614b33a8eabdcb1a3d264ab3620f8c"\
       "@api.mailgun.net/v3/sandbox4dca7daf6d104fb589baeeb0939c74cc.mailgun.org/messages",
        :from => "Yu Liu <mailgun@sandbox4dca7daf6d104fb589baeeb0939c74cc.mailgun.org>",
        :to => "Yu Liu <yul.liuyu@gmail.com>",
        :subject => "Hello",
        :text => "Testing some Mailgun awesomness!"
    end
end 
    