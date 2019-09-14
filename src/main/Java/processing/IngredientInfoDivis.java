package processing;

public class IngredientInfoDivis {

	public String[][] IngredientInfoDivision(String[] infos) {

		String splitInfos[][] = new String[infos.length][2];

		for(int i = 0; i < infos.length; i++) {
			String tmp[] = infos[i].split(",", 0);

			splitInfos[i][0] = tmp[0];
			splitInfos[i][1] = tmp[1];
		}
		return(splitInfos);
	}
}
