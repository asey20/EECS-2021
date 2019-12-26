public class  LabA3{
	public static void main(String[] args){
		int x = Integer.parseInt(args[0]);
		int y = Integer.parseInt(args[1]);
		
		int z = x & y;
		System.out.println(Integer.toBinaryString(z));
		z = x | y;
		System.out.println(Integer.toBinaryString(z));
		z = x ^ y; 
		System.out.println(Integer.toBinaryString(z));
		z = ~x;
		System.out.println(Integer.toBinaryString(z));
	} 
}
