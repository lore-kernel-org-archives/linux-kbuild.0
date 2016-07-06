Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([217.72.192.75]:53859 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755145AbcGFNxh (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 6 Jul 2016 09:53:37 -0400
From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] [RFC] Kbuild: avoid "make tinyconfig" warnings
Date: Wed, 06 Jul 2016 15:56:25 +0200
Message-ID: <7677316.bvNVmygFDv@wuerfel>
In-Reply-To: <20160704195815.GA10294@x>
References: <20160704142608.2069991-1-arnd@arndb.de> <20160704195156.GA10164@x> <20160704195815.GA10294@x>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Josh Triplett <josh@joshtriplett.org>
Cc: Michal Marek <mmarek@suse.cz>, "Yann E. MORIN" <yann.morin.1998@free.fr>, Masahiro Yamada <yamada.masahiro@socionext.com>, Darren Hart <dvhart@linux.intel.com>, linux-kbuild@vger.kernel.org, kernel-build-reports@lists.linaro.org, Michal Marek <mmarek@suse.com>, Thiago Macieira <thiago.macieira@intel.com>, linux-kernel@vger.kernel.org

On Monday, July 4, 2016 12:58:15 PM CEST Josh Triplett wrote:
> On Mon, Jul 04, 2016 at 12:51:56PM -0700, Josh Triplett wrote:
> > On Mon, Jul 04, 2016 at 04:25:55PM +0200, Arnd Bergmann wrote:
> > > The introduction of "make *.config" as a shorthand for merging configuration
> > > files unfortunately introduced some build warnings that we see in every
> > > single run of the various build bots testing tinyconfig:
> > > 
> > > .config:966:warning: override: NOHIGHMEM changes choice state
> > > .config:965:warning: override: SLOB changes choice state
> > > .config:963:warning: override: KERNEL_XZ changes choice state
> > > .config:962:warning: override: CC_OPTIMIZE_FOR_SIZE changes choice state
> > > .config:933:warning: override: SLOB changes choice state
> > > .config:930:warning: override: CC_OPTIMIZE_FOR_SIZE changes choice state
> > > .config:870:warning: override: SLOB changes choice state
> > > .config:868:warning: override: KERNEL_XZ changes choice state
> > > .config:867:warning: override: CC_OPTIMIZE_FOR_SIZE changes choice state
> > > 
> > > This changes the behavior for tinyconfig again, so we call the special
> > > allnoconfig target directly, with the fragment as the KCONFIG_ALLCONFIG
> > > file so it gets merged into the configuration. The disadvantage of
> > > this approach is that we cannot pass another KCONFIG_ALLCONFIG on
> > > the command line, that would again have to be done using the mergeconfig
> > > script afterwards.
> > > 
> > > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > > Fixes: 63a91033d52e ("kbuild: add generic mergeconfig target, %.config")
> > > Link: https://storage.kernelci.org/mainline/v4.7-rc6/x86-tinyconfig/build.log
> > 
> > Thanks for fixing this.
> > Reviewed-by: Josh Triplett <josh@joshtriplett.org>
> > 
> > As another possibility, which would preserve the ability to use
> > KCONFIG_ALLCONFIG, what about adding a parameter to mergeconfig to
> > disable this warning?  I've seen many other uses of mergeconfig in
> > production systems that have the same problem.
> 
> Actually, I just realized something: does this actually do the right
> thing if both tiny.config files exist?  The documentation for
> KCONFIG_ALLCONFIG doesn't suggest that it can take two files as
> arguments.  And if it can, this also need quotes; otherwise, this will
> expand to "... allnoconfig KCONFIG=path/to/a/tiny.config
> another/path/to/a/tiny.config".

You are right, my patch doesn't work.

I can think of a few other ways to work around this, though none seems
perfect:

- add a flag to the kconfig tool to ignore 'choice' symbol overrides and not
  warn about them (as you suggested). This may be problematic if there
  are cases in which the warning is actually helpful.

- drop the feature of allowing multiple tiny.config files to be combined
  and instead have the x86 file include everything from the architecture
  independent file. This would only be a small annoyance, but it doesn't
  solve the other cases you mention in which we see similar warnings.

- merge the fragments first and then use the combined fragment as the
  KCONFIG_ALLCONFIG file.

- change merge_config.sh to do a 'savedefconfig' step before applying
  the fragment, so it doesn't warn about choice statements that are
  overridden from their default, as opposed to having conflicting choices.

	Arnd
