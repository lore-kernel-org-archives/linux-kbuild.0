Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from astoria.ccjclearline.com ([64.235.106.9]:38112 "EHLO
	astoria.ccjclearline.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751141AbYBRSUI (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 18 Feb 2008 13:20:08 -0500
Date: Mon, 18 Feb 2008 13:20:00 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: Re: packaging issues:  some serious, some not so serious
In-Reply-To: <20080218181747.GA23691@uranus.ravnborg.org>
Message-ID: <alpine.LFD.1.00.0802181319160.4194@localhost.localdomain>
References: <alpine.LFD.1.00.0802181054100.9323@localhost.localdomain> <20080218181747.GA23691@uranus.ravnborg.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: kbuild devel list <linux-kbuild@vger.kernel.org>

On Mon, 18 Feb 2008, Sam Ravnborg wrote:

> I would much rather you persuaded your earlier idea list all the
> directories to visit. This list is known and easy to maintain
> whereas a blacklist like we have now only will grow bigger over
> time.
>
> We could add something like:
> diff --git a/Makefile b/Makefile
> index 0d585c0..fb5bbc3 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -358,6 +358,11 @@ export MODVERDIR := $(if $(KBUILD_EXTMOD),$(firstword $(KBU
>  RCS_FIND_IGNORE := \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS
>  export RCS_TAR_IGNORE := --exclude SCCS --exclude BitKeeper --exclude .svn --ex
>
> +# all dirs
> +KBUILD_ALL_DIRS := arch block crypto Documentation drivers fs include init
> +KBUILD_ALL_DIRS += ipc net samples scripts security sound usr virt
> +export KBUILD_ALL_DIRS
> +
>  # ===========================================================================
>  # Rules shared between *config targets and build targets
>
>
> And then use this definition in all find / tar operations.
> We do not need to change everything in one go as the old RCS_TAR_IGNORE
> and RCS_FIND_IGNORE can continue as is for a while.
>
> Can you please try out this approach?

sure, i prefer that strategy anyway.  let me work on it.

rday
--

========================================================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry:
    Have classroom, will lecture.

http://crashcourse.ca                          Waterloo, Ontario, CANADA
========================================================================
