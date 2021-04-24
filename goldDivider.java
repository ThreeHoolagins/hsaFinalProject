
public class goldDivider {
  public static void main(String[] args) {
      double numerator, denominator, kValue, remainder, quotient, percision, finalPercision, scale, ulp;
      int iterations, internalPercision, outputPercision;

      if (args.length < 6) {
        System.out.printf("Usage: java goldDivider numerator denominator intial-value iterations prec prec_f \n");
        System.exit(0);
      }

      numerator = Double.parseDouble(args[0]);
      denominator = Double.parseDouble(args[1]);
      //kValue = Double.parseDouble(args[2]);
      kValue = 0.75;
      iterations = Integer.parseInt(args[3]);
      percision = Double.parseDouble(args[4]);
      finalPercision = Double.parseDouble(args[5]);

      /*internalPercision = (int) percision;
      outputPercision = (int) finalPercision;

      numerator = roundDouble(numerator, internalPercision);
      denominator = roundDouble(denominator, internalPercision);*/

      quotient = numerator / denominator;
      double rI = 0;
      for (int i = 0; i < iterations; i++) {
        numerator = numerator * kValue;
        denominator = denominator * kValue;
        kValue = 2 - denominator;
      }

      System.out.printf("Quotient by Code: %.15f, Iterations: %d, Quotient by iteration: %.15f, Percent Error= %.2f",quotient, iterations, numerator, percentError(quotient, numerator));

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
}
