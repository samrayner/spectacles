# Create a bookmark with this as the URL:
# javascript:!function(){var%20t,e,r=function(t,e){return%20function(){return%20t.apply(e,arguments)}};t=function(){function%20t(){this.stylePairWrappers=r(this.stylePairWrappers,this),this.sorter=r(this.sorter,this);var%20t,e,i,s,a,n,l;for(this.pairClass=%22spectacles-pair%22,t=$(%22%23files%22),i=t.find(%22.file%22).sort(this.sorter),t.empty(),n=0,l=i.length;l%3En;n++)s=i[n],e=$(s),this.deletedFile(s)%26%26this.hideDeletedFile(s),t.append(s),a=e.prev(),a.length%26%26this.filePair(a,s)%26%26this.wrapPair(a,s);this.stylePairFiles(),this.stylePairWrappers(),$(window).resize(this.stylePairWrappers)}return%20t.prototype.deletedFile=function(t){var%20e;return%20e=$(t),e.find(%22.diff-deleted%22).length||e.find(%22.blob-code-hunk%22).text().indexOf(%22+0,0%20%40%40%22)%3E0},t.prototype.hideDeletedFile=function(t){var%20e,r;return%20r=$(t),e=r.find(%22.data%22),e.addClass(%22data%20empty%22).css(%22background-color%22,%22%23fdd%22).html(%22Deleted%20file%20not%20rendered%22)},t.prototype.sorter=function(t,e){return%20t=this.filePath(t),e=this.filePath(e),e%3Et%3F-1:t%3Ee%3F1:0},t.prototype.filePath=function(t){var%20e,r;return%20r=$(t).find(%22.meta%22).data(%22path%22).toLowerCase(),e=r.split(/[\\/]/),e[e.length-2]+%22/%22+e[e.length-1]},t.prototype.filePair=function(t,e){return%20t=this.filePath(t).replace(%22_spec%22,%22%22),e=this.filePath(e).replace(%22_spec%22,%22%22),t===e},t.prototype.wrapPair=function(t,e){var%20r;return%20r=$('%3Cdiv%20class=%22'+this.pairClass+'%22%20/%3E'),$(t).before(r),r.append($(t),$(e))},t.prototype.stylePairFiles=function(){return%20$(%22.%22+this.pairClass+%22%20.file%22).css({width:%2249%25%22,%22float%22:%22left%22,margin:%220%200.5%25%22}).find(%22.data%22).css({maxHeight:%22500px%22,overflow:%22auto%22})},t.prototype.stylePairWrappers=function(){var%20t;return%20t=$(%22.site%20.container%22).offset().left,$(%22.%22+this.pairClass).css({margin:%220%20-%22+(t+60)+%22px%2015px%20-%22+t+%22px%22,overflow:%22hidden%22})},t}(),e=new%20t}();

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
    $file.find(".diff-deleted").length || $file.find(".blob-code-hunk").text().indexOf("+0,0 @@") > 0

  hideDeletedFile: (file) ->
    $file = $(file)
    $contents = $file.find(".data")
    $contents
      .addClass("data empty")
      .css("background-color", "#fdd")
      .html("Deleted file not rendered")

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
