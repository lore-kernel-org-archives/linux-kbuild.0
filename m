Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hofr.at ([212.69.189.236]:38485 "EHLO mail.hofr.at"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750698AbbDLEI4 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 12 Apr 2015 00:08:56 -0400
Date: Sun, 12 Apr 2015 06:08:54 +0200
From: Nicholas Mc Guire <der.herr@hofr.at>
Subject: Re: [PATCH] kbuild: add documentation of KBUILD_BUILD_VERSION
Message-ID: <20150412040853.GA22517@opentech.at>
References: <1428216268-3545-1-git-send-email-hofrat@osadl.org> <20150411151523.1756ec20@lwn.net> <20150411132023.GA22172@opentech.at> <55297BE2.60401@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55297BE2.60401@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Jonathan Corbet <corbet@lwn.net>, Nicholas Mc Guire <hofrat@osadl.org>, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, 11 Apr 2015, Michal Marek wrote:

> Dne 11.4.2015 v 15:20 Nicholas Mc Guire napsal(a):
> > On Sat, 11 Apr 2015, Jonathan Corbet wrote:
> > 
> >> On Sun,  5 Apr 2015 08:44:28 +0200
> >> Nicholas Mc Guire <hofrat@osadl.org> wrote:
> >>
> >>> KBUILD_BUILD_VERSION is currently not documented but it is
> >>> needed when rebuilding a kernel that should result in the identical
> >>> binary. This is a brief documentation of KBUILD_BUILD_VERSION.
> >>
> >> Can we add something like the above to the document itself so that
> >> readers have an idea of why they might want to tweak this?
> >>
> >> Either way, I can take it in the docs tree if that's best..Michal?
> >>
> > I thought of that but it would be inconsistent as all other descriptions
> > here are only the function not the use.
> 
> Most of the entries in this file predate efforts at deterministic
> builds, so I'd prefer usefulness over consistency here :-).
> 
> 
> > I did not find a file where 
> > the problem of identical rebuild would really fit.
> 
> ... unless, of course, you want to start a new file covering this topic.
> Because it's not just the few override variables, but also some options
> have to be turned off (I remember CONFIG_GCOV_KERNEL) and the paths must
> be the same, or relative paths must be used.
>
The identical path really only should be needed for GCOV as it compiles
path info into the binary - are you aware of any other cnfig option that
would need the same path ?

It could be in a short document but it could also just be placed right
under the descriptions of the relevant variables - something like:


Use of KBUILD_BUILD_{TIMESTAMP,VERSION,USER,HOST}
--------------------------------------------------

When the kernel is built, Kbuild stores the build timestamp, version, user
and hostname in include/generated/compile.h. By default this information
is extracted from the build-environment on every build. To override this
behavior and rebuild an identical binary kernel, given a running kernel,
the original compile time information needs to be passed to Kbuild.

Prerequisites:
 * Original kernel config available (e.g extract it from /proc/config.gz)
 * Identical source tree
 * Identical toolchain
 * Same source path if building with CONFIG_GCOV_KERNEL
 * Module signature (CONFIG_MODULE_SIG) must be disabled

The build process for rebuilding the identical binary kernel can extract the
remaining necessary information from dmesg and set the Kbuild and make env:

from the boot log or dmesg in the running system:
[    0.000000] Linux version 4.0.0-rc6-sil2 (hofrat@debian) (gcc version 4.7.2
   (Debian 4.7.2-5) ) #0 SMP Mon Apr 6 01:49:56 EDT 2015
                       ^     ^^^^^^^^^^^^^^^^^^^^^^^^^^^
KBUILD_BUILD_VERSION---'                  |
     KBUILD_BUILD_TIMESTAMP---------------'

$ export KBUILD_BUILD_VERSION=0
$ export KBUILD_BUILD_TIMESTAMP="Mon Apr 6 01:49:56 EDT 2015"
$ export KBUILD_BUILD_USER=hofrat
$ export KBUILD_BUILD_HOST=debian
$ git reset --hard v4.0-rc6
$ zcat /proc/config.gz > .config
$ make oldconfig
$ make -j 8 EXTRAVERSION=-rc6-sil2



probably not quite sufficient yet - but atleast for 
defconfigs and a few other trials it worked for me.

If that makes sense to cleanup I'll try to figure out what
other config options could cause problems and submit it
as a patch to kbuild.txt

thx!
hofrat
