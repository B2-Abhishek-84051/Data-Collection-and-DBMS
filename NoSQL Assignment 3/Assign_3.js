// 1.Write a MongoDB query to find the restaurant Id, name and grades for those restaurants 
// where the 2nd element of grades array contains a grade of "A" and score 9 on an ISODate"2014-08-11T00:00:00Z".

db.restaurant.find({
                    $and:[
                        {'grades.1.grade':"A"},
                        {'grades.1.score':9},
                        {'grades.1.date':ISODate("2014-08-11T00:00:00Z")}
                    ]    
                },{
                    _id:1,name:1,'grades.grade':1
                })

                {
                    "_id" : ObjectId("6671516e9433960ffaac4889"),
                    "address" : {
                        "building" : "26",
                        "coord" : [
                            -73.96936149999999,
                            40.7658603
                        ],
                        "street" : "East   63 Street",
                        "zipcode" : "10065"
                    },
                    "borough" : "Manhattan",
                    "cuisine" : "American ",
                    "grades" : [
                        {
                            "date" : ISODate("2015-01-12T00:00:00Z"),
                            "grade" : "A",
                            "score" : 10
                        },
                        {
                            "date" : ISODate("2014-08-11T00:00:00Z"),
                            "grade" : "A",
                            "score" : 9
                        },
                        {
                            "date" : ISODate("2014-01-14T00:00:00Z"),
                            "grade" : "A",
                            "score" : 13
                        },
                        {
                            "date" : ISODate("2013-02-07T00:00:00Z"),
                            "grade" : "A",
                            "score" : 10
                        },
                        {
                            "date" : ISODate("2012-04-30T00:00:00Z"),
                            "grade" : "A",
                            "score" : 11
                        }
                    ],
                    "name" : "Club Macanudo (Cigar Bar)",
                    "restaurant_id" : "40526406"
                }

// 2.Write a MongoDB query to know whether all the addresses contains the street or not.

db.restaurant.find({"address.street":{$exists:false}}).count()

0 // no such restaurant exists

// 3.Write a MongoDB query to find the restaurants which belong to the borough Bronx and 
// prepared either American or Chinese dish.

db.restaurant.find({
                        $and:[{borough:"Bronx"},
                            {cuisine:{$in:["American","Chinese"]}}
                        ]
},{_id:0,name:1,borough:1,cuisine:1})

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


// 4.Write a MongoDB query which will select the restaurant Id, name and grades for those
// restaurants which returns 0 as a remainder after dividing the score by 7.

db.restaurant.find({grades:{$elemMatch:{score:{$mod:[7,0]}}}},{_id:1,name:1,grade:1})
{ "_id" : ObjectId("6671516d9433960ffaac4260"), "name" : "Riviera Caterer" }
{ "_id" : ObjectId("6671516d9433960ffaac4261"), "name" : "Morris Park Bake Shop" }
{ "_id" : ObjectId("6671516d9433960ffaac4262"), "name" : "Brunos On The Boulevard" }
{ "_id" : ObjectId("6671516d9433960ffaac426a"), "name" : "1 East 66Th Street Kitchen" }
{ "_id" : ObjectId("6671516d9433960ffaac426b"), "name" : "May May Kitchen" }
{ "_id" : ObjectId("6671516d9433960ffaac426c"), "name" : "Seuda Foods" }
{ "_id" : ObjectId("6671516d9433960ffaac4270"), "name" : "Sal'S Deli" }
{ "_id" : ObjectId("6671516d9433960ffaac4273"), "name" : "Steve Chu'S Deli & Grocery" }
{ "_id" : ObjectId("6671516d9433960ffaac4274"), "name" : "Harriet'S Kitchen" }
{ "_id" : ObjectId("6671516d9433960ffaac4278"), "name" : "White Castle" }
{ "_id" : ObjectId("6671516d9433960ffaac4279"), "name" : "Shashemene Int'L Restaura" }
{ "_id" : ObjectId("6671516d9433960ffaac427b"), "name" : "Ho Mei Restaurant" }
{ "_id" : ObjectId("6671516d9433960ffaac4280"), "name" : "Olive'S" }
{ "_id" : ObjectId("6671516d9433960ffaac4282"), "name" : "Lexler Deli" }
{ "_id" : ObjectId("6671516d9433960ffaac4287"), "name" : "Snack Time Grill" }
{ "_id" : ObjectId("6671516d9433960ffaac4288"), "name" : "Domino'S Pizza" }
{ "_id" : ObjectId("6671516d9433960ffaac4289"), "name" : "Lorenzo & Maria'S" }
{ "_id" : ObjectId("6671516d9433960ffaac428a"), "name" : "Sonny'S Heros" }
{ "_id" : ObjectId("6671516d9433960ffaac4292"), "name" : "Plaza Bagels & Deli" }
{ "_id" : ObjectId("6671516d9433960ffaac4293"), "name" : "Philadelhia Grille Express" }
