

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpSession;

public class HoursCalculation {
	public long calculateHour(String intime) {

		Date d1 = null;
		Date d2 = null;
		long differenceHours = 0;
		try {

			// HH converts hour in 24 hours format (0-23), day calculation
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

			d1 = format.parse(intime);
			d2 = format.parse(format.format(new Date()));
			long timeDifference = d2.getTime() - d1.getTime();
			System.out.println("Time Difference "+timeDifference);
			
			long diffSeconds = timeDifference / 1000 % 60;
			long diffMinutes = timeDifference / (60 * 1000) % 60;
			long diffHours = timeDifference / (60 * 60 * 1000) % 24;
			long diffDays = timeDifference / (24 * 60 * 60 * 1000);

			System.out.print(diffDays + " days, ");
			System.out.print(diffHours + " hours, ");
			System.out.print(diffMinutes + " minutes, ");
			System.out.print(diffSeconds + " seconds.");
			
			
			differenceHours = timeDifference / (60 * 60 * 1000) % 24;
			
			long totalhours=differenceHours+(diffDays*24);
			System.out.println("Hours  " + totalhours);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return differenceHours;

	}

	public static void main(String[] args) {
		String intime = "2020-05-23 19:40:33";
		HoursCalculation hoursCalculation = new HoursCalculation();
		hoursCalculation.calculateHour(intime);
	}

}
