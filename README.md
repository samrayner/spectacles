GitHub Spectacles
=================

A bookmarklet to position specs alongside implementation files in GitHub pull requests for easier review.

To use it, create a bookmark with this as the URL:
```
javascript:!function(){var%20e,t,i=function(e,t){return%20function(){return%20e.apply(t,arguments)}};e=function(){function%20e(){this.stylePairWrappers=i(this.stylePairWrappers,this),this.sorter=i(this.sorter,this);var%20e,t,r,s,a,n,l;for(this.pairClass=%22spectacles-pair%22,e=$(%22%23files%22),r=e.find(%22.file%22).sort(this.sorter),e.empty(),n=0,l=r.length;l%3En;n++)s=r[n],t=$(s),this.deletedFile(s)%26%26this.hideDeletedFile(s),e.append(s),a=t.prev(),a.length%26%26this.filePair(a,s)%26%26this.wrapPair(a,s);this.stylePairFiles(),this.stylePairWrappers(),$(window).resize(this.stylePairWrappers)}return%20e.prototype.deletedFile=function(e){var%20t;return%20t=$(e),t.find(%22.diff-deleted%22).length||t.find(%22.file-diff-line%22).text().indexOf(%22+0,0%20%40%40%22)%3E0},e.prototype.hideDeletedFile=function(e){var%20t,i;return%20i=$(e),t=i.find(%22.data%22).add(i.find(%22.image%22)),t.removeClass(%22image%22).addClass(%22data%20empty%22).css(%22background-color%22,%22%23fdd%22).html(%22File%20deleted.%22)},e.prototype.sorter=function(e,t){return%20e=this.filePath(e),t=this.filePath(t),t%3Ee%3F-1:e%3Et%3F1:0},e.prototype.filePath=function(e){var%20t,i;return%20i=$(e).find(%22.meta%22).data(%22path%22).toLowerCase(),t=i.split(/[\\/]/),t[t.length-2]+%22/%22+t[t.length-1]},e.prototype.filePair=function(e,t){return%20e=this.filePath(e).replace(%22_spec%22,%22%22),t=this.filePath(t).replace(%22_spec%22,%22%22),e===t},e.prototype.wrapPair=function(e,t){var%20i;return%20i=$('%3Cdiv%20class=%22'+this.pairClass+'%22%20/%3E'),$(e).before(i),i.append($(e),$(t))},e.prototype.stylePairFiles=function(){return%20$(%22.%22+this.pairClass+%22%20.file%22).css({width:%2249%25%22,%22float%22:%22left%22,margin:%220%200.5%25%22}).find(%22.data%22).css({maxHeight:%22500px%22,overflow:%22auto%22})},e.prototype.stylePairWrappers=function(){var%20e;return%20e=$(%22.site%20.container%22).offset().left,$(%22.%22+this.pairClass).css({margin:%220%20-%22+(e+60)+%22px%2015px%20-%22+e+%22px%22,overflow:%22hidden%22})},e}(),t=new%20e}();
```
