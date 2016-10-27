Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qk0-f169.google.com ([209.85.220.169]:34159 "EHLO
        mail-qk0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933945AbcJ0CjO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 26 Oct 2016 22:39:14 -0400
Received: by mail-qk0-f169.google.com with SMTP id x11so27680497qka.1
        for <linux-kbuild@vger.kernel.org>; Wed, 26 Oct 2016 19:39:13 -0700 (PDT)
Date: Wed, 26 Oct 2016 22:39:11 -0400 (EDT)
From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: [PATCH v2 2/5] kconfig: introduce the "suggest" keyword
In-Reply-To: <1477527045.2121.26.camel@tiscali.nl>
Message-ID: <alpine.LFD.2.20.1610262232220.14694@knanqh.ubzr>
References: <1477448931-29051-1-git-send-email-nicolas.pitre@linaro.org> <1477448931-29051-3-git-send-email-nicolas.pitre@linaro.org> <1477527045.2121.26.camel@tiscali.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paul Bolle <pebolle@tiscali.nl>
Cc: John Stultz <john.stultz@linaro.org>, Richard Cochran <richardcochran@gmail.com>, Michal Marek <mmarek@suse.com>, Thomas Gleixner <tglx@linutronix.de>, Josh Triplett <josh@joshtriplett.org>, Edward Cree <ecree@solarflare.com>, netdev@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 27 Oct 2016, Paul Bolle wrote:

> On Tue, 2016-10-25 at 22:28 -0400, Nicolas Pitre wrote:
> > Similar to "imply" but with no added restrictions on the target symbol's
> > value. Useful for providing a default value to another symbol.
> > 
> > Suggested by Edward Cree.
> > 
> > Signed-off-by: Nicolas Pitre <nico@linaro.org>
> 
> As far as I can see this series doesn't add a user of "suggest". So I
> see no reason to add it.
> 
> NAK.

Fine.

Given the discussion from the "imply" patch I thought "suggest" could 
become popular. But if/when someone actually wants it then this patch 
could be picked up later.


Nicolas
