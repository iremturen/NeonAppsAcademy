class DeviceData {
  final String imagePath;
  final String deviceName;

  const DeviceData({required this.imagePath, required this.deviceName});
}

const List<DeviceData> devices = [
  DeviceData(
    imagePath: 'assets/images/lightbulb_icon.png',
    deviceName: 'Living Room Light',
  ),
  DeviceData(
    imagePath: 'assets/images/smart_tv_icon.png',
    deviceName: 'Smart TV',
  ),
  DeviceData(
    imagePath: 'assets/images/air_conditioner_icon.png',
    deviceName: 'Air Conditioner',
  ),
  DeviceData(
    imagePath: 'assets/images/lock_icon.png',
    deviceName: 'Smart Lock',
  ),
];
