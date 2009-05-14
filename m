Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from spamtitan.hbci.com ([206.230.105.6]:62489 "EHLO
	spamtitan.hbci.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1761716AbZENDw1 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 13 May 2009 23:52:27 -0400
Date: Wed, 13 May 2009 22:12:37 -0500
From: Lance Tagliapietra <lancetag@Luminet.net>
Subject: Re: eliminate -pipe from kernel compile
Message-ID: <20090514031235.GA4178@luminet.net>
Reply-To: lancetag@Luminet.net
References: <20090511015831.GB15777@luminet.net> <10f740e80905102302gbed0737y61c31900564ca704@mail.gmail.com> <20090513003829.GA13155@uranus.ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20090513003829.GA13155@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-m68k@vger.kernel.org, linux-kbuild@vger.kernel.org

Hello,

I just completed a test build with my patch to arch/m68k/Makefile to remove the -pipe flag (see patch below).  
Watching the build confirmed that a) -pipe was no longer showing up in the gcc command lines and b) temporary 
files were being created as expected without pipe; and c) the as command was not loaded waiting for cc1 to 
complete.  Yea!  The /arch/m68k/Makefile is the only place where the -pipe flag is located, and that seems
to be the place for all arch's.

--- arch/m68k/Makefile.old	2009-05-13 21:58:28.000000000 -0500
+++ arch/m68k/Makefile	2009-05-09 11:16:39.000000000 -0500
@@ -33,7 +33,9 @@
 CHECKFLAGS += -D__mc68000__
 
 # without -fno-strength-reduce the 53c7xx.c driver fails ;-(
-KBUILD_CFLAGS += -pipe -fno-strength-reduce -ffixed-a2
+# delete -pipe to save RAM / minimize swap during compile
+# original: KBUILD_CFLAGS += -pipe -fno-strength-reduce -ffixed-a2
+KBUILD_CFLAGS += -fno-strength-reduce -ffixed-a2
 
 # enable processor switch if compiled only for a single cpu
 ifndef CONFIG_M68020

Pulling out the -pipe does seem to cut compile time.  I am working on hard numbers.

--Lance

On Wed, May 13, 2009 at 02:38:29AM +0200, Sam Ravnborg wrote:
> On Mon, May 11, 2009 at 08:02:16AM +0200, Geert Uytterhoeven wrote:
> > Added linux-kbuild
> > 
> > On Mon, May 11, 2009 at 03:58, Lance Tagliapietra <lancetag@luminet.net> wrote:
> > > I was noticing that kernel compiling is set up to have gcc pipe data from one pass to another, instead of using
> > > temporary files. ?On a memory constrained environment, this may not be the best idea (or at least I'd like to
> > > explore that idea). ?Instead of loading the assember, and having immediately being swapped out while the cc1 pass
> > > runs, it may make more sense to have the temp files being written, instead of the swap in and out, when compiling
> > > the various objects of the kernel.
> > >
> > > So, simply pulling out the -pipe from the compiler flag list didn't see to have the desired effect. ?I'm afraid I'm
> > > still missing something. ?I'm still observing the assembler being loaded.
> 
> 1) How did you "pulling out the -pipe from the compiler flag list"?
> Please show this as a patch.
> 
> 2) Did you verify that -pipe was used before and no more after your
>    changes?
>    Hint - use "make V=1" to see all command line options to gcc
> 
> 	Sam
