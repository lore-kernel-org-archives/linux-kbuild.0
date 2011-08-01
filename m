Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:39292 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751693Ab1HAOit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 1 Aug 2011 10:38:49 -0400
Date: Mon, 1 Aug 2011 16:36:36 +0200
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] Remove remaining references of CONFIG_GENERIC_TIME
Message-ID: <20110801143636.GE9250@pengutronix.de>
References: <1312042478-26012-1-git-send-email-zdevai@gmail.com>
 <20110801083614.GC15578@n2100.arm.linux.org.uk>
 <CAMuHMdUpTDSRP_JmWqcCBtYwzna0hwmaBshpiF8kgvqoNcqYZA@mail.gmail.com>
 <20110801101410.GE15578@n2100.arm.linux.org.uk>
 <CAMuHMdUiLjMVwOqKPF6tHLpPxROrx=rRf3ednfTLrwGuZ2VF7A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdUiLjMVwOqKPF6tHLpPxROrx=rRf3ednfTLrwGuZ2VF7A@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, chris@zankel.net, linux-am33-list@redhat.com, trivial@kernel.org, user-mode-linux-devel@lists.sourceforge.net, linux-kbuild <linux-kbuild@vger.kernel.org>, linux-kernel@vger.kernel.org, cmetcalf@tilera.com, linux-arm-kernel@lists.infradead.org, Zoltan Devai <zdevai@gmail.com>

On Mon, Aug 01, 2011 at 01:27:52PM +0200, Geert Uytterhoeven wrote:
> On Mon, Aug 1, 2011 at 12:14, Russell King - ARM Linux
> <linux@arm.linux.org.uk> wrote:
> > On Mon, Aug 01, 2011 at 12:09:02PM +0200, Geert Uytterhoeven wrote:
> >> Doesn't kconf error out when trying to select a non-existent symbol?
> >
> > Nope.
> 
> You're right. So that's a bug.
Not sure, this might have been done on purpose to make cross-tree series
easier!?

Best regards
Uwe

-- 
Pengutronix e.K.                           | Uwe Kleine-König            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
