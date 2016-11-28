Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:33261 "EHLO
        mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754109AbcK1WGa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 28 Nov 2016 17:06:30 -0500
Date: Mon, 28 Nov 2016 22:06:26 +0000
From: Wei Yang <richard.weiyang@gmail.com>
Subject: Re: [PATCH V2] kbuild: add %/built-in.o target in top Makefile
Message-ID: <20161128220626.GA16745@vultr.guest>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <1477313111-25205-1-git-send-email-richard.weiyang@gmail.com>
 <1478470712-9872-1-git-send-email-richard.weiyang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1478470712-9872-1-git-send-email-richard.weiyang@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Wei Yang <richard.weiyang@gmail.com>
Cc: mmarek@suse.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Hi ~

On Sun, Nov 06, 2016 at 10:18:32PM +0000, Wei Yang wrote:
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
>
>---
>v2
>    . add FORCE in prerequest
>
>---
> Makefile | 2 ++
> 1 file changed, 2 insertions(+)
>
>diff --git a/Makefile b/Makefile
>index f97f786..9c65498 100644
>--- a/Makefile
>+++ b/Makefile
>@@ -1638,6 +1638,8 @@ endif
> 	$(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
> %.symtypes: %.c prepare scripts FORCE
> 	$(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
>+%/built-in.o: prepare scripts FORCE
>+	$(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
> 
> # Modules
> /: prepare scripts FORCE
>-- 
>2.5.0

-- 
Wei Yang
Help you, Help me
