# Create a bookmark with this as the URL:
# javascript:(function(){var Spectacles,spectacles,__bind=function(e,t){return function(){return e.apply(t,arguments)}};Spectacles=function(){function e(){this.stylePairWrappers=__bind(this.stylePairWrappers,this);this.sorter=__bind(this.sorter,this);var e,t,n,r,i,s,o;this.pairClass="spectacles-pair";e=$("#files");n=e.find(".file").sort(this.sorter);e.empty();for(s=0,o=n.length;s<o;s++){r=n[s];t=$(r);this.deletedFile(r)&&this.hideDeletedFile(r);e.append(r);i=t.prev();i.length&&this.filePair(i,r)&&this.wrapPair(i,r)}this.stylePairFiles();this.stylePairWrappers();$(window).resize(this.stylePairWrappers)}e.prototype.deletedFile=function(e){var t;t=$(e);return t.find(".diff-deleted").length||t.find(".gc").text().indexOf("+0,0 @@")>0};e.prototype.hideDeletedFile=function(e){var t,n;n=$(e);t=n.find(".data").add(n.find(".image"));return t.removeClass("image").addClass("data empty").css("background-color","#fdd").html("File deleted.")};e.prototype.sorter=function(e,t){e=this.filePath(e);t=this.filePath(t);return e<t?-1:e>t?1:0};e.prototype.filePath=function(e){var t,n;n=$(e).find(".meta").data("path").toLowerCase();t=n.split(/[\\/]/);return t[t.length-2]+"/"+t[t.length-1]};e.prototype.filePair=function(e,t){e=this.filePath(e).replace("_spec","");t=this.filePath(t).replace("_spec","");return e===t};e.prototype.wrapPair=function(e,t){var n;n=$('<div class="'+this.pairClass+'" />');$(e).before(n);return n.append($(e),$(t))};e.prototype.stylePairFiles=function(){return $("."+this.pairClass+" .file").css({width:"49%","float":"left",margin:"0 0.5%"}).find(".data").css({maxHeight:"500px",overflow:"auto"})};e.prototype.stylePairWrappers=function(){var e;e=$(".site .container").offset().left;return $("."+this.pairClass).css({margin:"0 -"+(e+60)+"px 15px -"+e+"px",overflow:"hidden"})};return e}();spectacles=new Spectacles;})();

class Spectacles
  constructor: ->
    @pairClass = "spectacles-pair"

    $container = $("#files")
    $files = $container.find(".file").sort(@sorter)
    $container.empty()

    for file in $files
      $file = $(file)
      @hideDeletedFile(file) if @deletedFile(file)
      $container.append(file)
      prev = $file.prev()
      @wrapPair(prev, file) if prev.length && @filePair(prev, file)

    @stylePairFiles()
    @stylePairWrappers()
    $(window).resize(@stylePairWrappers)

  deletedFile: (file) ->
    $file = $(file)
    $file.find(".diff-deleted").length || $file.find(".gc").text().indexOf("+0,0 @@") > 0

  hideDeletedFile: (file) ->
    $file = $(file)
    $contents = $file.find(".data").add($file.find(".image"))
    $contents
      .removeClass("image")
      .addClass("data empty")
      .css("background-color", "#fdd")
      .html("File deleted.")

  sorter: (a, b) =>
    a = @filePath(a)
    b = @filePath(b)
    return -1 if (a < b)
    return 1  if (a > b)
    return 0

  filePath: (elm) ->
    path = $(elm).find(".meta").data("path").toLowerCase()
    parts = path.split(/[\\/]/)
    parts[parts.length-2]+"/"+parts[parts.length-1]

  filePair: (a, b) ->
    a = @filePath(a).replace("_spec", "")
    b = @filePath(b).replace("_spec", "")
    a == b

  wrapPair: (a, b) ->
    $wrapper = $('<div class="'+@pairClass+'" />')
    $(a).before($wrapper)
    $wrapper.append($(a), $(b))

  stylePairFiles: ->
    $("."+@pairClass+" .file").css({
      width: "49%",
      float: "left",
      margin: "0 0.5%"
    }).find(".data").css({
      maxHeight: "500px",
      overflow: "auto"
    })

  stylePairWrappers: =>
    leftMargin = $(".site .container").offset().left
    $("."+@pairClass).css({
      margin: "0 -"+(leftMargin+60)+"px 15px -"+leftMargin+"px",
      overflow: "hidden"
    })

spectacles = new Spectacles()
