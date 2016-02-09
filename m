Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qg0-f51.google.com ([209.85.192.51]:35750 "EHLO
	mail-qg0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753606AbcBIEgV (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 8 Feb 2016 23:36:21 -0500
Received: by mail-qg0-f51.google.com with SMTP id y89so59590297qge.2
        for <linux-kbuild@vger.kernel.org>; Mon, 08 Feb 2016 20:36:21 -0800 (PST)
Date: Mon, 8 Feb 2016 23:36:18 -0500 (EST)
From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: [PATCH 1/6] kbuild: record needed exported symbols for modules
In-Reply-To: <20160209041525.GF17997@ZenIV.linux.org.uk>
Message-ID: <alpine.LFD.2.20.1602082331040.17825@knanqh.ubzr>
References: <1454963315-20468-1-git-send-email-nicolas.pitre@linaro.org> <1454963315-20468-2-git-send-email-nicolas.pitre@linaro.org> <20160209041525.GF17997@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Rusty Russell <rusty@rustcorp.com.au>

On Tue, 9 Feb 2016, Al Viro wrote:

> On Mon, Feb 08, 2016 at 03:28:30PM -0500, Nicolas Pitre wrote:
> > +ifdef CONFIG_TRIM_UNUSED_EXPSYMS
> > +cmd_undef_syms = $(NM) $@ | sed -n 's/^ \+U \(.*\)/\1/p' | xargs echo
> 
> Umm...  sed -nre 's/^ +U //p', perhaps?

Yep, I like it better.

Although I might be tempted by sed -n 's/^ \+U //p' to avoid the "non 
portable" mention that comes with -r (do we actually care?).


Nicolas
