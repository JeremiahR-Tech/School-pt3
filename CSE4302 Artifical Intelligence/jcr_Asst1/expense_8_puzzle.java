import searches.*;
import java.io.*;
import java.util.Scanner;

public class expense_8_puzzle
{
	public static void main(String[] args)
	{

		// First part of the code is command line and error catching
		int min_cmdArgs = 3;
		int max_cmdArgs = 4;
		int args_length = args.length;


		if( (args_length >= min_cmdArgs) && (args_length <= max_cmdArgs) )
		{
			// Organize the command arguments from <start-file> to <dump-flag>
			// <start-File>
			try
			{
				File start_file = new File(args[0]);
				Scanner sc = new Scanner(start_file);
				System.out.println("[DEBUG] checking <start-file>...");
			    while (sc.hasNextLine())
			    {
			      System.out.println(sc.nextLine());
			    }

			} catch(Exception e)
			{
				System.out.println("[ERROR]"+e);
				System.exit(-1);
			}

			// <goal-file>
			try
			{
				File goal_file = new File(args[1]);
				Scanner sc = new Scanner(goal_file);
				System.out.println("[DEBUG] checking <goal-file>...");
			    while (sc.hasNextLine())
			    {
			      System.out.println(sc.nextLine());
			    }

			} catch(Exception e)
			{
				System.out.println("[ERROR]"+e);
				System.exit(-1);
			}

			// <method>
			String method = args[2];

			// <dump-flag>
			String dump_flag = null;
			if(args_length == 4)
			{
				 dump_flag = args[3];
			}

			System.out.println("Command-Line Arguments : ["+
															args[0]+
														", "+args[1]+
														", "+args[2]+
														", "+dump_flag+"]");

			// Intended for dump-file = true
			method = Tree.checkMethod(method);
			if(method != null)
			{
				System.out.println("Method Selected: "+method);
				System.out.println("Running "+method);
			}
			else
			{
				System.out.println("[ERROR] Invalid Method...only BFS, UCS, DFS");
			}
			System.out.println();

			// ---------------------------------------------------


			// ---------------------------------------------------

			// [TEST] Figuring out pseduo-code to search trees in Java
			// This contain everything about searches
			BFS<Integer> intBFS = new BFS<Integer>();

			Tree<Integer> root = new Tree<Integer>(10);
			//System.out.println("root: "+root.getValue().intValue());
			System.out.println( "[Before making tree] root(class): " + root.getClass().getSimpleName() );
			Tree<Integer> newChild = root.addChild(5);
			root.addChild(7);
			root.addChild(15);
			Tree<Integer> newChildChild = newChild.addChild(115);
			Tree<Integer> newChildChildChild = newChildChild.addChild(207);

			Integer searchNode = Integer.valueOf(207);
			System.out.println( "[AFTER making tree] root(class): " + root.getClass().getSimpleName() );

			Tree<Integer> foundNode = intBFS.search( searchNode, root );

			if(foundNode != null)
			{
				System.out.println( foundNode.getValue() );
			}
			else
			{
				System.out.println("Found nothing!");
			} 
		}
		else
		{
			System.out.println("[ERROR] Format: java expense_8_puzzle.java <start-file>"+
				" <goal-file> <method> <dump-flag>");

		}
	}
}