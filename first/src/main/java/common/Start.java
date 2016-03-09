package common;
import org.eclipse.jetty.server.Server;
import org.eclipse.jetty.util.resource.Resource;
import org.eclipse.jetty.webapp.WebAppContext;

public class Start {

	public static void main(String[] args) throws Exception {
		Server server = new Server(8888);
		WebAppContext handler = new WebAppContext();
		handler.setContextPath("/");
		handler.setBaseResource(Resource.newClassPathResource("/webapp"));
		handler.setMaxFormContentSize(Integer.MAX_VALUE);
		handler.setDefaultsDescriptor("/webdefault.xml");
		server.setHandler(handler);
		server.start();
		server.join();
	}

}