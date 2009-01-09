Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.123]:51520 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755442AbZAIT5m (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 9 Jan 2009 14:57:42 -0500
Date: Fri, 9 Jan 2009 14:57:38 -0500 (EST)
From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH 1/6]Make recordmcount destinct module compile
In-Reply-To: <20090109192841.GA19482@uranus.ravnborg.org>
Message-ID: <alpine.DEB.1.10.0901091456390.17378@gandalf.stny.rr.com>
References: <1231468368.10683.100.camel@sli10-desk.sh.intel.com> <alpine.DEB.1.10.0901082142510.18713@gandalf.stny.rr.com> <20090109192841.GA19482@uranus.ravnborg.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Shaohua Li <shaohua.li@intel.com>, ia64 <linux-ia64@vger.kernel.org>, "Luck, Tony" <tony.luck@intel.com>, Ingo Molnar <mingo@elte.hu>, linux-kbuild@vger.kernel.org


On Fri, 9 Jan 2009, Sam Ravnborg wrote:
> So we duplicate the cases where we identify "this .o file
> is used in a module".
> This is not good.
> 
> Also there is no reason to do this for the .i, .s and .lst
> targets as they do not invode recordmcount.pl anyway.
> 
> If your build your patch on top of the following we avoid
> the duplicated list.
> 
> 	Sam

Thanks Sam,

Can I add this on top of Shaohua's and put your Signed-off-by, as well
as an Acked-by on Shaohua's?

-- Steve

> 
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 5d90030..3a23239 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -112,13 +112,13 @@ endif
>  # ---------------------------------------------------------------------------
>  
>  # Default is built-in, unless we know otherwise
> -modkern_cflags := $(CFLAGS_KERNEL)
> +modkern_cflags = $(if $(part-of-module), $(CFLAGS_MODULE), $(CFLAGS_KERNEL))
>  quiet_modtag := $(empty)   $(empty)
>  
> -$(real-objs-m)        : modkern_cflags := $(CFLAGS_MODULE)
> -$(real-objs-m:.o=.i)  : modkern_cflags := $(CFLAGS_MODULE)
> -$(real-objs-m:.o=.s)  : modkern_cflags := $(CFLAGS_MODULE)
> -$(real-objs-m:.o=.lst): modkern_cflags := $(CFLAGS_MODULE)
> +$(real-objs-m)        : part-of-module := y
> +$(real-objs-m:.o=.i)  : part-of-module := y
> +$(real-objs-m:.o=.s)  : part-of-module := y
> +$(real-objs-m:.o=.lst): part-of-module := y
>  
>  $(real-objs-m)        : quiet_modtag := [M]
>  $(real-objs-m:.o=.i)  : quiet_modtag := [M]
> 
> 
