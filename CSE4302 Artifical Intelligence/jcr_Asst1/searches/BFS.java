package searches;
import java.util.ArrayDeque;
import java.util.Queue;
import java.util.LinkedList;

public class BFS<T>
{

	public Tree<T> search(T value, Tree<T> root)
	{

		Queue<Tree<T>> queue = new LinkedList<>();
		queue.add(root);


		while( !queue.isEmpty() )
		{
			Tree<T> current = queue.poll();
			
			if(!current.isVisited())
			{
				current.setVisited(true);
				if( current.getValue() == value )
				{
					System.out.println("Finished searching!");
					return current;
				}
				else
				{
					queue.addAll(current.getChildren());
				}
			}
		}


/*
		Queue<Tree<V>> queue = new ArrayDeque<>();
		queue.add(root);

		while( !queue.isEmpty() )
		{
			System.out.print("Current queue: ");
			for(Tree<V> item: queue)
			{
//				System.out.print(item.getValue()+ " ");
			}
		}
		System.out.println();

		Tree<V> currentNode = queue.remove();

		if( currentNode.getValue() == value )
		{
			System.out.println("Finished searching!");
			return currentNode;
		}
		else
		{
			queue.addAll( currentNode.getChildren() );
		}*/

		return null;
	}
}