MONGO_HOST = 'localhost'
MONGO_PORT = 27017
MONGO_USERNAME = 'we_will'
MONGO_PASSWORD = 'c4rlh4ck$'
MONGO_DBNAME = 'bet_you_wont'
XML = False

RESOURCE_METHODS = ['GET', 'POST', 'DELETE']

ITEM_METHODS = ['GET', 'PATCH', 'PUT', 'DELETE']

user_schema = {
  'firstname':{
    'type':'string',
    'required':True,
  },
  'lastname':{
    'type':'string',
    'required':True,   
  },
  'username':{
    'type':'string',
    'required':True,
    'unique':True,
  },
  'challenges':{
    'type':'list',
  },
  'statistics':{
    'type':'list',
  },  
  'friends':{
    'type':'list',
  },
  'pic':{
    'type':'media',
  },
}

challenge_schema = {
  'from':{
    'type':'string',
    'required':True,
  },
  'to':{
    'type':'string',
    'required':True,
  },
  'description':{
    'type':'string',
    'maxlength':250,
    'required':True,
  },
  'end_date':{
    'type':'datetime',
  },
  'will_votes':{
    'type':'integer',
  },
  'wont_votes':{
    'type':'integer',
  },
  'public':{
    'type':'boolean',
  },
  'complete':{
    'type':'boolean',
  },
  'photo':{
    'type':'list',
  },
}

user = {
  'item_title':'user',

  'additional_lookup':{
    'url':'regex("[\w]+")',
    'field':'username'
  }, 

  'schema': user_schema
}

challenge = {
  'item_title':'challenge',
  'schema': challenge_schema
}

DOMAIN = {
  'user':user,
  'challenge':challenge,
  
}
