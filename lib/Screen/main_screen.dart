import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DeviceInfoScreen extends StatefulWidget {
  const DeviceInfoScreen({super.key});

  @override
  DeviceInfoWidgetScreenState createState() => DeviceInfoWidgetScreenState();
}

class DeviceInfoWidgetScreenState extends State<DeviceInfoScreen> {
  static const platform = MethodChannel('com.example.device_info_channel');
  String deviceType = 'Unknown';
  String deviceModel = 'Unknown';
  String deviceBrand = 'Unknown';
  String osVersion = 'Unknown';
  String batteryLevel = 'Unknown';

  @override
  void initState() {
    super.initState();
    _getDeviceInfo();
  }

  Future<void> _getDeviceInfo() async {
    try {
      final dynamic result = await platform.invokeMethod('getDeviceInfo');
      final Map<String, dynamic> deviceInfo = Map<String, dynamic>.from(result);
      setState(() {
        deviceType = deviceInfo['deviceType'] ?? 'Unknown';
        deviceModel = deviceInfo['deviceModel'] ?? 'Unknown';
        deviceBrand = deviceInfo['deviceBrand'] ?? 'Unknown';
        osVersion = deviceInfo['osVersion'] ?? 'Unknown';
        batteryLevel = deviceInfo['batteryLevel']?.toString() ?? 'Unknown';
      });
    } on PlatformException catch (e) {
      debugPrint("Failed to get device info: '${e.message}'.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Device Info'),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow:const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    spreadRadius: 4,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Device Info',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildDeviceInfoRow('Device Type:', deviceType),
                    _buildDeviceInfoRow('Device Model:', deviceModel),
                    _buildDeviceInfoRow('Device Brand:', deviceBrand),
                    _buildDeviceInfoRow('OS Version:', osVersion),
                    _buildDeviceInfoRow('Battery Level:', batteryLevel),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDeviceInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              (label=="Battery Level:")?"$value%":value,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
