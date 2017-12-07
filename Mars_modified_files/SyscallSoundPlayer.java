package mars.mips.instructions.syscalls;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;
import javax.sound.sampled.AudioInputStream;
import javax.sound.sampled.AudioSystem;
import javax.sound.sampled.Clip;
import javax.sound.sampled.DataLine;
import javax.sound.sampled.FloatControl;
import javax.sound.sampled.LineUnavailableException;
import javax.sound.sampled.UnsupportedAudioFileException;
import mars.ProcessingException;
import mars.ProgramStatement;
import mars.mips.hardware.RegisterFile;

public class SyscallSoundPlayer extends AbstractSyscall
{
    private static Map<Integer, Clip> sounds;

    private final int PLAY = 0;
    private final int STOP = 1;
    private final int STOP_ALL = 2;

    private String defaultPath;

    public SyscallSoundPlayer()
    {
	super(37, "SoundPlayer");
	sounds = new HashMap<>();

	defaultPath = getCurrentPath();

	if (defaultPath != null)
	{
	    defaultPath = defaultPath.concat("/sounds/");
	}
    }

    private String getCurrentPath()
    {
	try
	{
	    String path = SyscallBitmapCache.class.getProtectionDomain().getCodeSource().getLocation().getPath();

	    String decodedPath = URLDecoder.decode(path, "UTF-8");

	    String OS = System.getProperty("os.name").toLowerCase();

	    int initialSubstring = OS.contains("win") ? 1 : 0;

	    decodedPath = decodedPath.substring(initialSubstring, decodedPath.lastIndexOf("/"));

	    return decodedPath;
	}
	catch (UnsupportedEncodingException e)
	{
	    System.err.println("Exceptione is = " + e.getMessage());
	}

	return null;
    }

    public synchronized Clip playSound(String url, int loop, int volumeDecibelsFactor)
    {
	try
	{
	    Clip clip;
	    AudioInputStream inputStream = AudioSystem.getAudioInputStream(new File(url));
	    DataLine.Info info = new DataLine.Info(Clip.class, inputStream.getFormat());

	    clip = (Clip) AudioSystem.getLine(info);

	    clip.open(inputStream);

	    if (volumeDecibelsFactor != 0)
	    {
		FloatControl gainControl = (FloatControl) clip.getControl(FloatControl.Type.MASTER_GAIN);
		gainControl.setValue(Float.valueOf(volumeDecibelsFactor));
	    }

	    if (loop != 0)
	    {
		clip.loop(Clip.LOOP_CONTINUOUSLY);
	    }
	    else
	    {
		clip.start();
	    }

	    return clip;
	}
	catch (Exception e)
	{
	    System.err.println(e.getMessage());
	}

	return null;
    }

    public static void stopAllSounds()
    {
	Iterator it = sounds.entrySet().iterator();
	while (it.hasNext())
	{
	    Map.Entry pair = (Map.Entry) it.next();
	    Clip clip = (Clip) pair.getValue();
	    clip.stop();
	    it.remove();
	}
    }

    @Override
    public void simulate(ProgramStatement statement) throws ProcessingException
    {
	int a0 = RegisterFile.getValue(4);
	int a1 = RegisterFile.getValue(5);
	int a2 = RegisterFile.getValue(6);
	int a3 = RegisterFile.getValue(7);

	switch (a1)
	{
	    case PLAY:
	    {
		Properties prop = new Properties();

		try
		{
		    prop.load(new FileInputStream(defaultPath.concat("sounds.data")));

		}
		catch (FileNotFoundException ex)
		{
		    RegisterFile.updateRegister(2, -1);
		    return;
		}
		catch (IOException ex)
		{
		    RegisterFile.updateRegister(2, -1);
		    return;
		}

		String fileSoundName = prop.getProperty(String.valueOf(a0));

		if (fileSoundName != null)
		{
		    Clip audio = playSound(defaultPath.concat(fileSoundName), a2, a3);

		    if (audio != null)
		    {
			sounds.put(a0, audio);
		    }
		}

		break;
	    }
	    case STOP:
	    {
		Clip sound = sounds.get(a0);

		if (sound != null)
		{
		    sound.stop();
		}

		break;
	    }
	    case STOP_ALL:
	    {
		stopAllSounds();
	    }
	}
    }
}
