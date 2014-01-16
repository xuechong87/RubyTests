package test;

public class CodeTest{

	/**
	*求字符串长度
	**/
	void lengthTest(String s){
		System.out.printf("charlen = %d\n",s.length());
		System.out.printf("codepoint len=%d\n",s.codePointCount(0,s.length()));
	}

	/**
	*	按文字循环
	**/
	voiditerTest(String s){
		//基于char对字符串循环
		for (int charIndex = 0;charIndex<s.length;charIndex++  ) {
			int c = s.charAt(charIndex);
			System.out.printf("%x\n",c);
		}

		//基于codePoint循环
		for (int codeIndex = 0;codeIndex<s.length ; ) {
			int c = s.codePointAt(codeIndex);
			System.out.printf("%x\n",c);
			codeIndex += Character.charCount(c);
		}
	}
	
	public static void main(String[] args) {
		
	}

}