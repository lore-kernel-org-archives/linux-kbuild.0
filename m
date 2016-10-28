Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lb1-smtp-cloud6.xs4all.net ([194.109.24.24]:51005 "EHLO
        lb1-smtp-cloud6.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751691AbcJ1Vbp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 28 Oct 2016 17:31:45 -0400
Message-ID: <1477690300.2167.26.camel@tiscali.nl>
Subject: Re: [PATCH v2 1/5] kconfig: introduce the "imply" keyword
From: Paul Bolle <pebolle@tiscali.nl>
Date: Fri, 28 Oct 2016 23:31:40 +0200
In-Reply-To: <alpine.LFD.2.20.1610272156050.14694@knanqh.ubzr>
References: <1477448931-29051-1-git-send-email-nicolas.pitre@linaro.org>
         <1477448931-29051-2-git-send-email-nicolas.pitre@linaro.org>
         <1477613871.2121.92.camel@tiscali.nl>
         <alpine.LFD.2.20.1610272156050.14694@knanqh.ubzr>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: John Stultz <john.stultz@linaro.org>, Richard Cochran <richardcochran@gmail.com>, Michal Marek <mmarek@suse.com>, Thomas Gleixner <tglx@linutronix.de>, Josh Triplett <josh@joshtriplett.org>, Edward Cree <ecree@solarflare.com>, netdev@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 2016-10-27 at 23:10 -0400, Nicolas Pitre wrote:
> On Fri, 28 Oct 2016, Paul Bolle wrote:
> > What happens when a tristate symbol is implied by a symbol set to 'y'
> > and by a symbol set to 'm'?
> 
> That's respectively the third and second rows in the table above.

I meant: two separate symbols implying the same symbol at the same
time. One of those symbols set to 'y' and the other set to 'm'.

Anyhow, I hope to play with a mock Kconfig fragment the next few days
to find out myself.

Thanks,


Paul Bolle
