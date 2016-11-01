Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:57012 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750967AbcKAQ1h (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 1 Nov 2016 12:27:37 -0400
Subject: Re: [PATCH] kbuild: add %/built-in.o target in top Makefile
References: <1477313111-25205-1-git-send-email-richard.weiyang@gmail.com>
From: Michal Marek <mmarek@suse.com>
Message-ID: <794882b2-dfd1-ab76-11a9-8e5126247d23@suse.com>
Date: Tue, 1 Nov 2016 17:27:34 +0100
MIME-Version: 1.0
In-Reply-To: <1477313111-25205-1-git-send-email-richard.weiyang@gmail.com>
Content-Type: text/plain; charset=windows-1251
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Wei Yang <richard.weiyang@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 2016-10-24 14:45, Wei Yang wrote:

> diff --git a/Makefile b/Makefile
> index addb235..546998e 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1627,6 +1627,8 @@ endif
>  	$(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
>  %.symtypes: %.c prepare scripts FORCE
>  	$(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
> +%/built-in.o: prepare scripts
> +	$(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)

This rule gets in the way of

   975  # The actual objects are generated when descending,
   976  # make sure no implicit rule kicks in
   977  $(sort $(vmlinux-deps)): $(vmlinux-dirs) ;

Quickly looking at the Makefile, it may be fine, but it needs to be
confirmed. This also explains why the current behavior with */built-in.o
is inconsistent.

Michal
