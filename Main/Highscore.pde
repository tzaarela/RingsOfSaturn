import java.util.*;

class Highscore
{
	ArrayList<Score> highscores;
	PFont font;
	int frame;

	Highscore() 
	{
		highscores = getHighscore();
		font = createFont("Font/alienleaguebold.ttf", 42);
	}


	void draw()
	{
		drawHighscore();
	}

	void drawHighscore()
	{
		rectMode(CORNER);
		textAlign(CORNER);
		fill(color(0, 0, 0, 100));
		rect(-400, -250, 800, 500);
		fill(255);
		text("Highscore", -380, -180);
		text("Your score:", 0, -180);
		text("Name", -380, -80);
		text("Time Survived", -100, -80);

		push();
		textSize(30);
		for (int i = 0; i < highscores.size(); ++i) 
		{
			Score score = highscores.get(i);
			text(score.name, -380, 100 * i);
			text(score.surviveTime, -100, 100 * i);
		}
		pop();
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
