
//1 Create Class
class PlaceList{
  //2 Create Properties
  final String name;
  final String address;
  final String imageUrl;
  final String description;
  final int id;

  //3 Constructor

  PlaceList({required this.name, required this.address, required this.imageUrl, required this.id,required this.description});


  //4 Create json Factory Method
  factory PlaceList.fromJson(Map<String,dynamic> json){
    return PlaceList(
        name: json["name"],
        address: json["address"],
        imageUrl: json["image_url"],
        id: json["id"],
        description: json["description"],
    );
  }

  //5 Array to List Transformer (DO only for array)
  static List<PlaceList> placesFromJson(dynamic json ){
    var searchResult = json["data"];
    List<PlaceList> results = new List.empty(growable: true);

    if (searchResult != null){

      searchResult.forEach((v)=>{
        results.add(PlaceList.fromJson(v))
      });
      return results;
    }
    return results;
  }




}