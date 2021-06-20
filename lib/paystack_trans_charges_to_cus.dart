library paystack_trans_charges_to_cus;

final double _DECIMAL_FEE = 0.0150;
final int _FEE_CAP = 2000;
final int _FLAT_FEE = 100;

String calculateTotalPrice(String amount) {
  double amt = double.parse(amount);
  if(amt<100){
    return ((amt+1).toInt()).toString();
  }else if(amt<2500){
    return _calculateFor2500Below(amt);
  }else{
    return _calculateFor2500Above(amt);
  }
}

 String _calculateFor2500Below(double amount){
  double applicableFees = _DECIMAL_FEE * amount;
  if(applicableFees>_FEE_CAP){
    return (amount+_FEE_CAP).toString();
  }else{
    return ((((amount)/(1-(_DECIMAL_FEE)))+0.01).toInt()).toString();
  }
}

 String _calculateFor2500Above(double amount){
  double applicableFees = (_DECIMAL_FEE * amount)+_FLAT_FEE;
  if(applicableFees>_FEE_CAP){
    return (amount+_FEE_CAP).toString();
  }else{
    return ((((amount+_FLAT_FEE)/(1-(_DECIMAL_FEE)))+0.01).toInt()).toString();
  }
}
