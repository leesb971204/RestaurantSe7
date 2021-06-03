package storage.statistics;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class StatisticsDAO {

   private Connection conn;
   private PreparedStatement pstmt;
   private ResultSet rs;
   int[] months = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
   Calendar cal = Calendar.getInstance();
   
   public StatisticsDAO() {
      try {
         String dbURL = "jdbc:mariadb://localhost:3306/se7";
         String dbID = "root";
         String dbPassword = "Joonhoo1!";
         Class.forName("org.mariadb.jdbc.Driver");
         conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
      }catch(Exception e) {
         e.printStackTrace();
      }
   }

   public int getTodayStat(Statistics stat) {
      Calendar cal = Calendar.getInstance();
      SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
      String datestr = sdf.format(cal.getTime());
      stat.setToday(Integer.toString(cal.get(Calendar.MONTH)+1)+"월 "+Integer.toString(cal.get(Calendar.DATE))+"일");
      
      try {
         String sql = "select count(*) from booking where bookingDateTime like ?";
         String sql2 = "select sum(totalPeople) from booking where bookingDateTime like ?";
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, datestr+"%");
         rs=pstmt.executeQuery();
         if(rs.next()) {
            stat.setTodayReservation(rs.getInt(1));
         }
         
         pstmt=conn.prepareStatement(sql2);
         pstmt.setString(1, datestr+"%");
         rs=pstmt.executeQuery();
         
         if(rs.next()) {
            stat.setTodayReservationTotal(rs.getInt(1));
         }
         return 1; //성공
      }catch(Exception e) {
         e.printStackTrace();
      }
      return -1; //실패
   }
   
   public int getWeekStat(Statistics stat) {
      
      Calendar cal = Calendar.getInstance();
      SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
      String datestr = sdf.format(cal.getTime());
      
      int firstMonth = cal.get(Calendar.MONTH); //0부터 11까지
      int lastMonth = cal.get(Calendar.MONTH);
      
      int date = cal.get(Calendar.DATE); //계산을 위해 오늘 날짜가 필요함
      int weekday = cal.get(Calendar.DAY_OF_WEEK); //1부터 7까지, 일~토 뜻함
      int first = date-weekday+2; //이번주의 월요일날
      int last = date+8-weekday; //이번주의 일요일날
      
      if(first<1) {
         firstMonth-=1;
         first=months[firstMonth]+first;
      }
      
      if(last>months[lastMonth]) {
         last-=months[lastMonth];
         lastMonth+=1;
      }
      
      stat.setFirstWeek(Integer.toString(firstMonth+1)+"/"+Integer.toString(first));
      stat.setLastWeek(Integer.toString(lastMonth+1)+"-"+Integer.toString(last));
      
      try {
         String sql = "select count(*) from booking where bookingDateTime between ? and ?";
         String sql2 = "select sum(totalPeople) from booking where bookingDateTime between ? and ?";
         pstmt = conn.prepareStatement(sql);
         
         pstmt.setString(1, datestr+"-"+Integer.toString(firstMonth+1)+"-"+Integer.toString(first)+"%"); //이번주의 월요일 날짜부터
         pstmt.setString(2, datestr+"-"+Integer.toString(lastMonth+1)+"-"+Integer.toString(last)+"%"); //이번주의 일요일 날짜까지
         
         rs=pstmt.executeQuery();
         if(rs.next()) {
            stat.setWeekReservation(rs.getInt(1));
         }
         
         pstmt=conn.prepareStatement(sql2);
         pstmt.setString(1, datestr+"-"+Integer.toString(firstMonth+1)+"-"+Integer.toString(first)+"%"); //이번주의 월요일 날짜부터
         pstmt.setString(2, datestr+"-"+Integer.toString(lastMonth+1)+"-"+Integer.toString(last)+"%"); //이번주의 일요일 날짜까지
         rs=pstmt.executeQuery();
         
         if(rs.next()) {
            stat.setWeekReservationTotal(rs.getInt(1));
         }
         return 1; //성공
      }catch(Exception e) {
         e.printStackTrace();
      }
      return -1; //실패
   }
   
  
   public int getMonthStat(Statistics stat) {
      Calendar cal = Calendar.getInstance();
      SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
      String datestr = sdf.format(cal.getTime());
      int month=cal.get(Calendar.MONTH)+1;
      stat.setFirstMonth(Integer.toString(month)+"월 1일");
      stat.setLastMonth(Integer.toString(month)+"월 "+Integer.toString(months[month])+"일");

      try {
      String sql = "select count(*) from booking where bookingDateTime like ?";
      String sql2 = "select sum(totalPeople) from booking where bookingDateTime like ?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, datestr+"%");
      rs=pstmt.executeQuery();
      if(rs.next()) {
         stat.setMonthReservation(rs.getInt(1));
      }
      
      pstmt=conn.prepareStatement(sql2);
      pstmt.setString(1, datestr+"%");
      rs=pstmt.executeQuery();
      if(rs.next()) {
         stat.setMonthReservationTotal(rs.getInt(1));
         
      }
      return 1; //성공
      
      }catch(Exception e) {
         e.printStackTrace();
      }
      return -1; //실패
   }

   public int getTableCount(Statistics stat) {

      try {
      String sql = "select count(*) from `table`";
      pstmt = conn.prepareStatement(sql);
      rs=pstmt.executeQuery();
      if(rs.next()) {
         stat.setTableCount(rs.getInt(1));
      }
      return 1; //성공
      
      }catch(Exception e) {
         e.printStackTrace();
      }
      return -1; //실패
   }
      
   public int getEachMonthStatistics(String Date) {
      Calendar cal = Calendar.getInstance();
      SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
      String datestr = sdf.format(cal.getTime());
      
      try {
         String sql = "select count(*) from booking where bookingDateTime like ?";
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, datestr+"-"+Date+"%");
         rs=pstmt.executeQuery();
      
               if(rs.next()) {
                  return rs.getInt(1);
               }
         
      
      }catch(Exception e) {
         return -1;
      }
   return 0;
   }
   
   public int getEachMonthTotal(String Date) {
      Calendar cal = Calendar.getInstance();
      SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
      String datestr = sdf.format(cal.getTime());
      
      try {
         String sql = "select sum(totalPeople) from booking where bookingDateTime like ?";
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, datestr+"-"+Date+"%");
         rs=pstmt.executeQuery();
      
               if(rs.next()) {
                  return rs.getInt(1);
               }
         
      
      }catch(Exception e) {
         return -1;
      }
   return 0;
   }
   
   public int getAgeStatistics(int age) {
      SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
      String datestr = sdf.format(cal.getTime());
      int to = Integer.parseInt(datestr);
      String sql;
      
      try {
         if(age>=60) {
            sql = "select count(*) from user where userbirth <=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, Integer.toString(to-age+1)+"-01-01");
            rs=pstmt.executeQuery();
         }
         
         else {
         sql = "select count(*) from user where userbirth between ? and ?";
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, Integer.toString(to-age-9)+"-12-31");
         pstmt.setString(2, Integer.toString(to-age+1)+"-01-01");
         rs=pstmt.executeQuery();
         }
         
         if(rs.next()) {
               System.out.println(rs.getInt(1));
               return rs.getInt(1);
            }
      }catch(Exception e) {
         e.printStackTrace();
      }
      return -1;
   }
   
   public int getAllUser() {
      String sql="select count(*) from user";
      
      try {
         pstmt = conn.prepareStatement(sql);
         rs=pstmt.executeQuery();
         
         if(rs.next()) {
               return rs.getInt(1);
            }
      }catch(Exception e) {
         e.printStackTrace();
      }
      return -1;
   }
   
   public int getGenderStatistics(String gender) {
      String sql="select count(*) from user where userGender=?";
      try {
         pstmt=conn.prepareStatement(sql);
         pstmt.setString(1, gender);
         rs=pstmt.executeQuery();
         
         if(rs.next()) {
            return rs.getInt(1);
         }
      }catch(Exception e) {
         e.printStackTrace();
      }
      return -1;
   }
   
   public int getUnderAgeStatistics(String month) {
      Calendar cal = Calendar.getInstance();
      SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
      String datestr = sdf.format(cal.getTime());
      
      String sql="select sum(ageUnder) from booking where bookingDateTime like ?";
      try {
         pstmt=conn.prepareStatement(sql);
         pstmt.setString(1, datestr+"-"+month+"%");
         rs=pstmt.executeQuery();
         
         if(rs.next()) {
            return rs.getInt(1);
         }
      }catch(Exception e) {
         e.printStackTrace();
      }
      return -1;
   }
   
}