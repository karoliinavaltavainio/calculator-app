class ConversionController {
  /// Converts kilometers to miles.
  static double kmToMiles(double kilometers) {
    const double conversionFactor = 0.621371;
    return kilometers * conversionFactor;
  }
}