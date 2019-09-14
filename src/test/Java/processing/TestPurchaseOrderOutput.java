package processing;

import static org.junit.Assert.*;

import org.junit.Test;

public class TestPurchaseOrderOutput {

	final String className = new Object(){}.getClass().getEnclosingClass().getName();

	// テスト出力 実行用
	@Test
	public void test_001() {
		final String methodName = new Object(){}.getClass().getEnclosingMethod().getName();
		System.out.println("-------------------- " + className + " " + methodName + " START!! --------------------");

		try {
			String[][] testInfos = {{"白米","18000g"},{"キムチ","8000g"},{"ゴマ油","500g"},{"ネギ","500g"}};
			PurchaseOrderOutput testObject = new PurchaseOrderOutput();
			int result = testObject.PurchaseOrder(testInfos);
			assertEquals(result, 0);

		} catch (NullPointerException expected) {
			System.out.println("Test_Fail >>>" + methodName);
			fail();
		}
		System.out.println("--------------------" + className + " " + methodName + " END!!--------------------");
	}
}
