// ignore_for_file: avoid_print

import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zydex_hr/util/app_color_constants.dart';
import 'package:zydex_hr/util/dimensions.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class CommonSpeechToText extends StatefulWidget {
  const CommonSpeechToText(
      {super.key, required this.speech, this.searchText, this.listenText});
  final stt.SpeechToText speech;
  final TextEditingController? searchText;
  final Function(String?)? listenText;

  @override
  State<CommonSpeechToText> createState() => _CommonSpeechToTextState();
}

class _CommonSpeechToTextState extends State<CommonSpeechToText> {
  bool _isListening = false;
  bool _isMicisOn = false;
  bool _isMicisOff = false;
  String? _text = '';
  // ignore: unused_field
  double _confidence = 1.0;

  void listen() async {
    _text = '';
    if (!_isListening) {
      bool available = await widget.speech.initialize(
        onStatus: (status) {
          print('onStatus: $status');
        },
        onError: (errorNotification) {
          print('onError $errorNotification');
        },
      );

      if (available) {
        setState(() {
          _isListening = true;
        });
        widget.speech.listen(
          onResult: (result) {
            setState(() {
              _isMicisOn = true;
              _text = result.recognizedWords;
              if (result.hasConfidenceRating && result.confidence > 0) {
                _confidence = result.confidence;
              }
            });
            if (widget.speech.isNotListening) {
              setState(() {
                if (widget.listenText != null) {
                  widget.listenText!(_text);
                }
                _isListening = false;
              });
              Navigator.of(context).maybePop();
            }
          },
        );
      }
    } else {
      setState(() {
        _isListening = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    listen();
    Future.delayed(const Duration(seconds: 4)).whenComplete(() {
      if (!_isMicisOn) {
        setState(() {
          widget.speech.stop();
          _isListening = false;
          _isMicisOff = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimensions.screenwidth,
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          AvatarGlow(
            animate: _isListening,
            glowColor: Theme.of(context).primaryColor,
            duration: const Duration(milliseconds: 2000),
            repeat: true,
            child: FloatingActionButton(
              onPressed: () {
                setState(() {
                  _isMicisOff = false;
                });
                listen();
                Future.delayed(const Duration(seconds: 4)).whenComplete(() {
                  if (!_isMicisOn) {
                    setState(() {
                      widget.speech.stop();
                      _isListening = false;
                      _isMicisOff = true;
                    });
                  }
                });
              },
              shape: const CircleBorder(),
              backgroundColor: AppColorConstants.sentimentNegative,
              child: Icon(
                _isListening ? Icons.mic : Icons.mic_none,
                color: AppColorConstants.white,
              ),
            ),
          ),
          Text(
            _text == '' || _text == null || _text!.isEmpty
                ? _isMicisOff
                    ? 'error_text_speech_1'.tr
                    : 'listening_text_start'.tr
                : _text ?? '',
            style: TextStyle(
                fontSize: 18,
                overflow: TextOverflow.ellipsis,
                color: AppColorConstants.black,
                fontWeight:
                    _text!.isNotEmpty ? FontWeight.w800 : FontWeight.w800),
          ),
          if (_isMicisOff)
            Text(
              'error_text_speech_2'.tr,
              style: const TextStyle(
                  fontSize: 16,
                  overflow: TextOverflow.ellipsis,
                  color: AppColorConstants.contentSecondary,
                  fontWeight: FontWeight.w500),
            ),
          if (_isMicisOff)
            Text(
              'error_text_speech_3'.tr,
              style: const TextStyle(
                  fontSize: 16,
                  overflow: TextOverflow.ellipsis,
                  color: AppColorConstants.black,
                  fontWeight: FontWeight.w500),
            ),
        ],
      ),
    );
  }
}
