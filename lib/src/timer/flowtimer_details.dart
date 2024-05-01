import 'package:alarmplayer/alarmplayer.dart';
import 'package:flutter/material.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
String timerState = "Focus";

/// Displays detailed information about a Timer.
class ElevatedButtonExample extends StatefulWidget {
  final String timerStateText;
  const ElevatedButtonExample({super.key, required this.timerStateText});

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
            height: 50.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.0),
              color: const Color.fromARGB(255, 88, 22, 168),
            ),
            child: Center(
              child: Text(
                widget.timerStateText,
                style: const TextStyle(
                  fontFamily: 'Helvetica',
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

class FlowDetailsView extends StatefulWidget {
  @override
  static const routeName = '/flowtimer';
  FlowDetailsView({super.key});
  _FlowDetailsViewState createState() => _FlowDetailsViewState();
}

class _FlowDetailsViewState extends State<FlowDetailsView> {

  String startStop = "Start";
  String switchTimer = "Switch";
  String skip = "Skip";
  String restart = "Restart";
  int cycles = 0;
  int focusCount = 0;
  int breakCount = 0;
  bool currentBreak = false;
  Alarmplayer alarmplayer = Alarmplayer();

  void playAlarm(){
    alarmplayer.Alarm(
    url: "assets/alarm.mp3",  // Path of sound file. 
    volume: 0.25,              // optional, set the volume, default 1.
    looping: false,           // optional, if you want to loop you're alarm or not
    callback: ()              // this is the callback, it's getting executed if you're alarm
    => {print("i'm done!")} ,  // is done playing. Note if you're alarm is on loop you're callback won't be executed 
  );
}

  final StopWatchTimer _stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countUp,
    onStopped: () {
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
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: EdgeInsets.all(6),
                    child: ElevatedButtonExample(timerStateText: "Focus: $focusCount \nBreaks: $breakCount")
                  ),  
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /// Display every minute.
                  StreamBuilder<int>(
                    stream: _stopWatchTimer.minuteTime,
                    initialData: _stopWatchTimer.minuteTime.value,
                    builder: (context, snap) {
                      final value = snap.data;
                      //print('Listen every minute. $value');
                      return Row(
                        children: <Widget>[
                          Text(
                            value.toString().padLeft(2, '0'),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 100,
                                fontFamily: 'Helvetica',
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      );
                    },
                  ),
                  /// Display every second.
                  StreamBuilder<int>(
                    stream: _stopWatchTimer.secondTime,
                    initialData: _stopWatchTimer.secondTime.value,
                    builder: (context, snap) {
                      final value = snap.data;
                      if (cycles == 0){
                        WidgetsBinding.instance.addPostFrameCallback((_){
                          setState(() {
                            timerState = "Focus";
                          });
                        });
                      }
                      //print('Listen every second. $value');
                      return Column(
                        children: <Widget>[
                          Padding(
                              padding: const EdgeInsets.all(0),
                              child: 
                                Text(
                                    ':${(value !% 60).toString().padLeft(2, '0')}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 100,
                                      fontFamily: 'Helvetica',
                                      fontWeight: FontWeight.bold,
                                    ),
                                ),
                          ),
                        ],
                      );
                    },
                  ),
                  ],
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
                      _stopWatchTimer.onResetTimer();
                      setState(() {
                        startStop = "Start";
                      });
                      if (currentBreak == false){
                        setState(() {
                          currentBreak = true;
                          focusCount++;
                        });
                      }
                      else{
                        setState(() {
                          currentBreak = false;
                          breakCount++;
                        });
                      }
                      },
                    child: Text(
                      switchTimer,
                      style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),

              ],
            ),  
          ],
      ),
    )
    );
  }
}

