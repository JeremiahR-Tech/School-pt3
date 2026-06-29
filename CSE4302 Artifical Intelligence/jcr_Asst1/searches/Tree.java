package searches;
import java.util.ArrayList;
import java.util.List;

public class Tree<T>
{
	private T value;
	private List< Tree<T> > children;
	private boolean visited;
	private String method;

	public Tree(T value)
	{
		this.value = value;
		this.children = new ArrayList<>();
	}

	public T getValue() {	return this.value; }

	public List<Tree<T>> getChildren() { return this.children; }

	public boolean isVisited() { return visited; }

	public boolean setVisited(boolean info) { return info; }

	public Tree<T> addChild(T value)
	{
		Tree<T> newChild = new Tree<T>(value);
		children.add(newChild);
		return newChild;
	}

	public static String checkMethod(String method)
	{
		method = method.trim().toUpperCase();
		if(method.equals("BFS"))
		{
			 return method;
		}
		else if(method.equals("UCS"))
		{
			 return method;
		}
		else if(method.equals("DFS"))
		{
			 return method;
		}
		else
		{
			method = null;
			return method;
		}

	}
}