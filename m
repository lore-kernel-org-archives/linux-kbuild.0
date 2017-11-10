Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.cn.fujitsu.com ([183.91.158.132]:59658 "EHLO
        heian.cn.fujitsu.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1750756AbdKJHfR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 10 Nov 2017 02:35:17 -0500
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Subject: [PATCH RFC] kbuild: fixes in Makefile.lib
Date: Fri, 10 Nov 2017 15:35:04 +0800
Message-ID: <20171110073504.13836-1-caoj.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: yamada.masahiro@socionext.com, michal.lkml@markovi.net

commit

  cf4f21938e13e ("kbuild: Allow to specify composite modules with modname-m")

add modname-m support, but miss to update the corresponding multi-objs-m
defination.

commit 551559e13af1c ("kbuild: implement modules.order") miss to filter
the subdir listed in obj-m. Except that the subdirs are totally identical
between obj-y and obj-m, or else I think it will miss something.

But until now, no one has complaining about it, so I guess it just no
one has triggerred it.

Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
---
I found these 2 points which I think might be wrong during code
inspection, but until now, they seems didn't do anything bad, so I am not
sure this is a problem:)

 scripts/Makefile.lib | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 580e605118e4..3209f303213b 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -22,7 +22,7 @@ lib-y := $(filter-out $(obj-y), $(sort $(lib-y) $(lib-m)))
 # Determine modorder.
 # Unfortunately, we don't have information about ordering between -y
 # and -m subdirs.  Just put -y's first.
-modorder	:= $(patsubst %/,%/modules.order, $(filter %/, $(obj-y)) $(obj-m:.o=.ko))
+modorder	:= $(patsubst %/,%/modules.order, $(filter %/, $(obj-y) $(obj-m) $(obj-m:.o=.ko))
 
 # Handle objects in subdirs
 # ---------------------------------------------------------------------------
@@ -49,7 +49,7 @@ single-used-m := $(sort $(filter-out $(multi-used-m),$(obj-m)))
 # Build list of the parts of our composite objects, our composite
 # objects depend on those (obviously)
 multi-objs-y := $(foreach m, $(multi-used-y), $($(m:.o=-objs)) $($(m:.o=-y)))
-multi-objs-m := $(foreach m, $(multi-used-m), $($(m:.o=-objs)) $($(m:.o=-y)))
+multi-objs-m := $(foreach m, $(multi-used-m), $($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-m))
 multi-objs   := $(multi-objs-y) $(multi-objs-m)
 
 # $(subdir-obj-y) is the list of objects in $(obj-y) which uses dir/ to
-- 
2.13.6



