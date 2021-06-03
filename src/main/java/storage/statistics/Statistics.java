package storage.statistics;

public class Statistics {
   //오늘 예약 정보   
   private String Today;
   private int TodayReservation;
   private int TodayReservationTotal;
   
   //이번주 예약 정보
   private String firstWeek;
   private String lastWeek;
   private int WeekReservation;
   private int WeekReservationTotal;
   
   //이번달 예약 정보
   private String Month;
   private String firstMonth;
   private String lastMonth;
   private int MonthReservation;
   private int MonthReservationTotal;
   
   //총 테이블 개수
   private int TableCount;
   
   
   
   
   public String getToday() {
      return Today;
   }

   public void setToday(String today) {
      Today = today;
   }

   public String getFirstWeek() {
      return firstWeek;
   }

   public void setFirstWeek(String firstWeek) {
      this.firstWeek = firstWeek;
   }

   public String getLastWeek() {
      return lastWeek;
   }

   public void setLastWeek(String lastWeek) {
      this.lastWeek = lastWeek;
   }

   public String getMonth() {
      return Month;
   }

   public void setMonth(String month) {
      Month = month;
   }

   public String getFirstMonth() {
      return firstMonth;
   }

   public void setFirstMonth(String firstMonth) {
      this.firstMonth = firstMonth;
   }

   public String getLastMonth() {
      return lastMonth;
   }

   public void setLastMonth(String lastMonth) {
      this.lastMonth = lastMonth;
   }


   
   public int getTodayReservation() {
      return TodayReservation;
   }

   public void setTodayReservation(int todayReservation) {
      TodayReservation = todayReservation;
   }

   public int getTodayReservationTotal() {
      return TodayReservationTotal;
   }

   public void setTodayReservationTotal(int todayReservationTotal) {
      TodayReservationTotal = todayReservationTotal;
   }
   
   
   
   
   public int getWeekReservation() {
      return WeekReservation;
   }

   public void setWeekReservation(int weekReservation) {
      WeekReservation = weekReservation;
   }

   public int getWeekReservationTotal() {
      return WeekReservationTotal;
   }

   public void setWeekReservationTotal(int weekReservationTotal) {
      WeekReservationTotal = weekReservationTotal;
   }

   
   
   
   
   public int getMonthReservation() {
      return MonthReservation;
   }

   public void setMonthReservation(int monthReservation) {
      MonthReservation = monthReservation;
   }

   public int getMonthReservationTotal() {
      return MonthReservationTotal;
   }

   public void setMonthReservationTotal(int monthReservationTotal) {
      MonthReservationTotal = monthReservationTotal;
   }

   public int getTableCount() {
      return TableCount;
   }

   public void setTableCount(int tableCount) {
      TableCount = tableCount;
   }
}