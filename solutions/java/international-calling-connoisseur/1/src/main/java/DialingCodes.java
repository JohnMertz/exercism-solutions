import java.util.HashMap;
import java.util.Map;

public class DialingCodes {

    private final Map<Integer, String> dialingCode = new HashMap<>();

    public Map<Integer, String> getCodes() {
        return Map.copyOf(dialingCode);
    }

    public void setDialingCode(Integer code, String country) {
        dialingCode.put(code, country);
    }

    public String getCountry(Integer code) {
        return dialingCode.get(code);
    }

    public void addNewDialingCode(Integer code, String country) {
        if (!dialingCode.containsKey(code) && !dialingCode.containsValue(country) ) {
            dialingCode.put(code, country);
        }
    }

    public Integer findDialingCode(String country) {
        for (Integer key : dialingCode.keySet()) {
            if (getCountry(key) == country) return key;
        }
        return null;
    }

    public void updateCountryDialingCode(Integer code, String country) {
        Integer exists = findDialingCode(country);
        if (exists != null) {
            dialingCode.remove(findDialingCode(country));
        }
        dialingCode.put(code, country);
    }
}
