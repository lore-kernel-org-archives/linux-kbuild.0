Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:43552 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726660AbeLQRtl (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 17 Dec 2018 12:49:41 -0500
Date: Mon, 17 Dec 2018 11:49:36 -0600
From: Josh Poimboeuf <jpoimboe@redhat.com>
Subject: Re: [PATCH] kbuild: error for CONFIG_ORC_UNWINDER is too much
Message-ID: <20181217174936.ouhelssdkshclrr6@treble>
References: <869bc700-1d6d-b950-76c7-5d0fc589152c@lca.pw>
 <20181217161728.6875-1-cai@lca.pw>
 <20181217170305.chni6e5vmev7hp4r@treble>
 <1545066839.18411.17.camel@lca.pw>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1545066839.18411.17.camel@lca.pw>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Qian Cai <cai@lca.pw>
Cc: yamada.masahiro@socionext.com, michal.lkml@markovi.net, mingo@kernel.org, bp@alien8.de, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Gortmaker <paul.gortmaker@windriver.com>

On Mon, Dec 17, 2018 at 12:13:59PM -0500, Qian Cai wrote:
> On Mon, 2018-12-17 at 11:03 -0600, Josh Poimboeuf wrote:
> > On Mon, Dec 17, 2018 at 11:17:28AM -0500, Qian Cai wrote:
> > > Since ifdef will be evaluated immediately in the first phrase of the
> > > Makefile read-in, there is no guarantee that the value for
> > > CONFIG_ORC_UNWINDER will be up-to-date until in the second phrase that
> > > this recipe is ran.
> > > 
> > > include/config/%.conf: $(KCONFIG_CONFIG) include/config/auto.conf.cmd
> > > 	$(Q)$(MAKE) -f $(srctree)/Makefile syncconfig
> > > 
> > > Hence, change error to warning as this is essentially a best guess. The
> > > original bug can be reproduced this way,
> > 
> > But this still doesn't fix the root of the problem, that the check
> > relies on a stale auto.conf.
> > 
> 
> Yes, but it at least let people to be able to continue compiling kernel without
> prematurely being terminated incorrectly. The good thing is that that check will
> be triggered again to print out the right message once auto.conf has been synced
> up.
> 
> # make
> Makefile:966: "Cannot generate ORC metadata for CONFIG_UNWINDER_ORC=y, please
> install libelf-dev, libelf-devel or elfutils-libelf-devel"
>   HOSTCC  scripts/kconfig/conf.o
>   HOSTLD  scripts/kconfig/conf
> scripts/kconfig/conf  --syncconfig Kconfig
> Makefile:968: "Cannot use CONFIG_STACK_VALIDATION=y, please install libelf-dev,
> libelf-devel or elfutils-libelf-devel"

Instead of giving false (or silent) warnings, why not just fix the real
problem?

Also the error exists for a reason: if the user misses the warning then
the ORC unwinder is broken and oops stack dumps are much less useful.

-- 
Josh
