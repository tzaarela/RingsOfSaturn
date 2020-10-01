class Audio
{
	SoundFile sound;

	Audio(String soundFile)
	{
		String path = sketchPath("\\data\\" + soundFile);
		this.sound = new SoundFile(mainInstance, path);
	}

}