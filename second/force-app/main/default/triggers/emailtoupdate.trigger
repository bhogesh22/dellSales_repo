trigger emailtoupdate on Contact (before insert) {
list<contact>conlist = trigger.new;
    list<user>userlist = [select id,username,email from user];
    for(contact con:conlist){
        for(user usr:userlist){
    if(con.Phone==usr.MobilePhone){
    con.Email=usr.SenderEmail;
    }
}
    }
}