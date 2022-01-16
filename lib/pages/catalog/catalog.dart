import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:panificadora_mimago/widgets/categories.dart';
import 'package:panificadora_mimago/widgets/product_card.dart';

class Catalog extends StatefulWidget {
   Catalog({Key key}) : super(key: key);

  @override
  _CatalogState createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {
  static const int historyLegth = 5;

  final List<String> _searchHistory = [];
  final List<String> _categorias = [
    'categoria',
    'categoria',
    'categoria',
    'categoria',
    'categoria',
    'categoria',
    'categoria',
  ];

  List<String> filteredSearchHistory;

  String selectedTerm;
  FloatingSearchBarController controller;

  final double _totalPrice=0;

  List<String> filteredSearchTerms({@required String filter,})
  {
    if(filter != null && filter.isNotEmpty){
      return _searchHistory.reversed
            .where((String term) => term.startsWith(filter))
            .toList();
    }else{
      return _searchHistory.reversed.toList();
    }
  }

  void addSearchTerm(String term){
    if(_searchHistory.contains(term)) putSearchTermFirst(term);
    
    _searchHistory.add(term);
    if(_searchHistory.length > historyLegth) _searchHistory.removeRange(0, _searchHistory.length - historyLegth);

    filteredSearchHistory = filteredSearchTerms(filter: null);
  }

  void deleteSearchTerm(String term){
    _searchHistory.removeWhere((String t) => t == term);
    filteredSearchHistory = filteredSearchTerms(filter: null);
  }

  void putSearchTermFirst(String term){
    deleteSearchTerm(term);
    addSearchTerm(term);
  }
  
  @override
  void initState() {
    super.initState();
    filteredSearchHistory = filteredSearchTerms(filter: null);
    controller = FloatingSearchBarController();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    
    return Scaffold(
      //floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Stack(
        children: [
          Positioned(
            bottom: 80,
            right: 0,
            child: Column(      
              children: [
                Container(
                 margin: EdgeInsets.symmetric(vertical:5),
                  child: FloatingActionButton(
                    backgroundColor: const Color(0xffECFAFF),
                    foregroundColor: Colors.black,
                    mini: false,
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, 'order');
                    },
                    tooltip: 'Pedidos',
                    child: Image(image: AssetImage('assets/img/cajas&pedido.png', ),height: 48,width: 48,fit: BoxFit.contain,alignment: Alignment.bottomCenter),
                  ),
                ),
                Container(
                 margin: EdgeInsets.symmetric(vertical:5),
                  child: FloatingActionButton(
                    backgroundColor: const Color(0xffECFAFF),
                    foregroundColor: Colors.black,
                    mini: false,
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, 'ticket');
                    },
                    child: Image(image: AssetImage('assets/img/cuenta.png', ),height: 50,width: 50,fit: BoxFit.contain,alignment: Alignment.bottomCenter,),
                  ),
                ),
            ],
          ),
        ),
        ],
      ),
      resizeToAvoidBottomInset: false,
       body: SafeArea(
        top: true,
        //bottom: true,
         child: Container(
          width: screenSize.width,
          height: screenSize.height,
          decoration: const BoxDecoration(
            color: Color(0xFFECFAFF),
          ),
             child:Stack(
              children:[
                Positioned(
                  left: 10,
                  top: 5.0,
                  child: Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: <BoxShadow>[
                        BoxShadow(color: Colors.black26,blurRadius: 4.0,offset: Offset(0,2.0),spreadRadius: 0.5)
                      ]
                    ),
                    child: IconButton(
                      iconSize: 30,
                      icon: const Icon(Icons.logout_rounded,color: Color(0xff00A7E1),),
                      tooltip: 'Salir de mi cuenta',
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, 'login');
                      },
                    ),
                  ),
                ),
                Positioned(
                  left: screenSize.width-screenSize.width*0.65,
                  top: 0.0,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Image(
                        height: screenSize.height > 800 ? 100.0 : 70,
                        fit: BoxFit.fill,
                        image: const AssetImage('assets/img/login_logo.png')),
                  ),
                ),
               Column(
                 mainAxisSize: MainAxisSize.min,
                 children: [
                  SafeArea(
                    child: Container(
                      height:screenSize.height * 0.08,
                    ),
                  ),
                   SingleChildScrollView(
                    child: Container(
                      child: _crearContenido(screenSize)
                    ),
                   ),
                 ]
               ),
                Align(//barra de abajo
                alignment: FractionalOffset.bottomCenter,
                 child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                   width: screenSize.width-screenSize.width*0.08,
                   height: 70,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(8.0),
                     color: Color(0xFF00BAFF),
                     boxShadow: <BoxShadow>[
                       BoxShadow(color: Colors.black26,blurRadius: 4.0,offset: Offset(0,2.0),spreadRadius: 2)
                     ]
                   ),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children:[
                       Container(
                         margin: EdgeInsets.symmetric(horizontal: 10),
                         child: Image(
                          height: 40,
                          image: const AssetImage('assets/img/camion.png')
                        ),
                       ),
                       Container(
                         margin: EdgeInsets.symmetric(horizontal:10),
                         child: Text('Total de su pedido',style: TextStyle(color:Colors.black, fontSize: 20,fontWeight: FontWeight.bold),)
                      ),
                      Container(
                         margin: EdgeInsets.symmetric(horizontal:10),
                        child: Text("\$$_totalPrice",style: TextStyle(color:Colors.white, fontSize: 25,fontWeight: FontWeight.bold))
                      )
                     ]
                   ),
                 ),
               )
             ],
           ),
       ),
      ),
    );
  }

  Widget _crearContenido(Size screenSize) {
    return 
 
            buildFloatingSearchBar(screenSize);
  }

  Widget buildFloatingSearchBar(Size screenSize) {
    

    return Container(
      height: screenSize.height - 210,
      width: screenSize.width,
      //color: Colors.black,
      margin: EdgeInsets.symmetric(vertical:15),
      child: FloatingSearchBar(
        controller: controller,
        body:Column(
          children: [
            Container(
            margin: EdgeInsets.only(top: 70 ),
              height: 35,
              child: Categories(items:_categorias)
            ),
            Container(
              height: 465,
              child: SearchResultsListView(
                searchTerm: selectedTerm,
              ),
            ),
          ],
        ),
        transition: CircularFloatingSearchBarTransition(),
        physics: const BouncingScrollPhysics(),
        queryStyle: TextStyle(color: Color(0xFF00A7E1)),

        title: Text(
          selectedTerm ?? 'Buscar productos..',
          style: TextStyle(color: Color(0xFF00A7E1)),
        ),
        hint: 'Escribi para buscar',
        hintStyle: TextStyle(color: Color(0x8800A7E1)),
        actions: [
          FloatingSearchBarAction.searchToClear(
            size: 35,
            color: Color(0xFFD6F4FF),
          ),
        ],
        onQueryChanged: (query){
          setState(() {
            filteredSearchHistory = filteredSearchTerms(filter: query);
          });
        },
        onSubmitted: (query){
          //Encapsular en un metodo
          setState(() {
            addSearchTerm(query);
            selectedTerm = query;
          });
          controller.close();
          selectedTerm = null;
        },
        builder: (context, transition) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Material(
              color: Colors.white,
              elevation: 4,
              child: Builder(
                builder: (context){
                  if(filteredSearchHistory.isEmpty && controller.query.isEmpty){
                    return Container(
                      height: 50,
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Text(
                        'Esperando resultados',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.caption,
                      ),
                    );
                  }else if(filteredSearchHistory.isEmpty ){
                    return ListTile(
                      title:Text(controller.query,style: TextStyle(color: Color(0xFF00A7E1))),
                      leading: const Icon(Icons.search,color:Color(0xFFD6F4FF),size: 30,),
                      onTap: (){
                        //Encapsular en un metodo
                        setState(() {
                          addSearchTerm(controller.query);
                          selectedTerm = controller.query;
                        });
                        controller.close();
                        selectedTerm = null;
                      },
                    );
                  }else{
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: filteredSearchHistory
                          .map(
                            (term) => ListTile(
                              title: Text(
                                term,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: Color(0xFF00A7E1))
                              ),
                              leading: const Icon(Icons.history,color:Color(0xFFD6F4FF),size: 30),
                              trailing: IconButton(
                                icon: const Icon(Icons.clear,color:Color(0xFFD6F4FF),size: 30),
                                onPressed: () {
                                  setState(() {
                                    deleteSearchTerm(term);
                                  });
                                },
                              ),
                              onTap: () {
                                setState(() {
                                  putSearchTermFirst(term);
                                  selectedTerm = term;
                                });
                                controller.close();
                              },
                            ),
                          )
                          .toList(),
                    );
                  } 
                },
              )
            ),
          );
        },
      ),
    );
  }

}


class SearchResultsListView extends StatelessWidget {
  final String searchTerm;

  const SearchResultsListView({
    Key key,
    @required this.searchTerm,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (searchTerm == null || searchTerm == '') {

        child: Column(
          //mainAxisSize: MainAxisSize.min,
          children: [
            ProductCard(),
            ProductCard(),
            ProductCard(),
            ProductCard(),
          ],
        );
    }

    return ListView(
      children: List<Container>.generate(
        10,
        (index) => Container(margin: EdgeInsets.all(10),child: ProductCard()),
        // ListTile(
        //   title: Text('$searchTerm'),
        //   subtitle: Text(index.toString()),
        // ),
      ),
    );
  }
}