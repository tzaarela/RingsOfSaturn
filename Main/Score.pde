import java.util.*;
import java.lang.Comparable;

class Score implements Comparable<Score>
{
	String name;
	int surviveTime;

	Score(String name, int surviveTime)
	{
		this.name = name;
		this.surviveTime = surviveTime;
	}

	int compareTo(Score target)
	{
		return this.surviveTime - target.surviveTime;
	}
}