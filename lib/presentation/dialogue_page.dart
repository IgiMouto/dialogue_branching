import 'package:dialogue_player/logic/bloc/dialog_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../assets/constant.dart';

class DialogueStart extends StatefulWidget {
  const DialogueStart({super.key});

  @override
  State<DialogueStart> createState() => _DialogueStartState();
}

class _DialogueStartState extends State<DialogueStart> {
  int currentIndex = 0;
  int friendshipCount = 0;
  bool isLastIndex = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Let\'s Go'),
        ),
        body: BlocBuilder<DialogBloc, DialogState>(
          builder: (context, state) {
            if (isLastIndex) {
              return Center(
                child: Text(
                  'FRIENDSHIP STAT : $friendshipCount',
                  style: const TextStyle(color: Colors.black, fontSize: 20),
                ),
              );
            }
            if (state is DialogLoadedState) {
              return SizedBox(
                height: double.maxFinite,
                width: double.maxFinite,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        character,
                        style: TextStyle(fontSize: 3),
                      ),
                      Text(
                        state.dataModel![currentIndex].dialog,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount:
                            state.dataModel![currentIndex].responses.length,
                        itemBuilder: (context, index) {
                          return ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  if (state.dataModel![currentIndex]
                                          .navigation[index] >=
                                      0) {
                                    currentIndex = state
                                        .dataModel![currentIndex]
                                        .navigation[index];
                                    friendshipCount += state
                                        .dataModel![currentIndex].values[index];
                                  } else {
                                    isLastIndex = true;
                                    friendshipCount += state
                                        .dataModel![currentIndex].values[index];
                                  }
                                });
                                context.read<DialogBloc>().add(FetchData());
                              },
                              child: Column(
                                children: [
                                  Text(state.dataModel![currentIndex]
                                      .responses[index]),
                                ],
                              ));
                        },
                      )
                    ],
                  ),
                ),
              );
            }
            return Center(
              child: Text(
                'FRIENDSHIP STAT : $friendshipCount',
                style: const TextStyle(color: Colors.black, fontSize: 20),
              ),
            );
          },
        ));
  }
}
        
      
      //  ChangeNotifierProvider(
      //   create: (context) => DialogueProvider(),
      //   child: Consumer<DialogueProvider>(
      //     builder: (context, provider, _) {
      //       if (provider.responses.isNotEmpty) {
      //         return SizedBox(
      //           height: double.maxFinite,
      //           width: double.maxFinite,
      //           child: SingleChildScrollView(
      //             child: Column(
      //               mainAxisAlignment: MainAxisAlignment.center,
      //               children: [
      //                 const Text(
      //                   character,
      //                   style: TextStyle(fontSize: 3),
      //                 ),
      //                 Text(
      //                   provider.dialogue,
      //                   style:
      //                       const TextStyle(color: Colors.black, fontSize: 20),
      //                 ),
      //                 ListView.builder(
      //                   scrollDirection: Axis.vertical,
      //                   shrinkWrap: true,
      //                   itemCount: provider.responses.length,
      //                   itemBuilder: (context, index) {
      //                     return ElevatedButton(
      //                         onPressed: () {
      //                           provider.setResponse(index);
      //                         },
      //                         child: Text(provider.responses[index]));
      //                   },
      //                 )
      //               ],
      //             ),
      //           ),
      //         );
      //       }

      //       return Center(
      //         child: Text(
      //           'FRIENDSHIP STAT : ${provider.relationshipPoints}',
      //           style: const TextStyle(color: Colors.black, fontSize: 20),
      //         ),
      //       );
      //     },
      //   ),
      // ),
    
