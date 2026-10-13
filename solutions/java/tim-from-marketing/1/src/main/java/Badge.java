class Badge {
    public String print(Integer id, String name, String department) {
        String out = "";
        if (id != null) out += "[" + id + "] - ";
        out += name;
        if (department == null) {
            out += " - OWNER";
        } else {
            out += " - " + department.toUpperCase();
        }
        return out;
    }
}
