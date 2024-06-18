// run the import command in terminal outside mongo shell

// abhishek@abhishek-HP-Laptop-15q-ds0xxx:~/RDBMS/NoSQL_Day2$ 
mongoimport -d dbda -c restaurant --file restaurants.json

// 2024-06-18T14:50:45.899+0530	connected to: mongodb://localhost/
// 2024-06-18T14:50:46.867+0530	3772 document(s) imported successfully. 0 document(s) failed to import.

$ mongo

> show databases
admin   0.000GB
config  0.000GB
dbda    0.000GB
local   0.000GB
mydb    0.000GB

> use dbda
switched to db dbda

> show collections
dept
emp
person
restaurant
student

> db.restaurant.find()

db.restaurant.find().pretty()
{
	"_id" : ObjectId("6671516d9433960ffaac425e"),
	"address" : {
		"building" : "351",
		"coord" : [
			-73.98513559999999,
			40.7676919
		],
		"street" : "West   57 Street",
		"zipcode" : "10019"
	},
	"borough" : "Manhattan",
	"cuisine" : "Irish",
	"grades" : [
		{
			"date" : ISODate("2014-09-06T00:00:00Z"),
			"grade" : "A",
			"score" : 2
		},
		{
			"date" : ISODate("2013-07-22T00:00:00Z"),
			"grade" : "A",
			"score" : 11
		},
		{
			"date" : ISODate("2012-07-31T00:00:00Z"),
			"grade" : "A",
			"score" : 12
		},
		{
			"date" : ISODate("2011-12-29T00:00:00Z"),
			"grade" : "A",
			"score" : 12
		}
	],
	"name" : "Dj Reynolds Pub And Restaurant",
	"restaurant_id" : "30191841"
}

db.restaurant.count()
3772

// 1.Write a MongoDB query to display all the documents in the collection restaurants.

> db.restaurant.find().pretty()

// 2. Write a MongoDB query to display the fields restaurant_id, name, borough and cuisine for all
// the documents in the collection restaurant.

> db.restaurant.find({},{restaurant_id:1,name:1,borough:1,cuisine:1})
{ "_id" : ObjectId("6671516d9433960ffaac425e"), "borough" : "Manhattan", "cuisine" : "Irish", "name" : "Dj Reynolds Pub And Restaurant", "restaurant_id" : "30191841" }
{ "_id" : ObjectId("6671516d9433960ffaac425f"), "borough" : "Brooklyn", "cuisine" : "Hamburgers", "name" : "Wendy'S", "restaurant_id" : "30112340" }
{ "_id" : ObjectId("6671516d9433960ffaac4260"), "borough" : "Brooklyn", "cuisine" : "American ", "name" : "Riviera Caterer", "restaurant_id" : "40356018" }
{ "_id" : ObjectId("6671516d9433960ffaac4261"), "borough" : "Bronx", "cuisine" : "Bakery", "name" : "Morris Park Bake Shop", "restaurant_id" : "30075445" }
{ "_id" : ObjectId("6671516d9433960ffaac4262"), "borough" : "Queens", "cuisine" : "American ", "name" : "Brunos On The Boulevard", "restaurant_id" : "40356151" }
{ "_id" : ObjectId("6671516d9433960ffaac4263"), "borough" : "Queens", "cuisine" : "Jewish/Kosher", "name" : "Tov Kosher Kitchen", "restaurant_id" : "40356068" }
{ "_id" : ObjectId("6671516d9433960ffaac4264"), "borough" : "Staten Island", "cuisine" : "Jewish/Kosher", "name" : "Kosher Island", "restaurant_id" : "40356442" }
{ "_id" : ObjectId("6671516d9433960ffaac4265"), "borough" : "Brooklyn", "cuisine" : "Delicatessen", "name" : "Wilken'S Fine Food", "restaurant_id" : "40356483" }
{ "_id" : ObjectId("6671516d9433960ffaac4266"), "borough" : "Brooklyn", "cuisine" : "American ", "name" : "Regina Caterers", "restaurant_id" : "40356649" }
{ "_id" : ObjectId("6671516d9433960ffaac4267"), "borough" : "Bronx", "cuisine" : "American ", "name" : "Wild Asia", "restaurant_id" : "40357217" }
{ "_id" : ObjectId("6671516d9433960ffaac4268"), "borough" : "Brooklyn", "cuisine" : "American ", "name" : "C & C Catering Service", "restaurant_id" : "40357437" }
{ "_id" : ObjectId("6671516d9433960ffaac4269"), "borough" : "Brooklyn", "cuisine" : "Ice Cream, Gelato, Yogurt, Ices", "name" : "Taste The Tropics Ice Cream", "restaurant_id" : "40356731" }
{ "_id" : ObjectId("6671516d9433960ffaac426a"), "borough" : "Manhattan", "cuisine" : "American ", "name" : "1 East 66Th Street Kitchen", "restaurant_id" : "40359480" }
{ "_id" : ObjectId("6671516d9433960ffaac426b"), "borough" : "Brooklyn", "cuisine" : "Chinese", "name" : "May May Kitchen", "restaurant_id" : "40358429" }
{ "_id" : ObjectId("6671516d9433960ffaac426c"), "borough" : "Brooklyn", "cuisine" : "Jewish/Kosher", "name" : "Seuda Foods", "restaurant_id" : "40360045" }
{ "_id" : ObjectId("6671516d9433960ffaac426d"), "borough" : "Queens", "cuisine" : "Ice Cream, Gelato, Yogurt, Ices", "name" : "Carvel Ice Cream", "restaurant_id" : "40361322" }
{ "_id" : ObjectId("6671516d9433960ffaac426e"), "borough" : "Brooklyn", "cuisine" : "Ice Cream, Gelato, Yogurt, Ices", "name" : "Carvel Ice Cream", "restaurant_id" : "40360076" }
{ "_id" : ObjectId("6671516d9433960ffaac426f"), "borough" : "Brooklyn", "cuisine" : "American ", "name" : "The Movable Feast", "restaurant_id" : "40361606" }
{ "_id" : ObjectId("6671516d9433960ffaac4270"), "borough" : "Queens", "cuisine" : "Delicatessen", "name" : "Sal'S Deli", "restaurant_id" : "40361618" }
{ "_id" : ObjectId("6671516d9433960ffaac4271"), "borough" : "Manhattan", "cuisine" : "American ", "name" : "Glorious Food", "restaurant_id" : "40361521" }
Type "it" for more

// 3. Write a MongoDB query to display the fields restaurant_id, name, borough and cuisine, but
// exclude the field _id for all the documents in the collection restaurant.

> db.restaurant.find({},{_id:0,restaurant_id:1,name:1,borough:1,cuisine:1})
{ "borough" : "Manhattan", "cuisine" : "Irish", "name" : "Dj Reynolds Pub And Restaurant", "restaurant_id" : "30191841" }
{ "borough" : "Brooklyn", "cuisine" : "Hamburgers", "name" : "Wendy'S", "restaurant_id" : "30112340" }
{ "borough" : "Brooklyn", "cuisine" : "American ", "name" : "Riviera Caterer", "restaurant_id" : "40356018" }
{ "borough" : "Bronx", "cuisine" : "Bakery", "name" : "Morris Park Bake Shop", "restaurant_id" : "30075445" }
{ "borough" : "Queens", "cuisine" : "American ", "name" : "Brunos On The Boulevard", "restaurant_id" : "40356151" }
{ "borough" : "Queens", "cuisine" : "Jewish/Kosher", "name" : "Tov Kosher Kitchen", "restaurant_id" : "40356068" }
{ "borough" : "Staten Island", "cuisine" : "Jewish/Kosher", "name" : "Kosher Island", "restaurant_id" : "40356442" }
{ "borough" : "Brooklyn", "cuisine" : "Delicatessen", "name" : "Wilken'S Fine Food", "restaurant_id" : "40356483" }
{ "borough" : "Brooklyn", "cuisine" : "American ", "name" : "Regina Caterers", "restaurant_id" : "40356649" }
{ "borough" : "Bronx", "cuisine" : "American ", "name" : "Wild Asia", "restaurant_id" : "40357217" }
{ "borough" : "Brooklyn", "cuisine" : "American ", "name" : "C & C Catering Service", "restaurant_id" : "40357437" }
{ "borough" : "Brooklyn", "cuisine" : "Ice Cream, Gelato, Yogurt, Ices", "name" : "Taste The Tropics Ice Cream", "restaurant_id" : "40356731" }
{ "borough" : "Manhattan", "cuisine" : "American ", "name" : "1 East 66Th Street Kitchen", "restaurant_id" : "40359480" }
{ "borough" : "Brooklyn", "cuisine" : "Chinese", "name" : "May May Kitchen", "restaurant_id" : "40358429" }
{ "borough" : "Brooklyn", "cuisine" : "Jewish/Kosher", "name" : "Seuda Foods", "restaurant_id" : "40360045" }
{ "borough" : "Queens", "cuisine" : "Ice Cream, Gelato, Yogurt, Ices", "name" : "Carvel Ice Cream", "restaurant_id" : "40361322" }
{ "borough" : "Brooklyn", "cuisine" : "Ice Cream, Gelato, Yogurt, Ices", "name" : "Carvel Ice Cream", "restaurant_id" : "40360076" }
{ "borough" : "Brooklyn", "cuisine" : "American ", "name" : "The Movable Feast", "restaurant_id" : "40361606" }
{ "borough" : "Queens", "cuisine" : "Delicatessen", "name" : "Sal'S Deli", "restaurant_id" : "40361618" }
{ "borough" : "Manhattan", "cuisine" : "American ", "name" : "Glorious Food", "restaurant_id" : "40361521" }
Type "it" for more

// 4. Write a MongoDB query to display the fields restaurant_id, name, borough and zip code, but
// exclude the field _id for all the documents in the collection restaurant.

> db.restaurant.find({},{_id:0,restaurant_id:1,name:1,borough:1,"address.zipcode":1})

{ "address" : { "zipcode" : "10019" }, "borough" : "Manhattan", "name" : "Dj Reynolds Pub And Restaurant", "restaurant_id" : "30191841" }
{ "address" : { "zipcode" : "11225" }, "borough" : "Brooklyn", "name" : "Wendy'S", "restaurant_id" : "30112340" }
{ "address" : { "zipcode" : "11224" }, "borough" : "Brooklyn", "name" : "Riviera Caterer", "restaurant_id" : "40356018" }
{ "address" : { "zipcode" : "10462" }, "borough" : "Bronx", "name" : "Morris Park Bake Shop", "restaurant_id" : "30075445" }
{ "address" : { "zipcode" : "11369" }, "borough" : "Queens", "name" : "Brunos On The Boulevard", "restaurant_id" : "40356151" }
{ "address" : { "zipcode" : "11374" }, "borough" : "Queens", "name" : "Tov Kosher Kitchen", "restaurant_id" : "40356068" }
{ "address" : { "zipcode" : "10314" }, "borough" : "Staten Island", "name" : "Kosher Island", "restaurant_id" : "40356442" }
{ "address" : { "zipcode" : "11234" }, "borough" : "Brooklyn", "name" : "Wilken'S Fine Food", "restaurant_id" : "40356483" }
{ "address" : { "zipcode" : "11219" }, "borough" : "Brooklyn", "name" : "Regina Caterers", "restaurant_id" : "40356649" }
{ "address" : { "zipcode" : "10460" }, "borough" : "Bronx", "name" : "Wild Asia", "restaurant_id" : "40357217" }
{ "address" : { "zipcode" : "11214" }, "borough" : "Brooklyn", "name" : "C & C Catering Service", "restaurant_id" : "40357437" }
{ "address" : { "zipcode" : "11226" }, "borough" : "Brooklyn", "name" : "Taste The Tropics Ice Cream", "restaurant_id" : "40356731" }
{ "address" : { "zipcode" : "10065" }, "borough" : "Manhattan", "name" : "1 East 66Th Street Kitchen", "restaurant_id" : "40359480" }
{ "address" : { "zipcode" : "11208" }, "borough" : "Brooklyn", "name" : "May May Kitchen", "restaurant_id" : "40358429" }
{ "address" : { "zipcode" : "11223" }, "borough" : "Brooklyn", "name" : "Seuda Foods", "restaurant_id" : "40360045" }
{ "address" : { "zipcode" : "11004" }, "borough" : "Queens", "name" : "Carvel Ice Cream", "restaurant_id" : "40361322" }
{ "address" : { "zipcode" : "11218" }, "borough" : "Brooklyn", "name" : "Carvel Ice Cream", "restaurant_id" : "40360076" }
{ "address" : { "zipcode" : "11215" }, "borough" : "Brooklyn", "name" : "The Movable Feast", "restaurant_id" : "40361606" }
{ "address" : { "zipcode" : "11356" }, "borough" : "Queens", "name" : "Sal'S Deli", "restaurant_id" : "40361618" }
{ "address" : { "zipcode" : "10021" }, "borough" : "Manhattan", "name" : "Glorious Food", "restaurant_id" : "40361521" }
Type "it" for more

// 5. Write a MongoDB query to display all the restaurant which is in the borough Bronx.

> db.restaurant.find({borough:"Bronx"}).pretty()

// Also

> db.restaurant.find({borough:
    {
        $eq:"Bronx"
    }
}).pretty()
{
	"_id" : ObjectId("6671516d9433960ffaac4261"),
	"address" : {
		"building" : "1007",
		"coord" : [
			-73.856077,
			40.848447
		],
		"street" : "Morris Park Ave",
		"zipcode" : "10462"
	},
	"borough" : "Bronx",
	"cuisine" : "Bakery",
	"grades" : [
		{
			"date" : ISODate("2014-03-03T00:00:00Z"),
			"grade" : "A",
			"score" : 2
		},
		{
			"date" : ISODate("2013-09-11T00:00:00Z"),
			"grade" : "A",
			"score" : 6
		},
		{
			"date" : ISODate("2013-01-24T00:00:00Z"),
			"grade" : "A",
			"score" : 10
		},
		{
			"date" : ISODate("2011-11-23T00:00:00Z"),
			"grade" : "A",
			"score" : 9
		},
		{
			"date" : ISODate("2011-03-10T00:00:00Z"),
			"grade" : "B",
			"score" : 14
		}
	],
	"name" : "Morris Park Bake Shop",
	"restaurant_id" : "30075445"
}
{
	"_id" : ObjectId("6671516d9433960ffaac4267"),
	"address" : {
		"building" : "2300",
		"coord" : [
			-73.8786113,
			40.8502883
		],
		"street" : "Southern Boulevard",
		"zipcode" : "10460"
	},
	"borough" : "Bronx",
	"cuisine" : "American ",
	"grades" : [
		{
			"date" : ISODate("2014-05-28T00:00:00Z"),
			"grade" : "A",
			"score" : 11
		},
		{
			"date" : ISODate("2013-06-19T00:00:00Z"),
			"grade" : "A",
			"score" : 4
		},
		{
			"date" : ISODate("2012-06-15T00:00:00Z"),
			"grade" : "A",
			"score" : 3
		}
	],
	"name" : "Wild Asia",
	"restaurant_id" : "40357217"
}


// 6. Write a MongoDB query to display the first 5 restaurant which is in the borough Bronx.

> db.restaurant.find({borough:"Bronx"}).pretty().limit(5)

// 7.Write a MongoDB query to display the next 5 restaurants after skipping first 5 which are in the
// borough Bronx.

> db.restaurant.find({borough:"Bronx"}).pretty().skip(5).limit(5)

// 8. Write a MongoDB query to find the restaurants who achieved a score more than 90.

> db.restaurant.find({"grades.score":{$gt:90}}).pretty()

// 9. Write a MongoDB query to find the restaurants that achieved a score, more than 80 but less than 100.

> db.restaurant.find({$and:[{"grades.score":{$gt:90}},{"grades.score":{$lt:100}}]}).pretty()