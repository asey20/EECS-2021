public class  LabA7{
	public static void main(String[] args){
		int x = Integer.parseInt(args[0]);
		System.out.println(Integer.toBinaryString(x));

		int bit1 = x << 21;
		bit1 = bit1 >>> 31;
		int bit2 = x << 11;
		bit2 = bit2 >>> 31;

		if (bit1 == bit2) {
		System.out.println(Integer.toBinaryString(x));
		} else {
		int mask = 1049600;
		System.out.println(Integer.toBinaryString(x ^ mask));
		}
	} 
}
