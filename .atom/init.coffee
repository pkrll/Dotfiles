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

_disable = (packageName) ->
  if atom.packages.isPackageActive(packageName)
    atom.packages.disablePackage(packageName)

_enable = (packageName) ->
  if atom.packages.isPackageActive(packageName) == false
    atom.packages.enablePackage(packageName)

_tryForPackage = (editor, fileExtension, packageName) ->
  if editor.buffer.file.path.endsWith(fileExtension)
    _enable(packageName)
    return true
  else
    _disable(packageName)
    return false


atom.workspace.onDidStopChangingActivePaneItem (item) ->
  if atom.workspace.isTextEditor(item)
    _tryForPackage(item, ".tex", "latex")
