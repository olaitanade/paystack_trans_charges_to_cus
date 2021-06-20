import 'package:flutter_test/flutter_test.dart';

import 'package:paystack_trans_charges_to_cus/paystack_trans_charges_to_cus.dart';

void main() {
  test('calculate total price', () {
    expect(calculateTotalPrice("100"), "101");
  });
}
