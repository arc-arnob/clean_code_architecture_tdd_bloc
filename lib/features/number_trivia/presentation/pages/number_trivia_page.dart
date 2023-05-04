import 'package:clean_code_architecture_tdd/features/number_trivia/presentation/bloc/number_trivia_bloc.dart';
import 'package:clean_code_architecture_tdd/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/widgets.dart';

class NumberTriviaPage extends StatelessWidget {
  const NumberTriviaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Clean Code Architecture"),
      ),
      body: buildBody(context),
    );
  }

  BlocProvider<NumberTriviaBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => sl<NumberTriviaBloc>(),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              // Top half
              BlocBuilder<NumberTriviaBloc, NumberTriviaState>(
                builder: (context, state) {
                  if (state is Empty) {
                    return MessageDisplay(
                      message: 'Start Searching...',
                    );
                  } else if (state is Loading) {
                    return LoadingWidget();
                  } else if (state is Loaded) {
                    return TriviaDisplay(
                      numberTrivia: state.trivia,
                    );
                  } else if (state is Error) {
                    return MessageDisplay(
                      message: state.message,
                    );
                  }
                  return MessageDisplay(
                    message: 'Somethings wrong...',
                  );
                },
              ),
              SizedBox(
                height: 20,
              ),
              // Bottom Half
              TriviaControl()
            ],
          ),
        ),
      ),
    );
  }
}

class TriviaControl extends StatefulWidget {
  const TriviaControl({
    super.key,
  });

  @override
  State<TriviaControl> createState() => _TriviaControlState();
}

class _TriviaControlState extends State<TriviaControl> {
  final controller = TextEditingController();
  late String inputStr;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Input a Number",
          ),
          onChanged: (value) {
            inputStr = value;
          },
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: <Widget>[
            Expanded(
                child: ElevatedButton(
              child: Text('Search'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
              ),
              onPressed: () {
                // Dispatch an event to the bloc
                dispatchConcrete(inputStr);
              },
            )),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: ElevatedButton(
                child: Text('Get Random'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                ),
                onPressed: () {
                  // Dispatch an event to the bloc
                  dispatchRandom();
                },
              ),
            ),
          ],
        )
      ],
    );
  }

  void dispatchConcrete(inputStr) {
    controller.clear();
    BlocProvider.of<NumberTriviaBloc>(context)
        .add(GetTriviaForConcreteNumber(inputStr));
  }

  void dispatchRandom() {
    controller.clear();
    BlocProvider.of<NumberTriviaBloc>(context).add(
      GetTriviaForRandomNumber(),
    );
  }
}
