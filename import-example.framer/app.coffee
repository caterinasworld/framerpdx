# Import file "Trapit Framer Experiment"
$ = Framer.Importer.load("imported/Trapit Framer Experiment@1x", scale: 1)

# show first artboard
flow = new FlowComponent
flow.showNext($.screenLoading, animate: true)

$.screenLoading.onTap ->
	flow.showNext($.screenHome)

flow.header = $.screenHome.header
flow.footer = $.screenHome.tabBar

$.buttonBack.onTap ->
	flow.showPrevious()