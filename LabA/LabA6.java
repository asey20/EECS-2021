public class  LabA6{
	public static void main(String[] args){
		int x = Integer.parseInt(args[0]);
		System.out.println(Integer.toBinaryString(x));
		int mask = 1024;
		x = x | mask;
		int pseudomask = 2147481599;
		x = x & pseudomask;
		System.out.println(Integer.toBinaryString(x));

	} 
}
