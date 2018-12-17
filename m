Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:37066 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728009AbeLQRDJ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 17 Dec 2018 12:03:09 -0500
Date: Mon, 17 Dec 2018 11:03:05 -0600
From: Josh Poimboeuf <jpoimboe@redhat.com>
Subject: Re: [PATCH] kbuild: error for CONFIG_ORC_UNWINDER is too much
Message-ID: <20181217170305.chni6e5vmev7hp4r@treble>
References: <869bc700-1d6d-b950-76c7-5d0fc589152c@lca.pw>
 <20181217161728.6875-1-cai@lca.pw>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20181217161728.6875-1-cai@lca.pw>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Qian Cai <cai@lca.pw>
Cc: yamada.masahiro@socionext.com, michal.lkml@markovi.net, mingo@kernel.org, bp@alien8.de, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Gortmaker <paul.gortmaker@windriver.com>

On Mon, Dec 17, 2018 at 11:17:28AM -0500, Qian Cai wrote:
> Since ifdef will be evaluated immediately in the first phrase of the
> Makefile read-in, there is no guarantee that the value for
> CONFIG_ORC_UNWINDER will be up-to-date until in the second phrase that
> this recipe is ran.
> 
> include/config/%.conf: $(KCONFIG_CONFIG) include/config/auto.conf.cmd
> 	$(Q)$(MAKE) -f $(srctree)/Makefile syncconfig
> 
> Hence, change error to warning as this is essentially a best guess. The
> original bug can be reproduced this way,

But this still doesn't fix the root of the problem, that the check
relies on a stale auto.conf.

-- 
Josh
