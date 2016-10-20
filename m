Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qk0-f196.google.com ([209.85.220.196]:36704 "EHLO
        mail-qk0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752206AbcJTOCR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 20 Oct 2016 10:02:17 -0400
Date: Thu, 20 Oct 2016 16:02:13 +0200
From: Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH 4/4] posix-timers: make it configurable
Message-ID: <20161020140213.GB2238@netboy>
References: <1476920573-14384-1-git-send-email-nicolas.pitre@linaro.org>
 <1476920573-14384-5-git-send-email-nicolas.pitre@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1476920573-14384-5-git-send-email-nicolas.pitre@linaro.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: John Stultz <john.stultz@linaro.org>, Yann E MORIN <yann.morin.1998@free.fr>, Thomas Gleixner <tglx@linutronix.de>, Josh Triplett <josh@joshtriplett.org>, netdev@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Oct 19, 2016 at 07:42:53PM -0400, Nicolas Pitre wrote:
> +config POSIX_TIMERS
> +	bool "Posix Clocks & timers" if EXPERT
> +	default y
> +	help
> +	  This includes native support for POSIX timers to the kernel.
> +	  Most embedded systems may have no use for them and therefore they

This sentence doesn't make sense.  How about:

	  Some embedded systems have no use for them ...

> +	  can be configured out to reduce the size of the kernel image.

Thanks,
Richard
