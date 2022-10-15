import 'package:navigation_drawer_menu/navigation_drawer_menu.dart';
import 'package:flutter/material.dart';
import 'package:proyecto/pages/bloc/tutoapp_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (() {}), icon: Icon(Icons.menu)),
        centerTitle: true,
        title: Text('TutAapp', style: TextStyle(fontFamily: 'Chewy-Regular')),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: BlocConsumer<TutoappBloc, TutoappState>(
            listener: (context, state) {
              if (state is TutoappListState) {
                Scaffold.of(context).showBottomSheet((context) => SizedBox(
                      height: 50,
                      width: 500,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [Text(state.subject[1])],
                      ),
                    ));
              }
            },
            builder: (context, state) {
              return GridView.builder(
                  itemCount: 6,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5),
                  itemBuilder: (context, index) {
                    return Container(
                      child: IconButton(
                          onPressed: () {
                            BlocProvider.of<TutoappBloc>(context)
                                .add(TutoappSelectGradeEvent(grade: index + 1));
                          },
                          icon: Image.asset('assets/images/${index + 1}.gif')),
                    );
                  });
            },
          ),
        ),
      ),
    );
  }
}


// showModalBottomSheet(
//                                 context: context,
//                                 builder: (context) {
//                                   return SizedBox(
//                                     height: 200,
//                                     child: Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       mainAxisSize: MainAxisSize.min,
//                                       children: [
//                                         TextButton(
//                                             onPressed: (() {}),
//                                             child: Text("Hola"))
//                                       ],
//                                     ),
//                                   );
//                                 });
