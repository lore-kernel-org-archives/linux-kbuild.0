Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f181.google.com ([209.85.212.181]:56891 "EHLO
	mail-wi0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751041Ab3A2H1H (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 29 Jan 2013 02:27:07 -0500
Date: Tue, 29 Jan 2013 08:26:56 +0100
From: Richard Cochran <richardcochran@gmail.com>
Subject: Re: [RFC PATCH 0/4] Add support for LZ4-compressed kernels
Message-ID: <20130129072656.GA18272@localhost.localdomain>
References: <1359179447-31118-1-git-send-email-kyungsik.lee@lge.com>
 <20130128142510.68092e10.akpm@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20130128142510.68092e10.akpm@linux-foundation.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Kyungsik Lee <kyungsik.lee@lge.com>, Russell King <linux@arm.linux.org.uk>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Michal Marek <mmarek@suse.cz>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, x86@kernel.org, Nitin Gupta <nitingupta910@gmail.com>, Richard Purdie <rpurdie@openedhand.com>, Josh Triplett <josh@joshtriplett.org>, Joe Millenbach <jmillenbach@gmail.com>, Albin Tonnerre <albin.tonnerre@free-electrons.com>, hyojun.im@lge.com, chan.jeong@lge.com, gunho.lee@lge.com, minchan.kim@lge.com, namhyung.kim@lge.com, raphael.andy.lee@gmail.com, CE Linux Developers List <celinux-dev@lists.celinuxforum.org>

On Mon, Jan 28, 2013 at 02:25:10PM -0800, Andrew Morton wrote:
> 
> It's a lot of code for a 50ms boot-time improvement.  Does anyone have
> any opinions on whether or not the benefits are worth the cost?

In the embedded space, quick boot is a really important feature to
have. Many people resort to awful hacks in order to improve boot time,
and so I would welcome this option.

I have seen arm systems that boot in 300 ms. I would say that 50 ms is
maybe not such a small improvement after all.

Thanks,
Richard
