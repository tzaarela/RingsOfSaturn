class WaveController
{
	float totalWaves;
	ArrayList<Wave> waves;
	Wave currentWave;
	Player player;
	
	WaveController(Player player)
	{
		this.player = player;
		totalWaves = 5;
		waves = new ArrayList<Wave>();
		currentWave = new Wave(1, player);
		waves.add(currentWave);
	}

	void update()
	{
		runWave();
		if(isWaveFinished(currentWave))
		{
			nextWave();
		}

		currentWave.update();
	}

	void runWave()
	{
		currentWave.spawnEnemy();
	}

	void nextWave()
	{
		currentWave = new Wave(currentWave.level + 1, player);
		println("Next wave: " + currentWave.level);
	}

	boolean isWaveFinished(Wave wave)
	{
		return wave.enemies.size() == 0;
	}
}