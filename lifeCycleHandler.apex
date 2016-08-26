public class LifeCycleHandler implements Canvas.CanvasLifecycleHandler {

public Set<Canvas.ContextTypeEnum> excludeContextTypes(){
    Set<Canvas.ContextTypeEnum> excluded = new Set<Canvas.ContextTypeEnum>();
    return excluded;
}

public void onRender(Canvas.RenderContext renderContext) {

    //Get the Application and Environment context from the RenderContext
    Canvas.ApplicationContext app = renderContext.getApplicationContext();
    Canvas.EnvironmentContext env = renderContext.getEnvironmentContext();
    URL url = new URL(app.getCanvasUrl());
    String location = env.getLocationUrl();
    Map<String, String> myMap = new Map<String,String>();
    String query = location.substringAfter('?');
    for (String entry : query.split('&')) {
        String[] split = entry.split('=');
        if (split != null && split.size() == 2) {
          myMap.put(split.get(0), split.get(1));
        }
    }
    String key = 'key';
    String value = myMap.get(key);
    if (value == null) { 
        value = 'nothing'; 
    }
    String loc = EncodingUtil.urlEncode(location, 'UTF-8');
    String v = EncodingUtil.urlEncode(value, 'UTF-8');
    
    app.setCanvasUrlPath('/examples/hello-world/other.jsp' + '?key=' + v + '&loc=' + loc);
    }
 }
