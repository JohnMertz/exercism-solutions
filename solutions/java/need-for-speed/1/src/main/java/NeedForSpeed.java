class NeedForSpeed {
    public int speed;
    public int batteryDrain;
    public int distanceDriven;
    public int batteryLevel;

    NeedForSpeed(int speed, int batteryDrain) {
        this.speed = speed;
        this.batteryDrain = batteryDrain;
        this.distanceDriven = 0;
        this.batteryLevel = 100;
    }

    public boolean batteryDrained() {
        return this.batteryLevel < this.batteryDrain ? true : false;
    }

    public int distanceDriven() {
        return this.distanceDriven;
    }

    public void drive() {
        if (!this.batteryDrained()) {
            this.distanceDriven += this.speed;
            this.batteryLevel -= this.batteryDrain;
        }
    }

    public static NeedForSpeed nitro() {
        return new NeedForSpeed(50, 4);
    }
}

class RaceTrack {
    private int distance;

    RaceTrack(int distance) {
        this.distance = distance;
    }

    public boolean canFinishRace(NeedForSpeed car) {
        if (this.distance * 1.0 / car.speed > car.batteryLevel / car.batteryDrain) return false;
        return true;
    }
}
