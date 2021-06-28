package model;

public class Customer {
    private String nameCustomer;
    private String birthdayCustomer;
    private String adressCustomer;
    private String avatarCustomer;

    public Customer(String nameCustomer, String birthdayCustomer, String adressCustomer, String avatarCustomer) {
        this.nameCustomer = nameCustomer;
        this.birthdayCustomer = birthdayCustomer;
        this.adressCustomer = adressCustomer;
        this.avatarCustomer = avatarCustomer;
    }

    public String getNameCustomer() {
        return nameCustomer;
    }

    public void setNameCustomer(String nameCustomer) {
        this.nameCustomer = nameCustomer;
    }

    public String getBirthdayCustomer() {
        return birthdayCustomer;
    }

    public void setBirthdayCustomer(String birthdayCustomer) {
        this.birthdayCustomer = birthdayCustomer;
    }

    public String getAdressCustomer() {
        return adressCustomer;
    }

    public void setAdressCustomer(String adressCustomer) {
        this.adressCustomer = adressCustomer;
    }

    public String getAvatarCustomer() {
        return avatarCustomer;
    }

    public void setAvatarCustomer(String avatarCustomer) {
        this.avatarCustomer = avatarCustomer;
    }
}
