Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:38306 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S932757AbeGHKzS (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 8 Jul 2018 06:55:18 -0400
Date: Sun, 8 Jul 2018 12:55:15 +0200
From: Jiri Olsa <jolsa@redhat.com>
Subject: Re: [PATCH 2/7] tools: build: Use HOSTLDFLAGS with fixdep
Message-ID: <20180708105515.GA29861@krava>
References: <20180707010709.16648-1-labbott@redhat.com>
 <20180707010709.16648-3-labbott@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180707010709.16648-3-labbott@redhat.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Laura Abbott <labbott@redhat.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Josh Poimboeuf <jpoimboe@redhat.com>, Jiri Olsa <jolsa@kernel.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Robin Jarry <robin.jarry@6wind.com>

On Fri, Jul 06, 2018 at 06:07:04PM -0700, Laura Abbott wrote:
> The final link of fixdep uses LDFLAGS but not the existing HOSTLDFLAGS.
> Fix this.
> 
> Signed-off-by: Laura Abbott <labbott@redhat.com>
> ---
> This was another one where I couldn't tell of the use of LDFLAGS was a
> typo or intentional, hence keeping both.

I think the replacement (using just HOSTLDFLAGS) should
be the correct fix, moreover fixdep doesn't have any special
link requirements

thanks,
jirka


> ---
>  tools/build/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/build/Makefile b/tools/build/Makefile
> index 5eb4b5ad79cb..cd0fd2cd165b 100644
> --- a/tools/build/Makefile
> +++ b/tools/build/Makefile
> @@ -43,7 +43,7 @@ $(OUTPUT)fixdep-in.o: FORCE
>  	$(Q)$(MAKE) $(build)=fixdep
>  
>  $(OUTPUT)fixdep: $(OUTPUT)fixdep-in.o
> -	$(QUIET_LINK)$(HOSTCC) $(LDFLAGS) -o $@ $<
> +	$(QUIET_LINK)$(HOSTCC) $(HOSTLDFLAGS) $(LDFLAGS) -o $@ $<
>  
>  FORCE:
>  
> -- 
> 2.17.1
> 
