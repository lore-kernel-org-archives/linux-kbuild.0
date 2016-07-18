Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.135]:56183 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751214AbcGRTuy (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 18 Jul 2016 15:50:54 -0400
From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] kconfig: tinyconfig: provide whole choice blocks to avoid warnings
Date: Mon, 18 Jul 2016 21:50:26 +0200
Message-ID: <2983805.jYMhKx0S9Q@wuerfel>
In-Reply-To: <20160718193140.GA11720@x>
References: <20160718160035.3062818-1-arnd@arndb.de> <20160718193140.GA11720@x>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Josh Triplett <josh@joshtriplett.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.cz>, "Yann E . MORIN" <yann.morin.1998@free.fr>, Darren Hart <dvhart@linux.intel.com>, kernel-build-reports@lists.linaro.org, Thiago Macieira <thiago.macieira@intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>

On Monday, July 18, 2016 12:31:40 PM CEST Josh Triplett wrote:
> On Mon, Jul 18, 2016 at 06:00:23PM +0200, Arnd Bergmann wrote:
> > Using "make tinyconfig" produces a couple of annoying warnings that show up
> > for build test machines all the time:
> > 
> >     .config:966:warning: override: NOHIGHMEM changes choice state
> >     .config:965:warning: override: SLOB changes choice state
> >     .config:963:warning: override: KERNEL_XZ changes choice state
> >     .config:962:warning: override: CC_OPTIMIZE_FOR_SIZE changes choice state
> >     .config:933:warning: override: SLOB changes choice state
> >     .config:930:warning: override: CC_OPTIMIZE_FOR_SIZE changes choice state
> >     .config:870:warning: override: SLOB changes choice state
> >     .config:868:warning: override: KERNEL_XZ changes choice state
> >     .config:867:warning: override: CC_OPTIMIZE_FOR_SIZE changes choice state
> > 
> > I've made a previous attempt at fixing them and we discussed a number of
> > alternatives.
> > 
> > I tried changing the Makefile to use "merge_config.sh -n $(fragment-list)"
> > but couldn't get that to work properly.
> > 
> > This is yet another approach, based on the observation that we do want
> > to see a warning for conflicting 'choice' options, and that we can simply
> > make them non-conflicting by listing all other options as disabled.
> > This is a trivial patch that we can apply independent of plans for other
> > changes.
> > 
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> 
> Reviewed-by: Josh Triplett <josh@joshtriplett.org>
> 
> This does introduce additional warnings for changing those newly listed
> options, but then we only have one type of warning, which will go away
> with whatever fix you make to the underlying config merge machinery.

I didn't actually consider them warnings but rather config output:
They are written to stdout instead of stderr, and they don't have
the word 'warning' in them:

Value of CONFIG_CC_OPTIMIZE_FOR_SIZE is redefined by fragment /git/arm-soc/kernel/configs/tiny.config:
Previous value: # CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
New value: CONFIG_CC_OPTIMIZE_FOR_SIZE=y

It's probably fine to leave this output present, just like 'make oldconfig'
prints some informational messages about things that have been changed.
In particular, none of the build bots I know will record that as warnings.

On the other hand, I think it's a good idea to not print them when
building with 'make -s', just like we hide all other informational
output, maybe just by redirecting the output of merge_config.sh to
/dev/null, or by adding a '-q' argument.

> I'll send a follow-up patch doing the same for
> arch/x86/configs/tiny.config, whose one config symbol (NOHIGHMEM) also
> forms part of a choice and produces the same warning.
> 
> I find it *mildly* annoying that this means the configs will need to
> change whenever any new choices appear, but at least we'll have warnings
> to tell us that.

Agreed. It's also annoying for the cases of very long choice statements
with dozens of options.

	Arnd
