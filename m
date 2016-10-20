Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt0-f176.google.com ([209.85.216.176]:36774 "EHLO
        mail-qt0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751039AbcJTSgB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 20 Oct 2016 14:36:01 -0400
Received: by mail-qt0-f176.google.com with SMTP id m5so65805572qtb.3
        for <linux-kbuild@vger.kernel.org>; Thu, 20 Oct 2016 11:36:01 -0700 (PDT)
Date: Thu, 20 Oct 2016 14:35:59 -0400 (EDT)
From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: [PATCH 0/4] make POSIX timers optional with some Kconfig help
In-Reply-To: <alpine.DEB.2.20.1610201145310.5073@nanos>
Message-ID: <alpine.LFD.2.20.1610201433250.25105@knanqh.ubzr>
References: <1476920573-14384-1-git-send-email-nicolas.pitre@linaro.org> <alpine.DEB.2.20.1610201145310.5073@nanos>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: John Stultz <john.stultz@linaro.org>, Richard Cochran <richardcochran@gmail.com>, Yann E MORIN <yann.morin.1998@free.fr>, Josh Triplett <josh@joshtriplett.org>, netdev@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 20 Oct 2016, Thomas Gleixner wrote:

> On Wed, 19 Oct 2016, Nicolas Pitre wrote:
> > Therefore this series also includes kconfig changes to implement a new
> > keyword to express some reverse dependencies like "select" does, named
> > "imply", and still allowing for the target config symbol to be disabled
> > if the user or a direct dependency says so.
> 
> That's really nice work! Thanks for doing that. It makes the whole thing
> more palatable.

Thanks.

Now I'd need some review tags...  ;-)


Nicolas
