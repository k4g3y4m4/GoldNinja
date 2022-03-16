package com.codingdojo.goldninja.model;

public class Activity {
    private String activity;
    private int gold;
    private String WinorLose;
    private  String DateTime;

    public Activity(String activity, int gold, String WinorLose, String DateTime) {
        this.activity = activity;
        this.gold = gold;
        this.WinorLose = WinorLose;
        this.DateTime = DateTime;
    }

    //Getters and  Setters
    public String getActivity() {
        return activity;
    }
    public void setActivity(String activity) {
        this.activity = activity;
    }
    public int getGold() {
        return gold;
    }
    public void setGold(int gold) {
        this.gold = gold;
    }
    public String getWinorLose() {
        return WinorLose;
    }
    public void setWinorLose(String WinorLose) {
        this.WinorLose = WinorLose;
    }
    public String getDateTime() {
        return DateTime;
    }
    public void setDateTime(String DateTime) {
        this.DateTime = DateTime;
    }

    public String getMessage(String WinorLose){
       if(WinorLose.equals("green")){
           return "You entered a " + activity + " and earned " + gold + " golds. " + "(" + DateTime + ")";
       }else{
           return "You entered a " + activity + " and lost " + gold + " golds. " + "(" + DateTime + ")";
       }
    }
}
