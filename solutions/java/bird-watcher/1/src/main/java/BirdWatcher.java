class BirdWatcher {
    private final int[] birdsPerDay;

    public BirdWatcher(int[] birdsPerDay) {
        this.birdsPerDay = birdsPerDay.clone();
    }

    public int[] getLastWeek() {
        return this.birdsPerDay;
    }

    public int getToday() {
        return this.birdsPerDay[6];
    }

    public void incrementTodaysCount() {
        this.birdsPerDay[6]++;
    }

    public boolean hasDayWithoutBirds() {
        for (int i = 0; i <= 6; i++) {
            if (this.birdsPerDay[i] == 0) {
                return true;
            }
        }
        return false;
    }

    public int getCountForFirstDays(int numberOfDays) {
        int sum = 0;
        
        for (int i = 0; i < numberOfDays; i++) {
            sum += this.birdsPerDay[i];
            if (i == 6) break;
        }
        return sum;
    }

    public int getBusyDays() {
        int days = 0;
        for (int i = 0; i < 6; i++) {
            if (this.birdsPerDay[i] >= 5) {
                days++;
            }
        }
        return days;
    }
}
