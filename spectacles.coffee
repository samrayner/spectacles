# Create a bookmark with this as the URL:
# javascript:(function(){var Spectacles,spectacles,__bind=function(e,t){return function(){return e.apply(t,arguments)}};Spectacles=function(){function e(){this.stylePairWrappers=__bind(this.stylePairWrappers,this);this.sorter=__bind(this.sorter,this);var e,t,n,r,i,s;this.pairClass="spectacles-pair";e=$("#files");t=e.find(".file").sort(this.sorter);e.empty();for(i=0,s=t.length;i<s;i++){n=t[i];e.append(n);r=$(n).prev();r.length&&this.filePair(n,r)&&this.wrapPair(n,r)}this.stylePairFiles();this.stylePairWrappers();$(window).resize(this.stylePairWrappers)}e.prototype.sorter=function(e,t){e=this.filePath(e);t=this.filePath(t);return e<t?-1:e>t?1:0};e.prototype.filePath=function(e){var t,n;n=$(e).find(".meta").data("path").toLowerCase();t=n.split(/[\\/]/);return t[t.length-2]+"/"+t[t.length-1]};e.prototype.filePair=function(e,t){e=this.filePath(e).replace("_spec","");t=this.filePath(t).replace("_spec","");return e===t};e.prototype.wrapPair=function(e,t){return $(e).add($(t)).wrapAll('<div class="'+this.pairClass+'" />')};e.prototype.stylePairFiles=function(){return $("."+this.pairClass+" .file").css({width:"49%","float":"left",margin:"0 0.5%"}).find(".data").css({maxHeight:"500px",overflow:"auto"})};e.prototype.stylePairWrappers=function(){var e;e=$(".site .container").offset().left;return $("."+this.pairClass).css({margin:"0 -"+(e+60)+"px 15px -"+e+"px",overflow:"hidden"})};return e}();spectacles=new Spectacles;})();

class Spectacles
  constructor: ->
    @pairClass = "spectacles-pair"

    $container = $("#files")
    $files = $container.find(".file").sort(@sorter)
    $container.empty()

    for file in $files
      $container.append(file)
      prev = $(file).prev()
      @wrapPair(file, prev) if prev.length && @filePair(file, prev)

    @stylePairFiles()
    @stylePairWrappers()
    $(window).resize(@stylePairWrappers)

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
    $(a).add($(b)).wrapAll('<div class="'+@pairClass+'" />')

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
