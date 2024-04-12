import 'dart:async';
import 'dart:ffi';
import 'dart:io';
import 'dart:math';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'globals.dart' as globals;

/// Displays detailed information about a Timer.
/// 
class ElevatedButtonExample extends StatefulWidget {
  const ElevatedButtonExample({super.key});

  @override
  State<ElevatedButtonExample> createState() => _ElevatedButtonExampleState();
}

class _ElevatedButtonExampleState extends State<ElevatedButtonExample> {
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
          Container(
            width: 240.0,
            height: 42.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.0),
              color: const Color.fromARGB(255, 88, 22, 168),
            ),
            child: const Center(
              child: Text(
                'Focus',
                style: TextStyle(
                  fontFamily: 'Arial',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  height: 1,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        const Padding(padding: EdgeInsets.all(8.0)),
        Container(
          width: 240.0,
          height: 42.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.0),
            color: const Color.fromARGB(255, 88, 22, 168),
          ),
          child: const Center(
            child: Text(
              'Long Break',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                height: 1,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const Padding(padding: EdgeInsets.all(8.0)),
        Container(
          width: 240.0,
          height: 42.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24.0),
            color: const Color.fromARGB(255, 88, 22, 168),
          ),
          child: const Center(
            child: Text(
              'Short Break',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                height: 1,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ]
    );
  }
}

class TimerDetailsView extends StatefulWidget {
  @override
  static const routeName = '/sample_item';
  TimerDetailsView({super.key});
  _TimerDetailsViewState createState() => _TimerDetailsViewState();
}

class _TimerDetailsViewState extends State<TimerDetailsView> {

  final _isHours = true;
  String startStop = "Start";
  String skip = "Skip";
  String restart = "Restart";
  String currentState = "focus";


  final StopWatchTimer _stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countDown,
    presetMillisecond: StopWatchTimer.getMilliSecFromSecond(5),
    onStopped: () {
      print('onStopped');
    },
    onEnded: () {
    },
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() async {
    super.dispose();
    await _stopWatchTimer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Timer Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
              const Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: const ElevatedButtonExample()
                  ),  
                ],
              ),
            StreamBuilder<int>(
              stream: _stopWatchTimer.rawTime,
              initialData: _stopWatchTimer.rawTime.value,
              builder: (context, snap) {
                final value = snap.data!;
                final displayTime =
                    StopWatchTimer.getDisplayTime(value, hours: _isHours);
                return Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        displayTime,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            fontFamily: 'Helvetica',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: MaterialButton(
                  color: Color.fromARGB(255, 88, 22, 168),
                  onPressed: () {
                    print("button clicked");
                    if (startStop == "Start"){
                      _stopWatchTimer.onStartTimer();
                      setState(() {
                        startStop = "Pause";
                      });
                    }
                    else if (startStop == "Pause"){
                        _stopWatchTimer.onStopTimer();
                        setState(() {
                          startStop = "Start";
                        });
                      }
                    },
                  child: Text(
                    startStop,
                    style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: MaterialButton(
                    color: Color.fromARGB(255, 88, 22, 168),
                    onPressed: () {
                      },
                    child: Text(
                      skip,
                      style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: MaterialButton(
                    color: Color.fromARGB(255, 88, 22, 168),
                    onPressed: () {
                      _stopWatchTimer.onResetTimer();
                      setState(() {
                        startStop = "Start";
                      });
                      },
                    child: Text(
                      restart,
                      style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),

              ],
            ),  
          ],
        ),
      ),
    );
  }
}

