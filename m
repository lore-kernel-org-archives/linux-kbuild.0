Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpb.tele.dk ([80.160.77.98]:56307 "EHLO pasmtpB.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752826AbYBRSRm (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 18 Feb 2008 13:17:42 -0500
Date: Mon, 18 Feb 2008 19:17:47 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: packaging issues:  some serious, some not so serious
Message-ID: <20080218181747.GA23691@uranus.ravnborg.org>
References: <alpine.LFD.1.00.0802181054100.9323@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LFD.1.00.0802181054100.9323@localhost.localdomain>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: kbuild devel list <linux-kbuild@vger.kernel.org>

On Mon, Feb 18, 2008 at 11:35:30AM -0500, Robert P. J. Day wrote:
> 
>   there are a few bugs in the packaging targets, both with local
> packaging and remote packaging if you've used "O=" for your kernel
> build.  first, let's consider local builds.
> 
>   consider the packaging makefile scripts/package/Makefile.  these
> early lines look entirely superfluous (nothing uses the variable
> TAR_IGNORE):
> 
> ...
> # Ignore the following files/directories during tar operation
> TAR_IGNORE := --exclude SCCS --exclude BitKeeper --exclude .svn --exclude CVS
> ...
> 
>   next, related to my earlier email, if your kernel source happens to
> be in its own filesystem so that there's a "lost+found" directory, any
> "tar" operation is going to fail due to lack of permissions for that
> directory:
> 
> $ make rpm-pkg
> ...
> find: ./lost+found: Permission denied
> ...
> tar: kernel-2.6.25rc200015g1309d4e/./lost+found: Cannot open:
> Permission denied
> tar: Error exit delayed from previous errors
> make[1]: *** [rpm-pkg] Error 2
> make: *** [rpm-pkg] Error 2
> $
> 
>   it seems to be sufficient to apply the following patch:
> 
> diff --git a/scripts/package/Makefile b/scripts/package/Makefile
> index 5e32607..d3307f1 100644
> --- a/scripts/package/Makefile
> +++ b/scripts/package/Makefile
> @@ -39,7 +39,7 @@ $(objtree)/kernel.spec: $(MKSPEC) $(srctree)/Makefile
>  rpm-pkg rpm: $(objtree)/kernel.spec FORCE
>         $(MAKE) clean
>         $(PREV) ln -sf $(srctree) $(KERNELPATH)
> -       $(PREV) tar -cz $(RCS_TAR_IGNORE) -f $(KERNELPATH).tar.gz $(KERNELPATH)/.
> +       $(PREV) tar -cz --exclude lost+found $(RCS_TAR_IGNORE) -f $(KERNELPATH).tar.gz $(KERNELPATH)/.
>         $(PREV) rm $(KERNELPATH)
> 
I would much rather you persuaded your earlier idea list all
the directories to visit. This list is known and easy to maintain
whereas a blacklist like we have now only will grow bigger over time.

We could add something like:
diff --git a/Makefile b/Makefile
index 0d585c0..fb5bbc3 100644
--- a/Makefile
+++ b/Makefile
@@ -358,6 +358,11 @@ export MODVERDIR := $(if $(KBUILD_EXTMOD),$(firstword $(KBU
 RCS_FIND_IGNORE := \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS
 export RCS_TAR_IGNORE := --exclude SCCS --exclude BitKeeper --exclude .svn --ex

+# all dirs
+KBUILD_ALL_DIRS := arch block crypto Documentation drivers fs include init
+KBUILD_ALL_DIRS += ipc net samples scripts security sound usr virt
+export KBUILD_ALL_DIRS
+
 # ===========================================================================
 # Rules shared between *config targets and build targets


And then use this definition in all find / tar operations.
We do not need to change everything in one go as the old RCS_TAR_IGNORE
and RCS_FIND_IGNORE can continue as is for a while.

Can you please try out this approach?

	Sam
