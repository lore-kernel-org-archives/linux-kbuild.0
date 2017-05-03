Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:42794 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752483AbdECMF1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 3 May 2017 08:05:27 -0400
Date: Wed, 3 May 2017 05:05:19 -0700
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [RFC] Increase Minimal GNU Make version for Linux Kernel from
 3.80 to 3.81
Message-ID: <20170503120519.GB21310@kroah.com>
References: <CAK7LNAT=jbA1GCp1ztoyjF+CxQHGGgOXEVCzr7+AXKaKQX1deg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAT=jbA1GCp1ztoyjF+CxQHGGgOXEVCzr7+AXKaKQX1deg@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Thierry Reding <treding@nvidia.com>, Ingo Molnar <mingo@kernel.org>

On Wed, May 03, 2017 at 03:46:11PM +0900, Masahiro Yamada wrote:
> Hello Linus and Kbuild developers.
> 
> 
> Documentation/process/changes.rst says the minimal version
> of GNU Make is 3.80, but actually building the kernel
> with this version has been broken for a long time.
> 
> Specifically, it got broken by commit c8589d1e9e01 (i.e. Linux 3.18).
> Sorry, it's me who broke it.

Given that no one has noticed since December of 2014, I think we are
safe to bump up the version required for make, as really you did it
already :)

So, no objection from me.

thanks,

greg k-h
