Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qg0-f43.google.com ([209.85.192.43]:33894 "EHLO
	mail-qg0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755059AbcBHWpE (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 8 Feb 2016 17:45:04 -0500
Received: by mail-qg0-f43.google.com with SMTP id b67so41463352qgb.1
        for <linux-kbuild@vger.kernel.org>; Mon, 08 Feb 2016 14:45:03 -0800 (PST)
Date: Mon, 8 Feb 2016 17:45:01 -0500 (EST)
From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: [PATCH 5/6] create/adjust generated/expsyms.h
In-Reply-To: <20160208222448.GC13832@ravnborg.org>
Message-ID: <alpine.LFD.2.20.1602081729190.17825@knanqh.ubzr>
References: <1454963315-20468-1-git-send-email-nicolas.pitre@linaro.org> <1454963315-20468-6-git-send-email-nicolas.pitre@linaro.org> <20160208222448.GC13832@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Al Viro <viro@ZenIV.linux.org.uk>, Rusty Russell <rusty@rustcorp.com.au>

On Mon, 8 Feb 2016, Sam Ravnborg wrote:

> On Mon, Feb 08, 2016 at 03:28:34PM -0500, Nicolas Pitre wrote:
> > Given the list of exported symbols needed by all modules, we can create
> > a header file containing preprocessor defines for each of those symbols.
> > Also, when some symbols are added and/or removed from the list, we can
> > update the time on the corresponding files used as build dependencies for
> > those symbols. And finally, if any symbol did change state, the
> > corresponding source files must be rebuilt.
> > 
> > The insertion or removal of an EXPORT_SYMBOL() entry within a module may
> > create or remove the need for another exported symbol.  This is why this
> > operation has to be repeated until the list of needed exported symbols
> > becomes stable. Only then the final kernel and modules link take place.
> 
> Could this magic with vmlinux_recursive have been implemented in a more
> obvious way in link-vmlinux.sh?
> One of the purposes with link-vmlinux.sh was to make the final link
> stage more readable and this patch goes in the other direction.

I played with different alternatives and this is really the best I came 
up with.  Those alternatives were much uglier.

The adjust_expsyms.sh script must be run only when all vmlinux 
prerequisites have been built i.e descending in all subdirs is done, but 
before actually linking it. And then if some changes in the list of 
exported symbols was detected then all those prerequisites have to be 
re-evaluated again.  The adjust_expsyms.sh invocation could be done from 
link-vmlinux.sh but there would still be a need for a special Make 
target to revisit all dependencies before resuming with the link.

If you have any suggestions for improving this though please feel free 
to share them.


Nicolas
