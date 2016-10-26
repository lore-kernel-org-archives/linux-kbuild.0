Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:36131 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933805AbcJZUSe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 26 Oct 2016 16:18:34 -0400
Date: Wed, 26 Oct 2016 22:18:28 +0200
From: Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH v2 5/5] posix-timers: make it configurable
Message-ID: <20161026201828.GA25143@localhost.localdomain>
References: <1477448931-29051-1-git-send-email-nicolas.pitre@linaro.org>
 <1477448931-29051-6-git-send-email-nicolas.pitre@linaro.org>
 <20161026085102.GC11974@localhost.localdomain>
 <alpine.LFD.2.20.1610260941520.14694@knanqh.ubzr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.20.1610260941520.14694@knanqh.ubzr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: John Stultz <john.stultz@linaro.org>, "Yann E. MORIN" <yann.morin.1998@free.fr>, Michal Marek <mmarek@suse.com>, Thomas Gleixner <tglx@linutronix.de>, Josh Triplett <josh@joshtriplett.org>, Edward Cree <ecree@solarflare.com>, netdev@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Oct 26, 2016 at 09:56:13AM -0400, Nicolas Pitre wrote:
> So if my Fedora usage doesn't need them, we can infer that 
> the number of embedded systems also not needing them might tend towards 
> a high percentage.

(I wouldn't call Fedora an embedded distro, but heh...)

> But let's be conservative and say "some".

Sounds good to me.

Thanks,
Richard
