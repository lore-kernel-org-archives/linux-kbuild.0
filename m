Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepb.post.tele.dk ([195.41.46.236]:53082 "EHLO
	pfepb.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751440Ab0JIFdO (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 9 Oct 2010 01:33:14 -0400
Date: Sat, 9 Oct 2010 07:33:11 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [kbuild-devel] kbuild and CPPFLAGS (out-of-tree modules)
Message-ID: <20101009053311.GA29160@merkur.ravnborg.org>
References: <1286304522.14601.42.camel@psmith-ubeta.netezza.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1286304522.14601.42.camel@psmith-ubeta.netezza.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paul Smith <paul@mad-scientist.net>, linux-kbuild <linux-kbuild@vger.kernel.org>

[Included linux-kbuild@vger.kernel.org - this is today
 the kbuild mailing list.
 I have in the past tried to close down the
 sourceforge list, alas without luck]

On Tue, Oct 05, 2010 at 02:48:42PM -0400, Paul Smith wrote:
> Hi all.  I'm trying to build an out-of-tree module, which actually has
> configuration associated with it (it has a Kconfig file and
> everything--although that doesn't help me for out-of-tree builds of
> course).
> 
> I have my own makefile which invokes the appropriate kbuild-based make
> (setting O= etc. on the command line).  I know what configure options I
> want to set as well.
> 
> So, I wanted to figure out how just pass a couple of -DCONFIG_...=... on
> the kbuild make command line such that they would be added to the
> compile line of my out-of-tree modules.  Unfortunately I can't use
> EXTRA_CFLAGS (easily) because the out-of-tree module Makefile sets some
> flags in EXTRA_CFLAGS itself.  All things being equal I'd prefer not to
> change the module code, or have to duplicate those flags on my
> invocation line.
In kbuild all the EXTRA_* variables are for internal use in the
individual kbuild files (named Makefiles for historical reasons).

We actually try to clear them before we include the kbuild files,
to avoid any previous value and most users use ":=" to assign them.
So in short - EXTRA_* is not to be used on the command line.

We invented a set of K{A,C,CPP}FLAGS to be used on the commandline.
This was done to avoid picling up peoples random stuff they
have assigned to for example CFLAGS.
A warning is issued to tell the user that we have picked up some
flags on the commandline - this could hacve been an info.

So passing your options using KCFLAGS is the correct thing to do.

> In normal make, the CPPFLAGS variable contains C preprocessor options
> and is included in each compile line automatically.  I can see that
> kbuild supports EXTRA_CPPFLAGS and cppflags-y etc. but these seem to
> have a different purpose; anyway they don't appear on any normal compile
> line.  Is this an oversight?  What are these cppflags variables intended
> for?  I'm having a hard time finding where they are used.
Hmmm...
We use cppflags-y / EXTRA_CPPFLAGS for a single rule which
preprocess linker scripts.

I cannot remember why we did it this way and it looks rather inconsistent.
The right solution would have been to introduce another set of
variables to deal with this special case and let cppflags-y /
EXTRA_CPPFLAGS have effect on both as and cc invocations.
So I understand why you find it hard - since it is inconsistent.

From a quick grep we have ~20 linker script related
assignments to CPPFLAGS_*
This would be easy to fix up - I will consider this.


Feel free to ask agoin if I fail to cover what you really wanted to know!

	Sam
