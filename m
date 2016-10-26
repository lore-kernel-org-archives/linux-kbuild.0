Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lb1-smtp-cloud3.xs4all.net ([194.109.24.22]:44745 "EHLO
        lb1-smtp-cloud3.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S932796AbcJZXw1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 26 Oct 2016 19:52:27 -0400
Message-ID: <1477525939.2121.22.camel@tiscali.nl>
Subject: Re: [PATCH v2 0/5] make POSIX timers optional with some Kconfig help
From: Paul Bolle <pebolle@tiscali.nl>
Date: Thu, 27 Oct 2016 01:52:19 +0200
In-Reply-To: <alpine.LFD.2.20.1610261938410.14694@knanqh.ubzr>
References: <1477448931-29051-1-git-send-email-nicolas.pitre@linaro.org>
         <1477523669.2121.8.camel@tiscali.nl>
         <alpine.LFD.2.20.1610261938410.14694@knanqh.ubzr>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: John Stultz <john.stultz@linaro.org>, Richard Cochran <richardcochran@gmail.com>, Michal Marek <mmarek@suse.com>, Thomas Gleixner <tglx@linutronix.de>, Josh Triplett <josh@joshtriplett.org>, Edward Cree <ecree@solarflare.com>, netdev@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 2016-10-26 at 19:41 -0400, Nicolas Pitre wrote:
> On Thu, 27 Oct 2016, Paul Bolle wrote:
> > If you'll have to send another update don't bother including Yann. Yann
> > hasn't be heard of in years. MAINTAINERS doesn't reflect reality for
> > kconfig.
> 
> What about updating it then?

I don't know why Yann is still mentioned after M: in MAINTAINERS. In
practice Michal has (again) been taking care of kconfig.


Paul Bolle
