using Gtk;
using WebKit;
using Granite.Widgets;

public class PaperWindow : Window
{
    private ThinPaned pane;
    private SourceView editor;
    private WebView preview;

    private static const int DEFAULT_WIDTH = 800;
    private static const int DEFAULT_HEIGHT = 600;

    public PaperWindow()
    {
        title = "Paper";
        window_position = WindowPosition.CENTER;
        set_default_size(DEFAULT_WIDTH, DEFAULT_HEIGHT);
        editor = init_editor();
        preview = init_preview();
        pane = init_pane(editor, preview);
        
        var box = new Box(Gtk.Orientation.VERTICAL, 0);
        box.pack_start(pane, true, true, 0);
        
        add(box);
    }
    
    private SourceView init_editor()
    {
        return new SourceView();
    }
    
    private WebView init_preview()
    {
        return new WebView();
    }
    
    private ThinPaned init_pane(SourceView editor, WebView preview)
    {
        var pane = new ThinPaned();
        pane.set_position(DEFAULT_WIDTH / 2);
        
        var scr_editor = new ScrolledWindow(null, null);
        scr_editor.add(editor);        
        pane.add(scr_editor);
        
        var scr_preview = new ScrolledWindow(null, null);
        scr_preview.add(preview);        
        pane.add(scr_preview);
        
        return pane;
    }
}
