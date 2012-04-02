Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from jdl.com ([208.123.74.7]:34669 "EHLO jdl.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751323Ab2DBW5f (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 2 Apr 2012 18:57:35 -0400
Message-Id: <E1SEpdZ-0000dW-8Z@jdl.com>
Subject: Re: [PATCH] Fix build failure on cygwin.
In-reply-to: <4F7A1AA6.8000702@suse.cz>
References: <1333375535-6589-1-git-send-email-andree@andree.sk> <4F7A1AA6.8000702@suse.cz>
Date: Mon, 02 Apr 2012 17:22:09 -0500
From: Jon Loeliger <jdl@jdl.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Andrej Krutak <andree@andree.sk>, linux-kbuild@vger.kernel.org

> Adding Jon Loeliger (dtc maintainer) to CC.
> 
> Dne 2.4.2012 16:05, Andrej Krutak napsal(a):
> > The _B macro is defined by cygwin in ctype.h.
> > Move the inclusion to avoid build failure.
> 
> But nothing prevents the other system headers from including <ctype.h>
> earlier :-(. A more robust fix would be to rename the macro to something
> that does not clash (fdt_b??). But that's up to Jon.
> 
> Michal

Folks,

I'll happily accept a patch to rename _B() to something better
or eliminate it entirely.  Patch to devtree-discuss@lists.ozlabs.org
and CC:'ed to jdl@jdl.com, please.

Thanks,
jdl
