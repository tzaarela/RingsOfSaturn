import java.util.*;

class Highscore
{
	ArrayList<Score> highscores;
	PFont font;

	Highscore() 
	{
		highscores = getHighscore();
		font = createFont("Font/alienleaguebold.ttf", 72);
	}


	void draw()
	{
		translate(resolutionX / 2, resolutionY / 2);
		rectMode(CENTER);
		textAlign(LEFT) ;
		fill(0);
		rect(-100, 0, 300, 500);
		fill(255);
		text("Highscore", 0, 10);
		text("Name", 0, 100);
		text("Time Survived", 0, 100);

		for (int i = 0; i < highscores.size(); ++i) 
		{
			Score score = highscores.get(i);

			text(score.name, 0, 20 + 100 * i);
			text(score.surviveTime, 0, 20 + 100 * i);
		}
	}

	ArrayList<Score> getHighscore()
	{
		ArrayList<Score> scores = new ArrayList<Score>();
		String[] scoreStrings = loadStrings("Highscores.txt");

		for (String scoreStr : scoreStrings) 
		{
			String[] score = splitTokens(scoreStr, ", ");

			scores.add(new Score(score[0], Integer.parseInt(score[1])));
			
		}

		Collections.sort(scores);
		return scores;
	}

	
}
