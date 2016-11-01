Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:33062 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750712AbcKAPxh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 1 Nov 2016 11:53:37 -0400
Date: Tue, 1 Nov 2016 15:53:33 +0000
From: Wei Yang <richard.weiyang@gmail.com>
Subject: Re: [PATCH] kbuild: add %/built-in.o target in top Makefile
Message-ID: <20161101155333.GA5599@vultr.guest>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <1477313111-25205-1-git-send-email-richard.weiyang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1477313111-25205-1-git-send-email-richard.weiyang@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Wei Yang <richard.weiyang@gmail.com>
Cc: mmarek@suse.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Hi, hope someone like this :-)

On Mon, Oct 24, 2016 at 12:45:11PM +0000, Wei Yang wrote:
>Current kbuild just supports building built-in.o in second directory level
>individually. There is no rule to build those built-in.o targets below
>third directory level.
>
>Even current kbuild system could achieve this with rule "%/", while this
>not only builds built-in targes but also lib target, extra target and
>module objects.
>
>This patch adds the "%/built-in.o" rule so that each built-in.o in the
>kernel tree could be the build target, which looks more consistent for the
>kbuild system.
>
>Signed-off-by: Wei Yang <richard.weiyang@gmail.com>
>---
> Makefile | 2 ++
> 1 file changed, 2 insertions(+)
>
>diff --git a/Makefile b/Makefile
>index addb235..546998e 100644
>--- a/Makefile
>+++ b/Makefile
>@@ -1627,6 +1627,8 @@ endif
> 	$(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
> %.symtypes: %.c prepare scripts FORCE
> 	$(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
>+%/built-in.o: prepare scripts
>+	$(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
> 
> # Modules
> /: prepare scripts FORCE
>-- 
>2.5.0

-- 
Wei Yang
Help you, Help me
