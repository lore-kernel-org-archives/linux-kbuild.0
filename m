Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io0-f178.google.com ([209.85.223.178]:43246 "EHLO
        mail-io0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751863AbdKUAAv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 20 Nov 2017 19:00:51 -0500
MIME-Version: 1.0
In-Reply-To: <20171120212251.k4uvdstfhg6qtrag@ltop.local>
References: <cover.3dd1d0c1f15a7a7c418f20ebafc9719afc1c2704.1510840787.git-series.knut.omang@oracle.com>
 <716fa938a4ab0ad66490b72e2ed750cd6583728f.1510840787.git-series.knut.omang@oracle.com>
 <CAK7LNASBKPMG5eZ2yXPL_xOYUjr+0J56YMC5VRsE6o=xqz=DzA@mail.gmail.com>
 <CA+r1ZhgPUJ_WtCM=RgiPSrSvGrp7FMni2db6S9am5-LN_vhRdg@mail.gmail.com>
 <20171120200827.726yhebihjhrhted@ltop.local> <1511212212.4822.66.camel@oracle.com>
 <20171120212251.k4uvdstfhg6qtrag@ltop.local>
From: Jim Davis <jim.epost@gmail.com>
Date: Mon, 20 Nov 2017 17:00:48 -0700
Message-ID: <CA+r1Zhj295pmVTmh_TVMuy37qRQ7Q6Mxipk7vhyAVkuXFBU8uw@mail.gmail.com>
Subject: Re: [PATCH 2/7] kbuild: Add P= command line flag to run checkpatch
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Cc: Knut Omang <knut.omang@oracle.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Mon, Nov 20, 2017 at 2:22 PM, Luc Van Oostenryck
<luc.vanoostenryck@gmail.com> wrote:

> Should it be possible to somehow keep the distinction between
> the flags coming from KBUILD_CFLAGS and the pure CHECKFLAGS?

Well, the practical problem seems to be that $(CHECK) is called in
scripts/Makefile.build with both $(CHECKFLAGS) and $(c_flags) as
arguments, regardless of what $(CHECK) is.  That can be hacked around
with something inelegant like

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index bb831d49bcfd..102194f9afb9 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -98,14 +98,20 @@ __build: $(if $(KBUILD_BUILTIN),$(builtin-target)
$(lib-target) $(extra-y)) \
         $(subdir-ym) $(always)
        @:

-# Linus' kernel sanity checking tool
+# Linus' kernel sanity checking tool, or $CHECK program of choice
+ifneq ($(KBUILD_CHECKSRC),)
+  add_to_checkflags =
+  ifeq ($(CHECK),sparse)
+    add_to_checkflags = $(c_flags)
+  endif
+endif
 ifneq ($(KBUILD_CHECKSRC),0)
   ifeq ($(KBUILD_CHECKSRC),2)
     quiet_cmd_force_checksrc = CHECK   $<
-          cmd_force_checksrc = $(CHECK) $(CHECKFLAGS) $(c_flags) $< ;
+          cmd_force_checksrc = $(CHECK) $(CHECKFLAGS) $(add_to_checkflags) $< ;
   else
       quiet_cmd_checksrc     = CHECK   $<
-            cmd_checksrc     = $(CHECK) $(CHECKFLAGS) $(c_flags) $< ;
+            cmd_checksrc     = $(CHECK) $(CHECKFLAGS) $(add_to_checkflags) $< ;
   endif
 endif

and then if I run scripts/checkpatch.pl as $CHECK and pass --quiet
--file as before it works -- until checkpatch returns with a non-zero
exit code, which causes the Makefile to bail at that point.

So maybe a wrapper script, with an exit 0 fixup to keep on keeping on
in case of checkpatch warnings or errors, would be better after all.


-- 
Jim
