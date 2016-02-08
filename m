Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qg0-f53.google.com ([209.85.192.53]:34628 "EHLO
	mail-qg0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756744AbcBHW20 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 8 Feb 2016 17:28:26 -0500
Received: by mail-qg0-f53.google.com with SMTP id b67so41181007qgb.1
        for <linux-kbuild@vger.kernel.org>; Mon, 08 Feb 2016 14:28:26 -0800 (PST)
Date: Mon, 8 Feb 2016 17:28:22 -0500 (EST)
From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: [PATCH 1/6] kbuild: record needed exported symbols for modules
In-Reply-To: <20160208221256.GA13832@ravnborg.org>
Message-ID: <alpine.LFD.2.20.1602081726260.17825@knanqh.ubzr>
References: <1454963315-20468-1-git-send-email-nicolas.pitre@linaro.org> <1454963315-20468-2-git-send-email-nicolas.pitre@linaro.org> <20160208221256.GA13832@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Al Viro <viro@ZenIV.linux.org.uk>, Rusty Russell <rusty@rustcorp.com.au>

On Mon, 8 Feb 2016, Sam Ravnborg wrote:

> >  
> > +# List module undefined symbols
> > +ifdef CONFIG_TRIM_UNUSED_EXPSYMS
> > +cmd_undef_syms = $(NM) $@ | sed -n 's/^ \+U \(.*\)/\1/p' | xargs echo
> > +else
> > +cmd_undef_syms = echo
> > +endif
> Use ":" as a "do nothing" cammand. Then you do not emit an empty line.

I wanted to emit that empty line though. This way it is less likely that 
it'll be reused for other purposes.


Nicolas
