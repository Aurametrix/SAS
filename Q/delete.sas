%LET delete_list = %str 
  ("Monica","Rachel","Phoebe","Chandler","Ross","Joey"); 
If name in (&delete_list) then delete;
