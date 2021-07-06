# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(
  first_name: 'Chris', 
  last_name: 'Lemus',
  business_name: 'ACME LLC',
  email: 'me@me.com',
  email_confirmation: 'me@me.com',
  password: 'Aaaaaaaa123',
  password_confirmation: 'Aaaaaaaa123',
)
business = Business.new(name: user[:business_name], owner: user)
business.save

Customer.create([
    {first_name:"John",last_name:"Doeiss",company_name:"true moo LLC",avatar:"",email:"jonny@me.coms",phone_mobile:"919-995-9955",phone_home:"800-794-4672",address1:"4621 may dr",address2:"suite d",city:"Raleigh",state:"CO",zip_code:27604,country:"USA",business_id:1},
    {first_name:"Koe",last_name:"Doeiss",company_name:"true moo LLC",avatar:"",email:"jonny@me.coms",phone_mobile:"919-995-9955",phone_home:"800-794-4672",address1:"4621 may dr",address2:"suite d",city:"Raleigh",state:"CO",zip_code:27604,country:"USA",business_id:1},
    {first_name:"Jose",last_name:"Doeiss",company_name:"true moo LLC",avatar:"",email:"jonny@me.coms",phone_mobile:"919-995-9955",phone_home:"800-794-4672",address1:"4621 may dr",address2:"suite d",city:"Raleigh",state:"CO",zip_code:27604,country:"USA",business_id:1},
    {first_name:"Mels",last_name:"Doeiss",company_name:"true moo LLC",avatar:"",email:"jonny@me.coms",phone_mobile:"919-995-9955",phone_home:"800-794-4672",address1:"4621 may dr",address2:"suite d",city:"Raleigh",state:"CO",zip_code:27604,country:"USA",business_id:1},
    {first_name:"May",last_name:"Doeiss",company_name:"true moo LLC",avatar:"",email:"jonny@me.coms",phone_mobile:"919-995-9955",phone_home:"800-794-4672",address1:"4621 may dr",address2:"suite d",city:"Raleigh",state:"CO",zip_code:27604,country:"USA",business_id:1},
    {first_name:"C",last_name:"Doeiss",company_name:"true moo LLC",avatar:"",email:"jonny@me.coms",phone_mobile:"919-995-9955",phone_home:"800-794-4672",address1:"4621 may dr",address2:"suite d",city:"Raleigh",state:"CO",zip_code:27604,country:"USA",business_id:1},
    {first_name:"Mar",last_name:"Doeiss",company_name:"true moo LLC",avatar:"",email:"jonny@me.coms",phone_mobile:"919-995-9955",phone_home:"800-794-4672",address1:"4621 may dr",address2:"suite d",city:"Raleigh",state:"CO",zip_code:27604,country:"USA",business_id:1},
    {first_name:"Whe",last_name:"Doeiss",company_name:"true moo LLC",avatar:"",email:"jonny@me.coms",phone_mobile:"919-995-9955",phone_home:"800-794-4672",address1:"4621 may dr",address2:"suite d",city:"Raleigh",state:"CO",zip_code:27604,country:"USA",business_id:1},
    {first_name:"May",last_name:"Doeiss",company_name:"true moo LLC",avatar:"",email:"jonny@me.coms",phone_mobile:"919-995-9955",phone_home:"800-794-4672",address1:"4621 may dr",address2:"suite d",city:"Raleigh",state:"CO",zip_code:27604,country:"USA",business_id:1},
    {first_name:"Son",last_name:"Doeiss",company_name:"true moo LLC",avatar:"",email:"jonny@me.coms",phone_mobile:"919-995-9955",phone_home:"800-794-4672",address1:"4621 may dr",address2:"suite d",city:"Raleigh",state:"CO",zip_code:27604,country:"USA",business_id:1},
    {first_name:"Michael",last_name:"Doeiss",company_name:"true moo LLC",avatar:"",email:"jonny@me.coms",phone_mobile:"919-995-9955",phone_home:"800-794-4672",address1:"4621 may dr",address2:"suite d",city:"Raleigh",state:"CO",zip_code:27604,country:"USA",business_id:1},
    {first_name:"Milla",last_name:"Doeiss",company_name:"true moo LLC",avatar:"",email:"jonny@me.coms",phone_mobile:"919-995-9955",phone_home:"800-794-4672",address1:"4621 may dr",address2:"suite d",city:"Raleigh",state:"CO",zip_code:27604,country:"USA",business_id:1},
    {first_name:"Maya",last_name:"Doeiss",company_name:"true moo LLC",avatar:"",email:"jonny@me.coms",phone_mobile:"919-995-9955",phone_home:"800-794-4672",address1:"4621 may dr",address2:"suite d",city:"Raleigh",state:"CO",zip_code:27604,country:"USA",business_id:1},
    {first_name:"Fratz",last_name:"Doeiss",company_name:"true moo LLC",avatar:"",email:"jonny@me.coms",phone_mobile:"919-995-9955",phone_home:"800-794-4672",address1:"4621 may dr",address2:"suite d",city:"Raleigh",state:"CO",zip_code:27604,country:"USA",business_id:1},
    {first_name:"Je",last_name:"Doeiss",company_name:"true moo LLC",avatar:"",email:"jonny@me.coms",phone_mobile:"919-995-9955",phone_home:"800-794-4672",address1:"4621 may dr",address2:"suite d",city:"Raleigh",state:"CO",zip_code:27604,country:"USA",business_id:1},
    {first_name:"Geral",last_name:"Doeiss",company_name:"true moo LLC",avatar:"",email:"jonny@me.coms",phone_mobile:"919-995-9955",phone_home:"800-794-4672",address1:"4621 may dr",address2:"suite d",city:"Raleigh",state:"CO",zip_code:27604,country:"USA",business_id:1},
    {first_name:"We",last_name:"Doeiss",company_name:"true moo LLC",avatar:"",email:"jonny@me.coms",phone_mobile:"919-995-9955",phone_home:"800-794-4672",address1:"4621 may dr",address2:"suite d",city:"Raleigh",state:"CO",zip_code:27604,country:"USA",business_id:1},
    {first_name:"Wamuy",last_name:"Doeiss",company_name:"true moo LLC",avatar:"",email:"jonny@me.coms",phone_mobile:"919-995-9955",phone_home:"800-794-4672",address1:"4621 may dr",address2:"suite d",city:"Raleigh",state:"CO",zip_code:27604,country:"USA",business_id:1},
    {first_name:"Wama",last_name:"Doeiss",company_name:"true moo LLC",avatar:"",email:"jonny@me.coms",phone_mobile:"919-995-9955",phone_home:"800-794-4672",address1:"4621 may dr",address2:"suite d",city:"Raleigh",state:"CO",zip_code:27604,country:"USA",business_id:1},
    {first_name:"Mama",last_name:"Doeiss",company_name:"true moo LLC",avatar:"",email:"jonny@me.coms",phone_mobile:"919-995-9955",phone_home:"800-794-4672",address1:"4621 may dr",address2:"suite d",city:"Raleigh",state:"CO",zip_code:27604,country:"USA",business_id:1},
    {first_name:"Georde",last_name:"Doeiss",company_name:"true moo LLC",avatar:"",email:"jonny@me.coms",phone_mobile:"919-995-9955",phone_home:"800-794-4672",address1:"4621 may dr",address2:"suite d",city:"Raleigh",state:"CO",zip_code:27604,country:"USA",business_id:1},
    {first_name:"Matt",last_name:"Doeiss",company_name:"true moo LLC",avatar:"",email:"jonny@me.coms",phone_mobile:"919-995-9955",phone_home:"800-794-4672",address1:"4621 may dr",address2:"suite d",city:"Raleigh",state:"CO",zip_code:27604,country:"USA",business_id:1},
    {first_name:"Jay",last_name:"Doeiss",company_name:"true moo LLC",avatar:"",email:"jonny@me.coms",phone_mobile:"919-995-9955",phone_home:"800-794-4672",address1:"4621 may dr",address2:"suite d",city:"Raleigh",state:"CO",zip_code:27604,country:"USA",business_id:1},
])

first_customer = Customer.find(1)

Event.create([
  {
    title: 'Watercolor Landscape',
    start_date: DateTime.new(2021, 6, 23, 9, 30),
    end_date: DateTime.new(2021, 6, 23, 11, 30),
    user:user,
    customer: first_customer,
    location: 'Zoom',
    notes: 'Extra descriptive notes',
  },
  {
    title: 'Monthly Planning',
    start_date: DateTime.new(2021, 5, 28, 9, 30),
    end_date: DateTime.new(2021, 5, 28, 11, 30),
     user:user,
    location: 'Zoom',
    notes: 'Extra descriptive notes',
  },
  {
    title: 'Recruiting students',
    start_date: DateTime.new(2021, 6, 9, 12, 0),
    end_date: DateTime.new(2021, 6, 9, 13, 0),
     user:user,
    customer: first_customer,
    location: 'Zoom',
    notes: 'Extra descriptive notes',
  },
  {
    title: 'Oil Painting',
    start_date: DateTime.new(2021, 6, 18, 14, 30),
    end_date: DateTime.new(2021, 6, 18, 15, 30),
     user:user,
    location: 'Zoom',
    notes: 'Extra descriptive notes',
  },
  {
    title: 'Open Day',
    start_date: DateTime.new(2021, 6, 20, 12, 0),
    end_date: DateTime.new(2021, 6, 20, 13, 35),
     user:user,
    customer: first_customer,
    location: 'Zoom',
    notes: 'Extra descriptive notes',
  },
  {
    title: 'Watercolor Workshop',
    start_date: DateTime.new(2021, 6, 9, 11, 0),
    end_date: DateTime.new(2021, 6, 9, 12, 0),
     user:user,
    location: 'Zoom',
    notes: 'Extra descriptive notes',
  },
])