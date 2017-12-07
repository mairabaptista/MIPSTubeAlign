package mars.mips.instructions.syscalls;

import java.awt.Color;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Properties;
import javax.swing.JOptionPane;
import mars.ProcessingException;
import mars.ProgramStatement;
import mars.mips.hardware.RegisterFile;
import static mars.tools.BitmapDisplay.Grid.aux;
import static mars.tools.BitmapDisplay.Grid.columns;
import static mars.tools.BitmapDisplay.Grid.grid;
import static mars.tools.BitmapDisplay.Grid.rows;
import static mars.tools.BitmapDisplay.canvas;

public class SyscallBitmapCache extends AbstractSyscall
{
    private final int GET_BITMAP_CACHE = 0;
    private final int SET_BITMAP_CACHE = 1;

    private String defaultPath;

    public SyscallBitmapCache()
    {
	super(38, "BitmapCache");
	
	defaultPath = getCurrentPath();

	if (defaultPath != null)
	{
	    defaultPath = defaultPath.concat("/cache/");
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

    private void saveCache(int cacheId) throws IOException
    {
	Properties prop = new Properties();
	int counter = 0;

	for (int i = 0; i < rows; i++)
	{
	    for (int j = 0; j < columns; j++)
	    {
		prop.setProperty(String.valueOf(counter++), String.valueOf(grid[i][j].getRGB()));
	    }
	}

	String bitmapCacheName = String.valueOf(cacheId).concat(".bitmapCache");

	prop.store(new FileOutputStream(defaultPath.concat(bitmapCacheName)), null);
    }

    private void loadCache(int cacheId) throws IOException
    {
	Properties prop = new Properties();

	try
	{
	    String bitmapCacheName = String.valueOf(cacheId).concat(".bitmapCache");

	    prop.load(new FileInputStream(defaultPath.concat(bitmapCacheName)));
	}
	catch (FileNotFoundException ex)
	{
	    RegisterFile.updateRegister(2, -1);
	    return;
	}

	int counter = 0;

	for (int i = 0; i < rows; i++)
	{
	    for (int j = 0; j < columns; j++)
	    {
		grid[i][j] = new Color(Integer.valueOf(prop.getProperty(String.valueOf(counter++))));
	    }
	}

	canvas.repaint();

	for (int i = 0; i < rows; i++)
	{
	    System.arraycopy(grid[i], 0, aux[i], 0, columns);
	}

	RegisterFile.updateRegister(2, 0);
    }

    @Override
    public void simulate(ProgramStatement statement) throws ProcessingException
    {
	switch (RegisterFile.getValue(4))
	{
	    case SET_BITMAP_CACHE:
	    {
		try
		{
		    saveCache(RegisterFile.getValue(5));
		}
		catch (IOException ex)
		{
		    System.err.println("Error!");
		    break;
		}
		break;
	    }
	    case GET_BITMAP_CACHE:
	    {
		try
		{
		    loadCache(RegisterFile.getValue(5));
		}
		catch (IOException ex)
		{
		    System.err.println("Error!");
		}
	    }
	}
    }

}
