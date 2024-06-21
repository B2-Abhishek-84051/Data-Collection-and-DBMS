// 1. Write a MongoDB query to find the restaurants which locate in latitude value less than -95.754168.

db.restaurant.find({"address.coord":{$lt:-95.754168}},{_id:0,address:1,borough:1,cuisine:1,name:1,restaurant_id:1}).pretty()
{
	"address" : {
		"building" : "3707",
		"coord" : [
			-101.8945214,
			33.5197474
		],
		"street" : "82 Street",
		"zipcode" : "11372"
	},
	"borough" : "Queens",
	"cuisine" : "American ",
	"name" : "Burger King",
	"restaurant_id" : "40534067"
}
{
	"address" : {
		"building" : "15259",
		"coord" : [
			-119.6368672,
			36.2504996
		],
		"street" : "10 Avenue",
		"zipcode" : "11357"
	},
	"borough" : "Queens",
	"cuisine" : "Italian",
	"name" : "Cascarino'S",
	"restaurant_id" : "40668681"
}
{
	"address" : {
		"building" : "60",
		"coord" : [
			-111.9975205,
			42.0970258
		],
		"street" : "West Side Highway",
		"zipcode" : "10006"
	},
	"borough" : "Manhattan",
	"cuisine" : "Japanese",
	"name" : "Sports Center At Chelsea Piers (Sushi Bar)",
	"restaurant_id" : "40882356"
}

// 2. Write a MongoDB query to find the restaurants that do not prepare any cuisine of 'American'
// and their grade score more than 70 and latitude less than -65.754168.

db.restaurant.find({$and:[{cuisine:{$ne:'American'}},{"grades.score":{$gt:70}},{"address.coord":{$lt:-65.754168}}]},{_id:0,name:1})

{ "name" : "Murals On 54/Randolphs'S" }
{ "name" : "Gandhi" }
{ "name" : "Live Bait Bar & Restaurant" }
{ "name" : "Bella Napoli" }
{ "name" : "El Molino Rojo Restaurant" }
{ "name" : "Fortunato Bros Cafe & Bakery" }
{ "name" : "B.B. Kings" }
{ "name" : "Two Boots Grand Central" }
{ "name" : "West 79Th Street Boat Basin Cafe" }


// 3. Write a MongoDB query to find the restaurants which do not prepare any cuisine of 'American'
// and achieved a score more than 70 and located in the longitude less than -65.754168.
// Note : Do this query without using $and operator.

db.restaurant.find(
					{
						cuisine:{$ne:'American'},
						"grades.score":{$gt:70},
						"address.coord":{$lt:-65.754168}
					}
				)

// 4. Write a MongoDB query to find the restaurant Id, name, borough and cuisine for those
// restaurants which contain 'Wil' as first three letters for its name.

db.restaurant.find({name:{$regex:/^Wil*/}},{_id:1,name:1,borough:1,cuisine:1})

{ "_id" : ObjectId("6671516d9433960ffaac4265"), "borough" : "Brooklyn", "cuisine" : "Delicatessen", "name" : "Wilken'S Fine Food" }
{ "_id" : ObjectId("6671516d9433960ffaac4267"), "borough" : "Bronx", "cuisine" : "American ", "name" : "Wild Asia" }
{ "_id" : ObjectId("6671516d9433960ffaac4428"), "borough" : "Queens", "cuisine" : "American ", "name" : "Windjammers Bar" }
{ "_id" : ObjectId("6671516d9433960ffaac44ca"), "borough" : "Manhattan", "cuisine" : "Chinese", "name" : "Winnie'S Bar" }
{ "_id" : ObjectId("6671516d9433960ffaac4619"), "borough" : "Queens", "cuisine" : "American ", "name" : "Winchesters Pub" }
{ "_id" : ObjectId("6671516e9433960ffaac47fb"), "borough" : "Manhattan", "cuisine" : "American ", "name" : "Winter Garden Theater" }
{ "_id" : ObjectId("6671516e9433960ffaac4a57"), "borough" : "Manhattan", "cuisine" : "Mediterranean", "name" : "Wine Bar" }
{ "_id" : ObjectId("6671516e9433960ffaac4d08"), "borough" : "Manhattan", "cuisine" : "American ", "name" : "Windfall" }
{ "_id" : ObjectId("6671516e9433960ffaac506e"), "borough" : "Bronx", "cuisine" : "Pizza", "name" : "Wilbel Pizza" }
{ "_id" : ObjectId("6671516e9433960ffaac5073"), "borough" : "Manhattan", "cuisine" : "American ", "name" : "Wimpy'S Restaurant" }


// 5. Write a MongoDB query to find the restaurant Id, name, borough and cuisine for those
// restaurants which contain 'ces' as last three letters for its name.

db.restaurant.find({name:{$regex:/ces$/}},{_id:1,name:1,borough:1,cuisine:1})

{ "_id" : ObjectId("6671516e9433960ffaac46f1"), "borough" : "Manhattan", "cuisine" : "American ", "name" : "Pieces" }
{ "_id" : ObjectId("6671516e9433960ffaac47af"), "borough" : "Queens", "cuisine" : "American ", "name" : "S.M.R Restaurant Services" }
{ "_id" : ObjectId("6671516e9433960ffaac47b6"), "borough" : "Manhattan", "cuisine" : "American ", "name" : "Good Shepherd Services" }
{ "_id" : ObjectId("6671516e9433960ffaac4c6b"), "borough" : "Queens", "cuisine" : "Ice Cream, Gelato, Yogurt, Ices", "name" : "The Ice Box-Ralph'S Famous Italian Ices" }
{ "_id" : ObjectId("6671516e9433960ffaac4e6b"), "borough" : "Brooklyn", "cuisine" : "Jewish/Kosher", "name" : "Alices" }
{ "_id" : ObjectId("6671516e9433960ffaac5087"), "borough" : "Manhattan", "cuisine" : "American ", "name" : "Re: Sources" }

// 6. Write a MongoDB query to find the restaurant Id, name, borough and cuisine for those
// restaurants which contain 'Reg' as three letters somewhere in its name.

db.restaurant.find(
					{name:{$regex:/.*Reg.*/}},
					{_id:1,name:1,borough:1,cuisine:1}
				)
				
db.restaurant.find({name:{$regex:/Reg/}},{_id:1,name:1,borough:1,cuisine:1} )
{ "_id" : ObjectId("6671516d9433960ffaac4266"), "borough" : "Brooklyn", "cuisine" : "American ", "name" : "Regina Caterers" }
{ "_id" : ObjectId("6671516d9433960ffaac4362"), "borough" : "Manhattan", "cuisine" : "Café/Coffee/Tea", "name" : "Caffe Reggio" }
{ "_id" : ObjectId("6671516d9433960ffaac4470"), "borough" : "Manhattan", "cuisine" : "American ", "name" : "Regency Hotel" }
{ "_id" : ObjectId("6671516e9433960ffaac478f"), "borough" : "Manhattan", "cuisine" : "American ", "name" : "Regency Whist Club" }
{ "_id" : ObjectId("6671516e9433960ffaac4871"), "borough" : "Queens", "cuisine" : "American ", "name" : "Rego Park Cafe" }
{ "_id" : ObjectId("6671516e9433960ffaac4ee1"), "borough" : "Queens", "cuisine" : "Pizza", "name" : "Regina Pizza" }
{ "_id" : ObjectId("6671516e9433960ffaac50f7"), "borough" : "Manhattan", "cuisine" : "American ", "name" : "Regal Entertainment Group" }
				
// 7. Write a MongoDB query to find the restaurants which belong to the borough Bronx and
// prepared either American or Chinese dish.

db.restaurant.find({$and:[{borough:"Bronx"},{cuisine:{$in:["American","Chinese"]}}]},{_id:0,name:1,borough:1,cuisine:1})

{ "borough" : "Bronx", "cuisine" : "Chinese", "name" : "Happy Garden" }
{ "borough" : "Bronx", "cuisine" : "Chinese", "name" : "Happy Garden" }
{ "borough" : "Bronx", "cuisine" : "Chinese", "name" : "China Wok Ii" }
{ "borough" : "Bronx", "cuisine" : "Chinese", "name" : "Dragon City" }
{ "borough" : "Bronx", "cuisine" : "Chinese", "name" : "Hunan Balcony" }
{ "borough" : "Bronx", "cuisine" : "Chinese", "name" : "Great Wall Restaurant" }
{ "borough" : "Bronx", "cuisine" : "Chinese", "name" : "Lucky House Restaurant" }
{ "borough" : "Bronx", "cuisine" : "Chinese", "name" : "New Wah Kitchen" }
{ "borough" : "Bronx", "cuisine" : "Chinese", "name" : "New Hing Restaurant" }
{ "borough" : "Bronx", "cuisine" : "Chinese", "name" : "Hong Kong Restaurant" }
{ "borough" : "Bronx", "cuisine" : "Chinese", "name" : "Kristy'S Restaurant" }
{ "borough" : "Bronx", "cuisine" : "Chinese", "name" : "East Dynasty" }
{ "borough" : "Bronx", "cuisine" : "Chinese", "name" : "Lin Home Chinese Restaura" }
{ "borough" : "Bronx", "cuisine" : "Chinese", "name" : "Peacock Restaurant" }
{ "borough" : "Bronx", "cuisine" : "Chinese", "name" : "Lin'S Garden" }
{ "borough" : "Bronx", "cuisine" : "Chinese", "name" : "New Rainbow Restaurant" }

// 8. Write a MongoDB query to arrange the name of the restaurants in ascending order along with
// all the columns.

db.restaurant.find().sort({"name":1})

// 9. Write a MongoDB query to arrange the name of the restaurants in descending along with all
// the columns.

db.restaurant.find().sort({"name":-1})

// 10. Write a MongoDB query to arranged the name of the cuisine in ascending order and for that
// same cuisine borough should be in descending order.

db.restaurant.find().sort({"name":1,"cuisine":-1,"borough":-1})

db.restaurant.find({},{_id:0,name:1,cuisine:1,borough:1}).sort({"name":1,"cuisine":-1,"borough":-1})

{ "borough" : "Brooklyn", "cuisine" : "Italian", "name" : "(Lewis Drug Store) Locanda Vini E Olii" }
{ "borough" : "Manhattan", "cuisine" : "American ", "name" : "1 East 66Th Street Kitchen" }
{ "borough" : "Queens", "cuisine" : "Delicatessen", "name" : "101 Deli" }
{ "borough" : "Brooklyn", "cuisine" : "Italian", "name" : "101 Restaurant And Bar" }
{ "borough" : "Manhattan", "cuisine" : "American ", "name" : "1020 Bar" }
{ "borough" : "Brooklyn", "cuisine" : "Café/Coffee/Tea", "name" : "104-01 Foster Avenue Coffee Shop(Ups)" }
{ "borough" : "Manhattan", "cuisine" : "Pizza", "name" : "10Th Avenue Pizza & Cafe" }
{ "borough" : "Queens", "cuisine" : "American ", "name" : "111 Restaurant" }
{ "borough" : "Manhattan", "cuisine" : "Japanese", "name" : "15 East Restaurant" }
{ "borough" : "Brooklyn", "cuisine" : "American ", "name" : "200 Fifth Avenue Restaurant & Sports Bar" }
{ "borough" : "Manhattan", "cuisine" : "American ", "name" : "21 Club" }
{ "borough" : "Manhattan", "cuisine" : "American ", "name" : "2A" }
{ "borough" : "Manhattan", "cuisine" : "American ", "name" : "3 Deli & Grill" }
{ "borough" : "Manhattan", "cuisine" : "American ", "name" : "3 Guys" }
{ "borough" : "Manhattan", "cuisine" : "American ", "name" : "3 Guys Resturant" }
{ "borough" : "Manhattan", "cuisine" : "American ", "name" : "42Nd Street Pizza Diner" }
{ "borough" : "Manhattan", "cuisine" : "American ", "name" : "44 & X Hell'S Kitchen" }
{ "borough" : "Manhattan", "cuisine" : "Italian", "name" : "44 Sw Ristorante & Bar" }
{ "borough" : "Queens", "cuisine" : "Mexican", "name" : "5 Burro Cafe" }
{ "borough" : "Manhattan", "cuisine" : "American ", "name" : "525 Lex Restaurant & Bar" }

// 11. Write a MongoDB query to know whether all the addresses contains the street or not.

db.restaurant.find({"address.street":{$exists:false}}).count()
0  <= //field street do not exist


db.restaurant.find({"address.street":{$exists:true}}).count()
3772