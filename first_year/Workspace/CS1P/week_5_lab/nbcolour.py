from IPython.display import display, HTML
## NOTE: You don't need to know how this works -- 
## assume it's magic if you're not interested!

def set_colour(r,g,b):
    """Take three integers r (red) g (green) and b (blue),
    between 0 and 255. Change the background colour of the notebook
    to the given colour"""
    # create a hex colour
    hex_color = "#%02X%02X%02X" % (r,g,b)
    # tell javascript to change the relevant DOM element
    javascript = """<script type="text/Javascript">    
        var dom_site = document.getElementById('site'); 
        dom_site.style.backgroundColor = '%s';           
        </script>""" % hex_color
    display(HTML(javascript))