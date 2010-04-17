/**
 * editor_plugin_src.js
 *
 * Copyright 2010, Cloudware.it
 * Released under LGPL License.
 *
 */

(function() {
	tinymce.create('tinymce.plugins.RMceUploadrPlugin', {
		init : function(ed, url) {
			// Register commands
			ed.addCommand('rmceUploadr', function() {
				// Internal image object like a flash placeholder
				if (ed.dom.getAttrib(ed.selection.getNode(), 'class').indexOf('mceItem') != -1)
					return;

				ed.windowManager.open({
					//file : url + '/rmce_uploadr.html',
					file: '/rmce_uploadr/images',
					width : 480,
					height : 385,
					inline : 1
				}, {
					plugin_url : url
				});
			});
      
			// Register buttons
			ed.addButton('image', {
				title : 'Insert an Image',
				image : '/images/rmce_uploadr_icon.png',
				cmd : 'rmceUploadr'
			});
		},

		getInfo : function() {
			return {
				longname : 'RMce ',
				author : 'Cloudware.it',
				authorurl : 'http://cloudware.it',
				infourl : 'http://cloudware.it/pages/contrib#rmce_uploadr',
				version : tinymce.majorVersion + "." + tinymce.minorVersion
			};
		}
	});

	// Register plugin
	tinymce.PluginManager.add('rmce_uploadr', tinymce.plugins.RMceUploadrPlugin);
})();