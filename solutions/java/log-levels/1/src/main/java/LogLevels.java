public class LogLevels {

    public static String message(String logLine) {
        char[] c = logLine.toCharArray();
        String message = "";
        String word = "";
        boolean inMsg = false;
        for (int i = 0; i < c.length; i++) {
            if (c[i] == '\r' || c[i] == '\n' || c[i] == '\t') continue; // ignore newlines and tabs
            if (inMsg) {
                if (c[i] == ' ') {
                    if (message == "" && word == "") continue; // ignore leading spaces
                    if (word != " ") message += word; // Reduce all spaces to 1 character
                    word = " ";
                } else {
                    word += c[i];
                }
            } else if (c[i] == ' ') {
                inMsg = true;
            }
        }
        if (word != " ") message += word;
        return message;
    }

    public static String logLevel(String logLine) {
        char[] c = logLine.toCharArray();
        String level = "";
        for (int i = 1; i < c.length; i++) {
            if (c[i] == ']') break;
            level += c[i];
        }
        return level.toLowerCase();
    }

    public static String reformat(String logLine) {
        String out = String.format("%s (%s)", message(logLine), logLevel(logLine));
        return out;
    }
}
