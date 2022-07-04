import 'dart:math';

extension DoubleExtension on double {
  //roundToDouble(四捨五入)
  double roundWithDigit(int digit) {
    final digitValue = pow(10, digit);
    return (this * digitValue).roundToDouble() / digitValue;
  }
  //floorToDouble(切り捨て)
  double floorWithDigit(int digit) {
    final digitValue = pow(10, digit);
    return (this * digitValue).floorToDouble() / digitValue;
  }
}
