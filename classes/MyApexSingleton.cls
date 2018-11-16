public with sharing class MyApexSingleton {
    private static MyApexSingleton classInstance;

    static {
        classInstance = new MyApexSingleton();
    }

    private MyApexSingleton() {
        
    }

    public static MyApexSingleton getInstance() {
        return classInstance;
    }
}