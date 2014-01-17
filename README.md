GitHub Spectacles
=================

A bookmarklet to position specs alongside implementation files in GitHub pull requests for easier review.

To use it, create a bookmark with this as the URL:
```
javascript:(function(){var Spectacles,spectacles,__bind=function(e,t){return function(){return e.apply(t,arguments)}};Spectacles=function(){function e(){this.stylePairWrappers=__bind(this.stylePairWrappers,this);this.sorter=__bind(this.sorter,this);var e,t,n,r,i,s;this.pairClass="spectacles-pair";e=$("#files");t=e.find(".file").sort(this.sorter);e.empty();for(i=0,s=t.length;i<s;i++){n=t[i];e.append(n);r=$(n).prev();r.length&&this.filePair(n,r)&&this.wrapPair(n,r)}this.stylePairFiles();this.stylePairWrappers();$(window).resize(this.stylePairWrappers)}e.prototype.sorter=function(e,t){e=this.filename(e);t=this.filename(t);return e<t?-1:e>t?1:0};e.prototype.filename=function(e){return this.basename($(e).find(".meta").data("path").toLowerCase())};e.prototype.basename=function(e){return e.split(/[\\/]/).pop()};e.prototype.filePair=function(e,t){e=this.filename(e).replace("_spec","");t=this.filename(t).replace("_spec","");return e===t};e.prototype.wrapPair=function(e,t){return $(e).add($(t)).wrapAll('<div class="'+this.pairClass+'" />')};e.prototype.stylePairFiles=function(){return $("."+this.pairClass+" .file").css({width:"49%","float":"left",margin:"0 0.5%"}).find(".data").css({maxHeight:"500px",overflow:"auto"})};e.prototype.stylePairWrappers=function(){var e;e=$(".site .container").offset().left;return $("."+this.pairClass).css({margin:"0 -"+(e+60)+"px 15px -"+e+"px",overflow:"hidden"})};return e}();spectacles=new Spectacles;})();
```
