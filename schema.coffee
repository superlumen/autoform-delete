@C = new Mongo.Collection 'c'

S = new SimpleSchema
  arr:
    type: [Object]
  'arr.$.first':
    type: String
  'arr.$.second':
    type: String

C.attachSchema S

if Meteor.isServer
  unless C.findOne()
    C.insert
      arr: [
        first: 'a'
        second: 'b'
      ,
        first: 'c'
        second: 'd'
      ,
        first: 'e'
        second: 'f'
      ,
        first: 'g'
        second: 'h'
      ,
        first: 'i'
        second: 'j'
      ]
