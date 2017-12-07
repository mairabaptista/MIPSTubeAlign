package mars.mips.instructions.syscalls;

import mars.ProcessingException;
import mars.ProgramStatement;
import static mars.tools.BitmapDisplay.Grid.aux;
import static mars.tools.BitmapDisplay.Grid.columns;
import static mars.tools.BitmapDisplay.Grid.grid;
import static mars.tools.BitmapDisplay.Grid.rows;

public class SyscallRefreshBitmap extends AbstractSyscall
{    
    public SyscallRefreshBitmap()
    {
	super(39, "RefreshBitmap");
    }

    @Override
    public void simulate(ProgramStatement statement) throws ProcessingException
    {
	for (int i = 0; i < rows; i++)
	{
	    System.arraycopy(aux[i], 0, grid[i], 0, columns);
	}
    }
}
