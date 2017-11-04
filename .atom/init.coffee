# Your init script
#
# Atom will evaluate this file each time a new window is opened. It is run
# after packages are loaded/activated and after the previous editor state
# has been restored.
#
# An example hack to log to the console when each text editor is saved.
#
# atom.workspace.observeTextEditors (editor) ->
#   editor.onDidSave ->
#     console.log "Saved! #{editor.getPath()}"
atom.commands.add '.platform-darwin', 'custom:toggle-ftp', ->
  editor = atom.workspace.getActiveTextEditor()
  if not editor
    editor = atom.workspace.getActivePane()
  status = atom.project.remoteftp.root.status
  if not status
    command = "remote-ftp:connect"
  else
    command = "remote-ftp:disconnect"
  atom.commands.dispatch(atom.views.getView(editor), command)

atom.commands.add 'atom-text-editor', 'custom:toggle-fold', ->
  editor = atom.workspace.getActiveTextEditor()
  if editor && editor.isFoldedAtCursorRow()
    editor.unfoldCurrentRow();
  else
    editor.foldCurrentRow();

atom.commands.add '.platform-darwin', 'custom:toggle-outline-view', ->
  editor = atom.workspace.getActiveTextEditor()
  if atom.workspace.isTextEditor(editor)
    atom.commands.dispatch(atom.views.getView(editor), "minimap:toggle")
    atom.commands.dispatch(atom.views.getView(editor), "outline-view:toggle")
