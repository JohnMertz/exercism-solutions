public class CarsAssemble {

    public double productionRatePerHour(int speed) {
        double built = 221 * speed;
        if (speed <= 4) {
           return built;
        } else if (speed <= 8) {
           return 0.9 * built;
        } else if (speed == 9) {
           return 0.8 * built;
        } else {
           return 0.77 * built;
        } 
    }

    public int workingItemsPerMinute(int speed) {
        double hourly = productionRatePerHour(speed);
        return (int)(hourly/60);
    }
}
