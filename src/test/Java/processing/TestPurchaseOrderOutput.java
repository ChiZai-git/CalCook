package processing;

import static org.junit.Assert.*;

import org.junit.Test;

public class TestPurchaseOrderOutput {

	// テスト出力 実行用
	@Test
	public void test_001() {
		final String methodName = new Object(){}.getClass().getEnclosingMethod().getName();
		System.out.println("-------------------- " + methodName + " START!! --------------------");

		try {
			PurchaseOrderOutput testObject = new PurchaseOrderOutput();
			int result = testObject.PurchaseOrder();
			assertEquals(result, 0);

		} catch (NullPointerException expected) {
			System.out.println("Test_Fail >>>" + methodName);
			fail();
		}
		System.out.println("--------------------" + methodName + "END!!--------------------");
	}
}
