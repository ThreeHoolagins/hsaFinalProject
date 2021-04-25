
public class goldDivider {
  public static void main(String[] args) {
      double numerator, denominator, kValue, trueRemainder, iterativeRemainder, quotient, percision, finalPercision, scale, ulp;
      int iterations, internalPercision, outputPercision;

      if (args.length < 6) {
        System.out.printf("Usage: java goldDivider numerator denominator intial-value iterations prec prec_f \n");
        System.exit(0);
      }

      numerator = Double.parseDouble(args[0]);
      denominator = Double.parseDouble(args[1]);
      kValue = Double.parseDouble(args[2]);
      iterations = Integer.parseInt(args[3]);
      percision = Double.parseDouble(args[4]);
      finalPercision = Double.parseDouble(args[5]);

      internalPercision = (int) percision;
      outputPercision = (int) finalPercision;

      // Make sure our values only go to 15 fractional binary places
      numerator = roundDouble(numerator, internalPercision);
      denominator = roundDouble(denominator, internalPercision);

      // Calculate Code Value for final Comparison
      quotient = numerator / denominator;

      double ri = denominator;
      double ni = numerator;
      int i;
      for (i = 0; i < iterations; i++) {
        //System.out.printf("K%d: %.15f, Numerator: %.15f, Denominator: %.15f\n", i, kValue,numerator,denominator);
        System.out.printf("K%d: %.15f, Numerator: %.15f, Denominator: %.15f, Numerator in Binary: %s\n", i, kValue,ni,ri,toBinary(ni,15));
        ni = ni * kValue;
        ri = ri * kValue;
        kValue = 2 - ri;

        /*
        numerator = numerator * kValue;
        denominator = denominator * kValue;
        kValue = 2 - denominator;
        */
      }
      //System.out.printf("K%d: %.15f, Numerator: %.15f, Denominator: %.15f\n", i, kValue,numerator,denominator);
      System.out.printf("K%d: %.15f, Numerator: %.15f, Denominator: %.15f, Numerator in Binary: %s\n", i, kValue,ni,ri,toBinary(ni,15));

      iterativeRemainder = Math.pow(2,15) * ((quotient * denominator) - numerator);
      trueRemainder = Math.pow(2,15) * ((quotient * denominator) - numerator);

      //Answer Clean up
      iterativeRemainder = floorDouble(iterativeRemainder, 15);
      trueRemainder = roundDouble(ni, 15);

      System.out.printf("Quotient by Code: %.15f, with remainder %.15f, Iterations: %d, \nQuotient by iteration: %.15f, with remainder remainder %.15f, Percent Error= %.5f",quotient, trueRemainder, iterations, ni ,iterativeRemainder, percentError(quotient, ni));

      //System.out.printf("N=%f,D=%f,Init=%f,Iterations=%d,Prec=%f,FinalPerc=%f",numerator, denominator,initialValue,iterations,percision,finalPercision);
  }



  private static double percentError(double errorTo, double testValue){
    return (errorTo - testValue) / errorTo;
  }
  private static double roundDouble(double toRound, int binaryPlaces){
    double scale = Math.pow(2, binaryPlaces);
    return Math.round(toRound * scale) / scale;
  }
  private static double floorDouble(double toFloor, int binaryPlaces){
    double scale = Math.pow(2, binaryPlaces);
    return Math.floor(toFloor * scale) / scale;
  }
  private static double ceilingDouble(double toCeiling, int binaryPlaces) {
    double scale = Math.pow(2, binaryPlaces);
    return Math.ceil(toCeiling * scale) / scale;
  }

  // Code I found online to make this process easy
  private static String toBinary(double d, int precision) {
      long wholePart = (long) d;
      return wholeToBinary(wholePart) + '.' + fractionalToBinary(d - wholePart, precision);
  }
  private static String wholeToBinary(long l) {
      return Long.toBinaryString(l);
  }
  private static String fractionalToBinary(double num, int precision) {
      StringBuilder binary = new StringBuilder();
      while (num > 0 && binary.length() < precision) {
          double r = num * 2;
          if (r >= 1) {
              binary.append(1);
              num = r - 1;
          } else {
              binary.append(0);
              num = r;
          }
      }
      return binary.toString();
  }
}
