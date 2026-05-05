class SqueakyClean {
    static String clean(String identifier) {
        char[] dirty = identifier.toCharArray();
        String tidy = "";

        boolean nextUpper = false;
        for (int i = 0; i < identifier.length(); i++) {
            switch (dirty[i]) {
                case ' ':
                    tidy += '_';
                    break;
                case '-':
                    nextUpper = true;
                    break;
                case '0':
                    tidy += 'o';
                    break;
                case '1':
                    tidy += 'l';
                    break;
                case '3':
                    tidy += 'e';
                    break;
                case '4':
                    tidy += 'a';
                    break;
                case '7':
                    tidy += 't';
                    break;
                default:
                    if ((int)dirty[i] < 65) break;
                    if ((int)dirty[i] < 91) tidy += dirty[i];
                    if ((int)dirty[i] < 97) break;
                    if ((int)dirty[i] < 122) {
                        if (nextUpper) {
                            tidy += (char)(dirty[i]-32);
                            nextUpper = false;
                        } else {
                            tidy += dirty[i];
                        }
                    }
            }
        }
        return tidy;
    }
}
