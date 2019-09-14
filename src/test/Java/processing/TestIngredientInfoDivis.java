package processing;

import static org.junit.Assert.*;

import org.junit.Test;

public class TestIngredientInfoDivis {

	final String className = new Object(){}.getClass().getEnclosingClass().getName();

	@Test
	public void test_001() {
		final String methodName = new Object(){}.getClass().getEnclosingMethod().getName();
		System.out.println("-------------------- " + className + " " + methodName + " START!! --------------------");

		try {
			IngredientInfoDivis testObject = new IngredientInfoDivis();
			String[] testInfos = {"白米,18000g","キムチ,8000g","ゴマ油,500g","ネギ,500g"};
			String[][] resultInfos = new String[testInfos.length][2];

			resultInfos = testObject.IngredientInfoDivision(testInfos);

			assertEquals(resultInfos[0][0], "白米");
			assertEquals(resultInfos[0][1], "18000g");
			assertEquals(resultInfos[1][0], "キムチ");
			assertEquals(resultInfos[1][1], "8000g");
			assertEquals(resultInfos[2][0], "ゴマ油");
			assertEquals(resultInfos[2][1], "500g");
			assertEquals(resultInfos[3][0], "ネギ");
			assertEquals(resultInfos[3][1], "500g");

		} catch (NullPointerException expected) {
			System.out.println("Test_Fail >>>" + methodName);
			fail();
		}
		System.out.println("--------------------" + className + " " + methodName + " END!!--------------------");
	}

}
