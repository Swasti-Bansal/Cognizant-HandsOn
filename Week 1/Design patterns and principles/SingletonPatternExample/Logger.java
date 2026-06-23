public class Logger {

    // Single instance of Logger
    private static Logger obj;

    // Private constructor
    private Logger() {
        System.out.println("Logger instance created");
    }

    // Method to get the single instance
    public static Logger getInstance() {
        if (obj == null) {
            obj = new Logger();
        }
        return obj;
    }

    public void log(String msg) {
        System.out.println("Log: " + msg);
    }
}