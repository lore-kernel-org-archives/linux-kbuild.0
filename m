Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qg0-f45.google.com ([209.85.192.45]:34527 "EHLO
	mail-qg0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750881AbcCFCdp (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 5 Mar 2016 21:33:45 -0500
Received: by mail-qg0-f45.google.com with SMTP id w104so72994349qge.1
        for <linux-kbuild@vger.kernel.org>; Sat, 05 Mar 2016 18:33:45 -0800 (PST)
Date: Sat, 5 Mar 2016 21:33:41 -0500 (EST)
From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: [PATCH v5 5/8] kbuild: add fine grained build dependencies for
 exported symbols
In-Reply-To: <20160305071208.GA25757@pobox.suse.cz>
Message-ID: <alpine.LFD.2.20.1603052129260.29276@knanqh.ubzr>
References: <1457070050-1564-1-git-send-email-nicolas.pitre@linaro.org> <1457070050-1564-6-git-send-email-nicolas.pitre@linaro.org> <56DA118E.20106@suse.com> <56DA1201.9010605@suse.cz> <20160305071208.GA25757@pobox.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, 5 Mar 2016, Michal Marek wrote:

> On Fri, Mar 04, 2016 at 11:53:53PM +0100, Michal Marek wrote:
> > Dne 4.3.2016 v 23:51 Michal Marek napsal(a):
> > > Dne 4.3.2016 v 06:40 Nicolas Pitre napsal(a):
> > >> +cmd_and_fixdep =                                                             \
> > >> +	$(echo-cmd) $(cmd_$(1));                                             \
> > >> +	$(ksym_dep_filter) |                                                 \
> > >> +		scripts/basic/fixdep -e $(depfile) $@ '$(make-cmd)'          \
> > >> +			> $(dot-target).tmp;	                             \
> > >> +	rm -f $(depfile);                                                    \
> > >> +	mv -f $(dot-target).tmp $(dot-target).cmd;
> > > 
> > > While trying this, I got a SIGBUS from fixdep once. My theory is that
> > > the depfile is mmap()ed by fixdep and modified by the preprocesor run at
> > > the same time. I could not reproduce this so far (still trying). But if
> > > it's really this race, the fix would be to disable dependency generation
> > > in the preprocessor by passing -Wp,MD,/dev/null or somesuch. But we
> > > never had this problem with genksyms, which is weird. It could as well
> > > be that my build machine's memory is faulty :(.
> > 
> > Actually, genksyms does not ran in parallel. neither before nor after
>                               run
> > this patch.
> 
> I reproduced the SIGBUS after a few iterations, and it crashes in
> parse_dep_file(). I'm now testing this
> 
> diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
> index 0be7e09ba381..4fdd8348acf6 100644
> --- a/scripts/Kbuild.include
> +++ b/scripts/Kbuild.include
> @@ -270,10 +270,12 @@ else
>  
>  # Filter out exported kernel symbol names from the preprocessor output.
>  # See also __KSYM_DEPS__ in include/linux/export.h.
> +# We disable the depfile generation here, so as not to overwrite the existing
> +# depfile while fixdep is parsing it
>  ksym_dep_filter =                                                            \
>  	case "$(1)" in                                                       \
> -	cc_*_c) $(CPP) $(c_flags) -D__KSYM_DEPS__ $< ;;                      \
> -	as_*_S) $(CPP) $(a_flags) -D__KSYM_DEPS__ $< ;;                      \
> +	cc_*_c) $(CPP) $(filter-out -Wp$(comma)-M%, $(c_flags)) -D__KSYM_DEPS__ $< ;; \
> +	as_*_S) $(CPP) $(filter-out -Wp$(comma)-M%, $(a_flags)) -D__KSYM_DEPS__ $< ;; \
>  	cpp_lds_S) : ;;                                                      \
>  	*) echo "Don't know how to preprocess $(1)"; false ;;                \
>  	esac | sed -rn 's/^.*=== __KSYM_(.*) ===.*$$/KSYM_\1/p'

This makes perfect sense even if I can't reproduce on my side.

Are you willing to fold this patch in, or do you prefer that I repost?


Nicolas
