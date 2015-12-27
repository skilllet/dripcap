$ = require('jquery')

QUnit.test "show session-dialog", (assert) ->
  dripcap.package.load('session-dialog').then (pkg) ->
    dripcap.action.emit 'core:new-session'
    wait assert, -> $('[riot-tag=session-dialog] .modal').is(':visible')

QUnit.test "start session", (assert) ->
  dripcap.package.load('session-dialog').then (pkg) ->
    $('[riot-tag=session-dialog] [name=start]')[0].click()
    wait assert, -> !$('[riot-tag=session-dialog] .modal').is(':visible')

QUnit.test "list captured packets", (assert) ->
  dripcap.package.load('packet-list-view').then (pkg) ->
    wait assert, -> $('[riot-tag=packet-list-view] tr:not(.head)').length == 100
