Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qk0-f177.google.com ([209.85.220.177]:36709 "EHLO
        mail-qk0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754015AbcJTQl3 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 20 Oct 2016 12:41:29 -0400
Received: by mail-qk0-f177.google.com with SMTP id o68so104757625qkf.3
        for <linux-kbuild@vger.kernel.org>; Thu, 20 Oct 2016 09:41:29 -0700 (PDT)
Date: Thu, 20 Oct 2016 12:41:27 -0400 (EDT)
From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: [PATCH 4/4] posix-timers: make it configurable
In-Reply-To: <20161020140213.GB2238@netboy>
Message-ID: <alpine.LFD.2.20.1610201234570.25105@knanqh.ubzr>
References: <1476920573-14384-1-git-send-email-nicolas.pitre@linaro.org> <1476920573-14384-5-git-send-email-nicolas.pitre@linaro.org> <20161020140213.GB2238@netboy>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Richard Cochran <richardcochran@gmail.com>
Cc: John Stultz <john.stultz@linaro.org>, Yann E MORIN <yann.morin.1998@free.fr>, Thomas Gleixner <tglx@linutronix.de>, Josh Triplett <josh@joshtriplett.org>, netdev@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 20 Oct 2016, Richard Cochran wrote:

> On Wed, Oct 19, 2016 at 07:42:53PM -0400, Nicolas Pitre wrote:
> > +config POSIX_TIMERS
> > +	bool "Posix Clocks & timers" if EXPERT
> > +	default y
> > +	help
> > +	  This includes native support for POSIX timers to the kernel.
> > +	  Most embedded systems may have no use for them and therefore they
> 
> This sentence doesn't make sense.  How about:
> 
> 	  Some embedded systems have no use for them ...

As you wish.

Turns out that my own use of Fedora currently makes no use of them 
either.


Nicolas
