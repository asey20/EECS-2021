
public class LabA2 
{
	public static void main(String[] args) {
		int num = Integer.parseInt(args[0]);
		System.out.println(Integer.toHexString(num));
		int rev = Integer.reverse(num);
		System.out.println(Integer.toHexString(rev));
		int revByte = Integer.reverseBytes(num);
		System.out.println(Integer.toHexString(revByte));
	}
}
