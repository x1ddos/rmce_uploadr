/*
 * rmce_uploadr app main javascript
 *
 * should be loaded after tiny_mce.js and jquery.js
 */

// when DOM is loaded
$(function(){
  // we're looking mainly for images that have data-src-original attribute set
  $("[data-src-original]").click(function(){
    var editor = tinyMCEPopup.editor;

    // Fixes crash in Safari
    if (tinymce.isWebKit) { editor.getWin().focus(); }
    
    // TODO: add widht, height and other stuff
    var imgParams = {
      src: uploadrCdnHost + $(this).attr('data-src-original')
    };
    
    // get original selection, an image already inserted in the editor's main area
    var original = editor.selection.getNode();
    
    // check if that's really an image and replace it with the new one
    if (original && original.nodeName == 'IMG') {
			editor.dom.setAttribs(original, imgParams);
			
		// otherwise just insert a new image
		} else {
			editor.execCommand('mceInsertContent', false, '<img id="__mce_tmp" />', {skip_undo : 1});
			editor.dom.setAttribs('__mce_tmp', imgParams);
			editor.dom.setAttrib('__mce_tmp', 'id', '');
			editor.undoManager.add();
		}
			
		// close ourselves, i.e. the popup
    tinyMCEPopup.close();
  });
});
