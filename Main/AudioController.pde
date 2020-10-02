class AudioController
{
	HashMap<String, Audio> sounds;

	AudioController()
	{
		sounds = new HashMap<String, Audio>();
	}

	void loadSound(String soundFile)
	{
		sounds.put(soundFile, new Audio(soundFile));
	}

	void playSound(String soundFile)
	{
		sounds.get(soundFile).sound.play();
	}

	void stopSound(String soundFile)
	{
		sounds.get(soundFile).sound.stop();
	}

	void loopSound(String soundFile)
	{
		sounds.get(soundFile).sound.loop();
	}

	void volumeSound(String soundFile, float volume)
	{
		sounds.get(soundFile).sound.amp(volume);
	}

	void rateOfSound(String soundFile, float rate)
	{
		sounds.get(soundFile).sound.rate(rate);
	}
}