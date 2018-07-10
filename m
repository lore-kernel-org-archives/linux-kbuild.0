Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:35520 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751047AbeGJHi5 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 10 Jul 2018 03:38:57 -0400
Date: Tue, 10 Jul 2018 09:38:54 +0200
From: Jiri Olsa <jolsa@redhat.com>
Subject: Re: [PATCHv2 2/7] tools: build: Use HOSTLDFLAGS with fixdep
Message-ID: <20180710073854.GB7671@krava>
References: <20180710004602.21599-1-labbott@redhat.com>
 <20180710004602.21599-3-labbott@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180710004602.21599-3-labbott@redhat.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Laura Abbott <labbott@redhat.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Josh Poimboeuf <jpoimboe@redhat.com>, Jiri Olsa <jolsa@kernel.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Robin Jarry <robin.jarry@6wind.com>

On Mon, Jul 09, 2018 at 05:45:57PM -0700, Laura Abbott wrote:
> The final link of fixdep uses LDFLAGS but not the existing HOSTLDFLAGS.
> Fix this.
> 
> Signed-off-by: Laura Abbott <labbott@redhat.com>

Acked-by: Jiri Olsa <jolsa@kernel.org>

thanks,
jirka

> ---
> v2: Switch to just using HOSTLDFLAGS instead of both LDFLAGS and
> HOSTLDFLAGS.
> ---
>  tools/build/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/build/Makefile b/tools/build/Makefile
> index 5eb4b5ad79cb..5edf65e684ab 100644
> --- a/tools/build/Makefile
> +++ b/tools/build/Makefile
> @@ -43,7 +43,7 @@ $(OUTPUT)fixdep-in.o: FORCE
>  	$(Q)$(MAKE) $(build)=fixdep
>  
>  $(OUTPUT)fixdep: $(OUTPUT)fixdep-in.o
> -	$(QUIET_LINK)$(HOSTCC) $(LDFLAGS) -o $@ $<
> +	$(QUIET_LINK)$(HOSTCC) $(HOSTLDFLAGS) -o $@ $<
>  
>  FORCE:
>  
> -- 
> 2.17.1
> 
