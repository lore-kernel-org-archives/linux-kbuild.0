Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt0-f176.google.com ([209.85.216.176]:36140 "EHLO
        mail-qt0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757510AbcK3Wm4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 30 Nov 2016 17:42:56 -0500
Received: by mail-qt0-f176.google.com with SMTP id w33so203035815qtc.3
        for <linux-kbuild@vger.kernel.org>; Wed, 30 Nov 2016 14:42:00 -0800 (PST)
Date: Wed, 30 Nov 2016 17:41:58 -0500 (EST)
From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: Odd build breakage in 4.9-rc7
In-Reply-To: <CA+55aFyvvVG2-fZbefGXV_dznz16jfKRFukX1u4hWEtG5DfJMw@mail.gmail.com>
Message-ID: <alpine.LFD.2.20.1611301726240.1715@knanqh.ubzr>
References: <20161130172435.GG8563@redhat.com> <CA+55aFz0f6ykvWt+f0ALD62mngJuTrjNY8CQLK3qNAuYUzMeDw@mail.gmail.com> <583F1A5A.7040708@redhat.com> <CA+55aFyPhpYQR-a+PNcDSNBTaRk5CeWAwynSp2QUcStfWazTZA@mail.gmail.com> <583F1F6A.5010307@redhat.com>
 <CA+55aFyvvVG2-fZbefGXV_dznz16jfKRFukX1u4hWEtG5DfJMw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Prarit Bhargava <prarit@redhat.com>, Jarod Wilson <jarod@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tony Luck <tony.luck@intel.com>, zarniwhoop73@googlemail.com, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Wed, 30 Nov 2016, Linus Torvalds wrote:

> On Wed, Nov 30, 2016 at 10:50 AM, Prarit Bhargava <prarit@redhat.com> wrote:
> >
> > It comes back.  The steps to reproduce this are:
> >
> > 1.  checkout latest linux.git
> > 2.  make -j112
> >
> > (IOW, it occurs 100% of the time for me on a clean tree.)

I don't have access to such hardware where -j112 could ever make sense.  :-)
In other words, I can't reproduce regardless of the -j value I try.

> I suspect it's not new, it's just that you are able to hit the timing
> just right (and the new include presumable makes that just be much
> easier).

Here's the best fix I can think of. I can't convince myself any other 
location would be 100% safe.  Obviously I can't confirm if this actually 
fixes anything.

----- >8
Subject: kbuild: make sure autoksyms.h exists early

Some people are able to trigger a race where autoksyms.h is used before
its empty version is even created. Let's create it at the same time as
the directory holding it is created.

Signed-off-by: Nicolas Pitre <nico@linaro.org>

diff --git a/Makefile b/Makefile
index 694111b43c..9f9c3b577c 100644
--- a/Makefile
+++ b/Makefile
@@ -1019,8 +1019,6 @@ prepare2: prepare3 prepare-compiler-check outputmakefile asm-generic
 prepare1: prepare2 $(version_h) include/generated/utsrelease.h \
                    include/config/auto.conf
 	$(cmd_crmodverdir)
-	$(Q)test -e include/generated/autoksyms.h || \
-	    touch   include/generated/autoksyms.h
 
 archprepare: archheaders archscripts prepare1 scripts_basic
 
diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index ebced77deb..90a091b6ae 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -35,6 +35,8 @@ nconfig: $(obj)/nconf
 
 silentoldconfig: $(obj)/conf
 	$(Q)mkdir -p include/config include/generated
+	$(Q)test -e include/generated/autoksyms.h || \
+	    touch   include/generated/autoksyms.h
 	$< $(silent) --$@ $(Kconfig)
 
 localyesconfig localmodconfig: $(obj)/streamline_config.pl $(obj)/conf
