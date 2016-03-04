Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qg0-f49.google.com ([209.85.192.49]:35211 "EHLO
	mail-qg0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756212AbcCDCql (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 3 Mar 2016 21:46:41 -0500
Received: by mail-qg0-f49.google.com with SMTP id y89so33670036qge.2
        for <linux-kbuild@vger.kernel.org>; Thu, 03 Mar 2016 18:46:40 -0800 (PST)
Date: Thu, 3 Mar 2016 21:46:38 -0500 (EST)
From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: [PATCH v4 5/8] kbuild: add fine grained build dependencies for
 exported symbols
In-Reply-To: <56D8C174.70602@suse.com>
Message-ID: <alpine.LFD.2.20.1603032053490.13632@knanqh.ubzr>
References: <1456717691-28298-1-git-send-email-nicolas.pitre@linaro.org> <1456717691-28298-6-git-send-email-nicolas.pitre@linaro.org> <56D8C174.70602@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 3 Mar 2016, Michal Marek wrote:

> Dne 29.2.2016 v 04:48 Nicolas Pitre napsal(a):
> > +# Filter out exported kernel symbol names advertised as warning pragmas
> > +# by the preprocessor and write them to $(1). We must consider continuation
> > +# lines as well: they start with a blank, or the preceeding line ends with
> > +# a ':'. Anything else is passed through as is.
> > +# See also __KSYM_DEP() in include/linux/export.h.
> > +ksym_dep_filter = sed -n \
> > +	-e '1 {x; $$!d}' \
> > +	-e '/^ / {H; $$!d}' \
> > +	-e 'x; /:$$/ {x; H; $$!d; s/^/ /; x}' \
> > +	-e ':filter; /^.*KBUILD_AUTOKSYM_DEP: /! {p; b next}' \
> > +	-e 's//KSYM_/; s/\n.*//; w $(1)' \
> > +	-e ':next; $$!d' \
> > +	-e '1 q; s/^/ /; x; /^ /! b filter'
> 
> This is unreadable and it does not work with my gcc version. I get
> dependencies like
> 
>     $(wildcard include/config/ksym/simple/strtoull [enabled by default].h) \

That's too bad.  This had almost zero overhead as the preprocessor 
didn't have to be executed twice.

Probably adding s/ .*//; before w $(1) would fix that.  But I agree this 
is fragile.  What gcc version is this?

> Please use some other way, which does not require parsing the compiler
> diagnostic messages. A straightforward solution is to do something
> similar to genksyms: A separate preprocessor pass with -Dsomething that
> leaves the EXPORT_SYMBOL statements alone and just collect their occurences.

I went that route at some point. But here I need to extract those 
EXPORT_SYMBOL() instances for all if_changed_dep uses.  That includes 
cc_o_c, cc_s_c, cc_i_c, cc_lst_c, as_s_S, as_o_S, etc. etc.  I need the 
corresponding preprocessor flags without the usual target flags.  Let's 
see what I can do that is more readable than a sed script.

Oh and who said that a sed script had to, or could be readable?  ;-)


Nicolas
