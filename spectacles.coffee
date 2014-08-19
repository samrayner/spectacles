# Create a bookmark with this as the URL:
# javascript:!function(){var%20e,t,i=function(e,t){return%20function(){return%20e.apply(t,arguments)}};e=function(){function%20e(){this.stylePairWrappers=i(this.stylePairWrappers,this),this.sorter=i(this.sorter,this);var%20e,t,r,s,a,n,l;for(this.pairClass=%22spectacles-pair%22,e=$(%22%23files%22),r=e.find(%22.file%22).sort(this.sorter),e.empty(),n=0,l=r.length;l%3En;n++)s=r[n],t=$(s),this.deletedFile(s)%26%26this.hideDeletedFile(s),e.append(s),a=t.prev(),a.length%26%26this.filePair(a,s)%26%26this.wrapPair(a,s);this.stylePairFiles(),this.stylePairWrappers(),$(window).resize(this.stylePairWrappers)}return%20e.prototype.deletedFile=function(e){var%20t;return%20t=$(e),t.find(%22.diff-deleted%22).length||t.find(%22.file-diff-line%22).text().indexOf(%22+0,0%20%40%40%22)%3E0},e.prototype.hideDeletedFile=function(e){var%20t,i;return%20i=$(e),t=i.find(%22.data%22).add(i.find(%22.image%22)),t.removeClass(%22image%22).addClass(%22data%20empty%22).css(%22background-color%22,%22%23fdd%22).html(%22File%20deleted.%22)},e.prototype.sorter=function(e,t){return%20e=this.filePath(e),t=this.filePath(t),t%3Ee%3F-1:e%3Et%3F1:0},e.prototype.filePath=function(e){var%20t,i;return%20i=$(e).find(%22.meta%22).data(%22path%22).toLowerCase(),t=i.split(/[\\/]/),t[t.length-2]+%22/%22+t[t.length-1]},e.prototype.filePair=function(e,t){return%20e=this.filePath(e).replace(%22_spec%22,%22%22),t=this.filePath(t).replace(%22_spec%22,%22%22),e===t},e.prototype.wrapPair=function(e,t){var%20i;return%20i=$('%3Cdiv%20class=%22'+this.pairClass+'%22%20/%3E'),$(e).before(i),i.append($(e),$(t))},e.prototype.stylePairFiles=function(){return%20$(%22.%22+this.pairClass+%22%20.file%22).css({width:%2249%25%22,%22float%22:%22left%22,margin:%220%200.5%25%22}).find(%22.data%22).css({maxHeight:%22500px%22,overflow:%22auto%22})},e.prototype.stylePairWrappers=function(){var%20e;return%20e=$(%22.site%20.container%22).offset().left,$(%22.%22+this.pairClass).css({margin:%220%20-%22+(e+60)+%22px%2015px%20-%22+e+%22px%22,overflow:%22hidden%22})},e}(),t=new%20e}();

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
    $file.find(".diff-deleted").length || $file.find(".file-diff-line").text().indexOf("+0,0 @@") > 0

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
