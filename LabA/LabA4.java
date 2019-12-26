public class  LabA4{
	public static void main(String[] args){
		int x = Integer.parseInt(args[0]);
		int z = x << 2;
		System.out.println(Integer.toBinaryString(x));
		System.out.println(Integer.toBinaryString(z));
		System.out.println(x);
		System.out.println(z);		
		z = x >>> 1;
		System.out.println(Integer.toBinaryString(x));
		System.out.println(Integer.toBinaryString(z));
		System.out.println(x);
		System.out.println(z);
		z = x >> 1;
		System.out.println(Integer.toBinaryString(x));
		System.out.println(Integer.toBinaryString(z));
		System.out.println(x);
		System.out.println(z);
	} 

}
