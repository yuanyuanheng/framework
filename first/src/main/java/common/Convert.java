package common;

public class Convert {
	public static String toString(byte[] src) {
		StringBuilder sBuilder = new StringBuilder();
		for (byte b : src) {
			int nH = b & 0xff;
			String sH = Integer.toHexString(nH);
			if (sH.length() < 2) {
				sBuilder.append(0);
			}
			sBuilder.append(sH);
		}
		return sBuilder.toString();
	}

	public static byte[] toByte(String sHex) {
		sHex = sHex.toUpperCase();
		int nLen = sHex.length() / 2;
		char[] c = sHex.toCharArray();
		byte[] b = new byte[nLen];
		for (int i = 0; i < nLen; i++) {
			int nPos = i * 2;
			b[i] = (byte) (toByte(c[nPos])<<4 | toByte(c[nPos+1]));
		}
		return b;
	}

	public static byte toByte(char c){
		return (byte)"0123456789ABCDEF".indexOf(c);
	}
}
