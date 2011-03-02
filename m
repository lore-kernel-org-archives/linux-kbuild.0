Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepa.post.tele.dk ([195.41.46.235]:41174 "EHLO
	pfepa.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757494Ab1CBVkw (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 2 Mar 2011 16:40:52 -0500
Date: Wed, 2 Mar 2011 22:40:50 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: KBuild question
Message-ID: <20110302214050.GA7324@merkur.ravnborg.org>
References: <AANLkTi=vPJ_TacWUswaS9Zc-2ji0Wn5GhF2M+EKExoME@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AANLkTi=vPJ_TacWUswaS9Zc-2ji0Wn5GhF2M+EKExoME@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Tom Bart <tbartcz@gmail.com>
Cc: linux-kbuild@vger.kernel.org

On Wed, Mar 02, 2011 at 10:11:46PM +0100, Tom Bart wrote:
> Hello,
> I have spend some time analysing KBuild source files.
Sounds boring :-)

> However there is
> one thing that is not clear for me. In the main makefile I have found
> the following statement:
> 
> Most importantly: sub-Makefiles should only ever modify files in
> their own directory. If in some directory we have a dependency on
> a file in another dir (which doesn't happen often, but it's often
> unavoidable when linking the built-in.o targets which finally
> turn into vmlinux), we will call a sub make in that other dir, and
> after that we are sure that everything which is in that other dir
> is now up to date.
> 
> Kernel is build in a recursive manner. I understand that according to
> the citation firstly all dependencies between different directories
> are identified and then the sub-directory walk through process is
> started. Unfortunately I cannot fine where this functionality is
> implemented? Can somebody point me the right place or maybe my line of
> reasoning is simply wrong?

A typical kbuild makefile fragment looks like this:

obj-y += foo/
obj-y += bar.o

Which tell kbuild to visit foo/ and create a built-in.o there.
And then back and build bar.o.
Finally link bar.o + foo/built-in.o => built-in.o

From the above I think you already grasped this.


In Makefile.lib we process all these variables.
We need to build foo/ before we can link
built-in.o.
So we calculate subdir-obj-y which is the list of files
that are dependent on all directories.
And directories are listed in subdir-ym.

So we have something like:

obj-y        => foo/built-in.o bar.o
subdir-obj-y => foo/built-in.o
subdir-ym    => foo/

In Makefiles.build we then have:

    $(builtin-target): $(obj-y) FORCE
            $(call if_changed,link_o_target)

Which tell us to build all files listed in obj-y and then link built-in.o

    $(sort $(subdir-obj-y)): $(subdir-ym) ;

Tell us we need to visit foo/ to build foo/built-in.o

    PHONY += $(subdir-ym)
    $(subdir-ym):
            $(Q)$(MAKE) $(build)=$@

And here we are told what to do to build in a sub-directory.


So after visiting the foo/ directory we have foo/built-in.o
And we can then link the final built-in.o (assuming we have bar.o)

This is recursive so it may go on at several levels.

If you start to look at modules it becomes a bit complicated...

	Sam
