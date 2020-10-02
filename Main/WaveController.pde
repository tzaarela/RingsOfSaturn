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
		currentWave = new Wave(2, player);
		waves.add(currentWave);
	}

	void update()
	{
		currentWave.spawnEnemies();

		if(currentWave.hasEnemiesSpawned)
		{
			if(isWaveFinished(currentWave))
			{
				float currentTime = millis();
				if(currentTime == currentWave.waveEndTimer + currentTime)
					currentWave.waveEndTimer = currentTime;

				if(currentWave.newWaveTimer + currentWave.waveEndTimer < millis())
				{
					nextWave();
				}
			}
			currentWave.update();
		}
	}

	void nextWave()
	{
		currentWave = new Wave(currentWave.level + 1, player);
	}

	boolean isWaveFinished(Wave wave)
	{
		for (Enemy enemy : wave.enemies) 
		{
			if(!enemy.isDead)
				return false;
		}
		return true;
	}
}