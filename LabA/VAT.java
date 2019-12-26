import java.util.*;

public class VAT
{
        public static void main(String[] args)
        {
                final int LIMIT = 1000000;
                final int FACTOR = 35;
                final int BIT1 = 12;
                final int BIT2 = 22;
                int age = Integer.parseInt(args[0]);
                
		if (age < LIMIT) {
		int x = age * FACTOR;
		int mask = 4096;
		int y = x & mask;
		y = y >> 12;
		System.out.println(Integer.toBinaryString(y));
		} else {
		int mask1 = 4096;
		int a = age & mask1;
		a = a >> 12;
		int mask2 = 4194304;
		int z = age & mask2;
		z = z >> 22;
		
		if (a == z) {
		System.out.println(age);
		} else {
		int mask3 = 4198400;
		System.out.println(age ^ mask3); 
		}
		}

	}
}
