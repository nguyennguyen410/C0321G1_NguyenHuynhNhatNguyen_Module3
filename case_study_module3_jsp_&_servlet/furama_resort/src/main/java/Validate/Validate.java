package Validate;

public class Validate {
    public static String validateCustomerId(String customerId) {
        String message = null;
        String regex = "^[K][H][-]([0-9]{4})$";
        if (!customerId.matches(regex)) {
            message = "Not OK. Customer Id invalid";
        }
        return message;
    }

    public static String validateServiceId(String serviceId) {
        String message = null;
        String regex = "^[D][V][-]([0-9]{4})$";
        if (!serviceId.matches(regex)) {
            message = "Not OK. Service Id invalid";
        }
        return message;
    }

    public static String validateCustomerPhone(String customerPhone) {
        String message = null;
        String regex = "^\\([0-9]{2}\\)-[0-9]{10}$";
        if (!customerPhone.matches(regex)) {
            message = "Not OK. Customer Phone invalid";
        }
        return message;
    }

    public static String validateCustomerIdCard(String customerIdCard) {
        String message = null;
        String regex = "^[0-9]{9}$";
        if (!customerIdCard.matches(regex)) {
            message = "Not OK. Customer Id Card invalid";
        }
        return message;
    }

    public static String validateCustomerEmail(String customerEmail) {
        String message = null;
        String regex = "^[a-z][a-zA-Z0-9\\.\\_]*+\\@[a-z0-9A-Z]+(\\.[a-z]{2,})+$";
        if (!customerEmail.matches(regex)) {
            message = "Not OK. Customer Email invalid";
        }
        return message;
    }

    public static String validateCustomerDate(String customerDate) {
        String message = null;
        String regex = "^\\d{4}[/]\\d{2}[/]\\d{2}$";
        if (!customerDate.matches(regex)) {
            message = "Not OK. Customer Date invalid";
        }
        return message;
    }

    public static String validateNumber(String number) {
        String message = null;
        String regex = "^[0-9]+$";
        if (!number.matches(regex)) {
            message = "Not OK. Number invalid";
        }
        return message;
    }

    public static String validateMoney(String money) {
        String message = null;
        String regex = "^[0-9]+$";
        if (!money.matches(regex)) {
            message = "Not OK. Money invalid";
        }
        return message;
    }
}
