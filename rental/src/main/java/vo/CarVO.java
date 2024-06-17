package vo;

public class CarVO {
		private int carNumber; //설정
		private String carName;
		private String carCompany;        
		private int carYear;
		private int carSeater;        
		private String carType;        
		private int carInsuranceage;        
		private String carFuel;
		private int carPrice;
		private String carStatus;
		private boolean carLowPrice;
        
		public int getCarNumber() {
			return carNumber;
		}
		public void setCarNumber(int carNumber) {
			this.carNumber = carNumber;
		}
		public String getCarName() {
			return carName;
		}
		public void setCarName(String carName) {
			this.carName = carName;
		}
		public String getCarCompany() {
			return carCompany;
		}
		public void setCarCompany(String carCompany) {
			this.carCompany = carCompany;
		}
		public int getCarYear() {
			return carYear;
		}
		public void setCarYear(int carYear) {
			this.carYear = carYear;
		}
		public int getCarSeater() {
			return carSeater;
		}
		public void setCarSeater(int carSeater) {
			this.carSeater = carSeater;
		}
		public String getCarType() {
			return carType;
		}
		public void setCarType(String carType) {
			this.carType = carType;
		}
		public int getCarInsuranceage() {
			return carInsuranceage;
		}
		public void setCarInsuranceage(int carInsuranceage) {
			this.carInsuranceage = carInsuranceage;
		}
		public String getCarFuel() {
			return carFuel;
		}
		public void setCarFuel(String carFuel) {
			this.carFuel = carFuel;
		}
		public int getCarPrice() {
			return carPrice;
		}
		public void setCarPrice(int carPrice) {
			this.carPrice = carPrice;
		}
		public String getCarStatus() {
			return carStatus;
		}
		public void setCarStatus(String carStatus) {
			this.carStatus = carStatus;
		}
		public boolean isCarLowPrice() {
			return carLowPrice;
		}
		public void setCarLowPrice(boolean carLowPrice) {
			this.carLowPrice = carLowPrice;
		}
		
		@Override
		public String toString() {
			return "CarVO [carNumber=" + carNumber + ", carName=" + carName + ", carCompany=" + carCompany
					+ ", carYear=" + carYear + ", carSeater=" + carSeater + ", carType=" + carType
					+ ", carInsuranceage=" + carInsuranceage + ", carFuel=" + carFuel + ", carPrice=" + carPrice
					+ ", carStatus=" + carStatus + ", carLowPrice=" + carLowPrice + "]";
		}
        
}
