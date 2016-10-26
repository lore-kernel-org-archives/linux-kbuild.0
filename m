Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt0-f178.google.com ([209.85.216.178]:34401 "EHLO
        mail-qt0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933046AbcJZWtm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 26 Oct 2016 18:49:42 -0400
Received: by mail-qt0-f178.google.com with SMTP id q7so11647100qtq.1
        for <linux-kbuild@vger.kernel.org>; Wed, 26 Oct 2016 15:49:42 -0700 (PDT)
Date: Wed, 26 Oct 2016 18:49:40 -0400 (EDT)
From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: [PATCH v2 5/5] posix-timers: make it configurable
In-Reply-To: <20161026201828.GA25143@localhost.localdomain>
Message-ID: <alpine.LFD.2.20.1610261844150.14694@knanqh.ubzr>
References: <1477448931-29051-1-git-send-email-nicolas.pitre@linaro.org> <1477448931-29051-6-git-send-email-nicolas.pitre@linaro.org> <20161026085102.GC11974@localhost.localdomain> <alpine.LFD.2.20.1610260941520.14694@knanqh.ubzr>
 <20161026201828.GA25143@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Richard Cochran <richardcochran@gmail.com>
Cc: John Stultz <john.stultz@linaro.org>, "Yann E. MORIN" <yann.morin.1998@free.fr>, Michal Marek <mmarek@suse.com>, Thomas Gleixner <tglx@linutronix.de>, Josh Triplett <josh@joshtriplett.org>, Edward Cree <ecree@solarflare.com>, netdev@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 26 Oct 2016, Richard Cochran wrote:

> On Wed, Oct 26, 2016 at 09:56:13AM -0400, Nicolas Pitre wrote:
> > So if my Fedora usage doesn't need them, we can infer that 
> > the number of embedded systems also not needing them might tend towards 
> > a high percentage.
> 
> (I wouldn't call Fedora an embedded distro, but heh...)

Indeed it is not. Non-embedded distros usually make more extensive usage 
of the kernel.  Still, disabling POSIX timers doesn't affect it.

> > But let's be conservative and say "some".
> 
> Sounds good to me.

Does the PTP related part of this series also sounds good to you?
May I have your ACK?


Nicolas
