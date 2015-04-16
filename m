Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hofr.at ([212.69.189.236]:41267 "EHLO mail.hofr.at"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752904AbbDPHXA (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 16 Apr 2015 03:23:00 -0400
Date: Thu, 16 Apr 2015 09:22:58 +0200
From: Nicholas Mc Guire <der.herr@hofr.at>
Subject: Re: [PATCH] kbuild: add documentation of KBUILD_BUILD_VERSION
Message-ID: <20150416072258.GD18186@opentech.at>
References: <1428216268-3545-1-git-send-email-hofrat@osadl.org> <20150411151523.1756ec20@lwn.net> <20150411132023.GA22172@opentech.at> <55297BE2.60401@suse.cz> <20150412040853.GA22517@opentech.at> <552BDB90.6040507@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <552BDB90.6040507@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Jonathan Corbet <corbet@lwn.net>, Nicholas Mc Guire <hofrat@osadl.org>, linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 13 Apr 2015, Michal Marek wrote:

> On 2015-04-12 06:08, Nicholas Mc Guire wrote:
> > On Sat, 11 Apr 2015, Michal Marek wrote:
> > 
> >> Dne 11.4.2015 v 15:20 Nicholas Mc Guire napsal(a):
> >>> On Sat, 11 Apr 2015, Jonathan Corbet wrote:
> >>>
> >>>> On Sun,  5 Apr 2015 08:44:28 +0200
> >>>> Nicholas Mc Guire <hofrat@osadl.org> wrote:
> >>>>
> >>>>> KBUILD_BUILD_VERSION is currently not documented but it is
> >>>>> needed when rebuilding a kernel that should result in the identical
> >>>>> binary. This is a brief documentation of KBUILD_BUILD_VERSION.
> >>>>
> >>>> Can we add something like the above to the document itself so that
> >>>> readers have an idea of why they might want to tweak this?
> >>>>
> >>>> Either way, I can take it in the docs tree if that's best..Michal?
> >>>>
> >>> I thought of that but it would be inconsistent as all other descriptions
> >>> here are only the function not the use.
> >>
> >> Most of the entries in this file predate efforts at deterministic
> >> builds, so I'd prefer usefulness over consistency here :-).
> >>
> >>
> >>> I did not find a file where 
> >>> the problem of identical rebuild would really fit.
> >>
> >> ... unless, of course, you want to start a new file covering this topic.
> >> Because it's not just the few override variables, but also some options
> >> have to be turned off (I remember CONFIG_GCOV_KERNEL) and the paths must
> >> be the same, or relative paths must be used.
> >>
> > The identical path really only should be needed for GCOV as it compiles
> > path info into the binary - are you aware of any other cnfig option that
> > would need the same path ?
> 
> The paths appear in BUG() messages if you are using O=<path>. This can
> be solver by either not using O= or using O=<subdir>, in which case
> kbuild uses '..' as path to the srctree.
> 
> IIRC the problem with GCOV was that gcc was adding a randomly named
> symbol to each object file.
>

well it also simply compiles the absolute path into the binary
so that is in the checksum.
 
> 
> > It could be in a short document but it could also just be placed right
> > under the descriptions of the relevant variables - something like:
> > 
> > 
> > Use of KBUILD_BUILD_{TIMESTAMP,VERSION,USER,HOST}
> > --------------------------------------------------
> > 
> > When the kernel is built, Kbuild stores the build timestamp, version, user
> > and hostname in include/generated/compile.h. By default this information
> > is extracted from the build-environment on every build. To override this
> > behavior and rebuild an identical binary kernel, given a running kernel,
> > the original compile time information needs to be passed to Kbuild.
> > 
> > Prerequisites:
> >  * Original kernel config available (e.g extract it from /proc/config.gz)
> >  * Identical source tree
> >  * Identical toolchain
> >  * Same source path if building with CONFIG_GCOV_KERNEL
> >  * Module signature (CONFIG_MODULE_SIG) must be disabled
> 
> I think that only MODULE_SIG_ALL is problematic, the signature checking
> code itself is OK.
>

thanks - will check that - not sure if I had _SIG AND _ALL on while testing

thanks for the notes - running a randbuild script to see if this holds or not
should give atleast some level of confidence that the
exeptions are complete.

thx!
hofrat 
