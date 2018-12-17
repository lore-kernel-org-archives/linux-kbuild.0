Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt1-f195.google.com ([209.85.160.195]:40060 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727727AbeLQROD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 17 Dec 2018 12:14:03 -0500
Received: by mail-qt1-f195.google.com with SMTP id k12so14897308qtf.7
        for <linux-kbuild@vger.kernel.org>; Mon, 17 Dec 2018 09:14:02 -0800 (PST)
Message-ID: <1545066839.18411.17.camel@lca.pw>
Subject: Re: [PATCH] kbuild: error for CONFIG_ORC_UNWINDER is too much
From: Qian Cai <cai@lca.pw>
Date: Mon, 17 Dec 2018 12:13:59 -0500
In-Reply-To: <20181217170305.chni6e5vmev7hp4r@treble>
References: <869bc700-1d6d-b950-76c7-5d0fc589152c@lca.pw>
         <20181217161728.6875-1-cai@lca.pw> <20181217170305.chni6e5vmev7hp4r@treble>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: yamada.masahiro@socionext.com, michal.lkml@markovi.net, mingo@kernel.org, bp@alien8.de, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Gortmaker <paul.gortmaker@windriver.com>

On Mon, 2018-12-17 at 11:03 -0600, Josh Poimboeuf wrote:
> On Mon, Dec 17, 2018 at 11:17:28AM -0500, Qian Cai wrote:
> > Since ifdef will be evaluated immediately in the first phrase of the
> > Makefile read-in, there is no guarantee that the value for
> > CONFIG_ORC_UNWINDER will be up-to-date until in the second phrase that
> > this recipe is ran.
> > 
> > include/config/%.conf: $(KCONFIG_CONFIG) include/config/auto.conf.cmd
> > 	$(Q)$(MAKE) -f $(srctree)/Makefile syncconfig
> > 
> > Hence, change error to warning as this is essentially a best guess. The
> > original bug can be reproduced this way,
> 
> But this still doesn't fix the root of the problem, that the check
> relies on a stale auto.conf.
> 

Yes, but it at least let people to be able to continue compiling kernel without
prematurely being terminated incorrectly. The good thing is that that check will
be triggered again to print out the right message once auto.conf has been synced
up.

# make
Makefile:966: "Cannot generate ORC metadata for CONFIG_UNWINDER_ORC=y, please
install libelf-dev, libelf-devel or elfutils-libelf-devel"
  HOSTCC  scripts/kconfig/conf.o
  HOSTLD  scripts/kconfig/conf
scripts/kconfig/conf  --syncconfig Kconfig
Makefile:968: "Cannot use CONFIG_STACK_VALIDATION=y, please install libelf-dev,
libelf-devel or elfutils-libelf-devel"
