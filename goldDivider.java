
public class goldDivider {
  public static void main(String[] args) {
      double numerator, denominator, initialValue, remainder, quotient, percision, finalPercision, scale, ulp;
      int iterations, internalPercision, outputPercision;

      if (args.length < 6) {
        System.out.printf("Usage: java goldDivider numerator denominator intial-value iterations prec prec_f \n");
        System.exit(0);
      }

      numerator = Double.parseDouble(args[0]);
      denominator = Double.parseDouble(args[1]);
      initialValue = Double.parseDouble(args[2]);
      iterations = Integer.parseInt(args[3]);
      percision = Double.parseDouble(args[4]);
      finalPercision = Double.parseDouble(args[5]);

      internalPercision = (int) percision;
      outputPercision = (int) finalPercision;

      numerator = roundDouble(numerator, internalPercision);
      denominator = roundDouble(denominator, internalPercision);

      quotient = numerator / denominator;

      System.out.printf("N=%f,D=%f,Init=%f,Iterations=%d,Prec=%f,FinalPerc=%f",numerator, denominator,initialValue,iterations,percision,finalPercision);
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
