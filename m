Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:39651 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753103AbcJZIvI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 26 Oct 2016 04:51:08 -0400
Date: Wed, 26 Oct 2016 10:51:02 +0200
From: Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH v2 5/5] posix-timers: make it configurable
Message-ID: <20161026085102.GC11974@localhost.localdomain>
References: <1477448931-29051-1-git-send-email-nicolas.pitre@linaro.org>
 <1477448931-29051-6-git-send-email-nicolas.pitre@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1477448931-29051-6-git-send-email-nicolas.pitre@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: John Stultz <john.stultz@linaro.org>, "Yann E. MORIN" <yann.morin.1998@free.fr>, Michal Marek <mmarek@suse.com>, Thomas Gleixner <tglx@linutronix.de>, Josh Triplett <josh@joshtriplett.org>, Edward Cree <ecree@solarflare.com>, netdev@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Oct 25, 2016 at 10:28:51PM -0400, Nicolas Pitre wrote:
> +config POSIX_TIMERS
> +	bool "Posix Clocks & timers" if EXPERT
> +	default y
> +	help
> +	  This includes native support for POSIX timers to the kernel.
> +	  Most embedded systems may have no use for them and therefore they
> +	  can be configured out to reduce the size of the kernel image.

Can you please fix this sentence?  It doesn't make any sense.  "Most"
is making a definite statement of fact, while "may have no use" is
not.

Either you mean:

  1. Most embedded systems have no use for them.

  2. Embedded systems may have no use for them.

or expressing #2 in other words:

  3. Many embedded systems have no use for them.

  4. Some embedded systems have no use for them.

Take your pick.  (But I doubt #1 is really true, and so I would like
to see some numbers to back up that claim.)

Thanks,
Richard




