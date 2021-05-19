@isTest
public class TemperatureConverterTest {
   @isTest 
    static void testmethod1(){
        Decimal celsius=TemperatureConverter.FahrenheitToCelsius(70);
         System.assertEquals(21.11,celsius);  
    }
}