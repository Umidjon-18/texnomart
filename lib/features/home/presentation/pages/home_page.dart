import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:texnomart/features/home/presentation/bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.channel, required this.event});
  final String channel;
  final String event;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = HomeBloc()
      ..add(SubscribeToChannelEvent(
        channel: widget.channel,
        event: widget.event,
      ));
  }

  @override
  void dispose() {
    bloc.add(UnSubscribeChannelEvent(channel: widget.channel));
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(CupertinoIcons.back, color: Colors.white)),
          backgroundColor: Colors.blue,
          title: const Text('Texnomart', style: TextStyle(color: Colors.white, fontSize: 26)),
          centerTitle: true,
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state.dataList.isEmpty) {
              return const Center(child: Icon(Icons.access_alarms_rounded, size: 45, color: Colors.grey));
            }
            return ListView.separated(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('${state.dataList[index]}'),
                );
              },
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemCount: state.dataList.length,
            );
          },
        ),
      ),
    );
  }
}
