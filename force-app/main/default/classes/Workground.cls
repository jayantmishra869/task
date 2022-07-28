public class Workground {
    ApexPages.StandardSetController setCon;
    public Workground(ApexPages.StandardSetController controller) {
        setCon = controller;
    }

    public integer getMySelectedSize() {
        return setCon.getSelected().size();
    }

    public integer getMyRecordsSize() {
        return setCon.getRecords().size();
    }
}