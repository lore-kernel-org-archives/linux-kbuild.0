Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qk0-f181.google.com ([209.85.220.181]:33639 "EHLO
        mail-qk0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752044AbcKGWll (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 7 Nov 2016 17:41:41 -0500
Received: by mail-qk0-f181.google.com with SMTP id x190so194236583qkb.0
        for <linux-kbuild@vger.kernel.org>; Mon, 07 Nov 2016 14:41:40 -0800 (PST)
Date: Mon, 7 Nov 2016 17:41:38 -0500 (EST)
From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: [PATCH v3 2/4] kconfig: regenerate *.c_shipped files after
 previous changes
In-Reply-To: <20161107223149.pgs5dqtbw5aprow7@jtriplet-mobl2.jf.intel.com>
Message-ID: <alpine.LFD.2.20.1611071733010.14694@knanqh.ubzr>
References: <1478556899-2951-1-git-send-email-nicolas.pitre@linaro.org> <1478556899-2951-3-git-send-email-nicolas.pitre@linaro.org> <20161107223149.pgs5dqtbw5aprow7@jtriplet-mobl2.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Josh Triplett <josh@joshtriplett.org>
Cc: John Stultz <john.stultz@linaro.org>, Michal Marek <mmarek@suse.com>, Richard Cochran <richardcochran@gmail.com>, Paul Bolle <pebolle@tiscali.nl>, Thomas Gleixner <tglx@linutronix.de>, Edward Cree <ecree@solarflare.com>, netdev@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 7 Nov 2016, Josh Triplett wrote:

> [snipping large patch]
> 
> One suggestion that might make this patch easier to review: you might
> consider first regenerating the unchanged parser with Bison 3.0.4, then
> regenerating it again after the "imply" change.  I think that'd
> eliminate quite a lot of noise in this patch.

I tried that. This made two large patches instead of just one, both 
equally obscure.

So this patch stands on its own, containing changes that are 
mechanically generated and therefore shouldn't require manual review.


Nicolas
