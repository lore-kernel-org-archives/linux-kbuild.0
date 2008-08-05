Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from edna.telenet-ops.be ([195.130.132.58]:41944 "EHLO
	edna.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751217AbYHEHbE (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 5 Aug 2008 03:31:04 -0400
Date: Tue, 5 Aug 2008 09:31:00 +0200 (CEST)
From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: `make oldconfig' no longer updating `.config.old'?
In-Reply-To: <20080804201040.GA28982@uranus.ravnborg.org>
Message-ID: <Pine.LNX.4.64.0808050930390.7331@anakin>
References: <Pine.LNX.4.64.0808040857340.23329@anakin>
 <20080804201040.GA28982@uranus.ravnborg.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild@vger.kernel.org, Linux Kernel Development <linux-kernel@vger.kernel.org>, Tim Bird <tim.bird@am.sony.com>

On Mon, 4 Aug 2008, Sam Ravnborg wrote:
> On Mon, Aug 04, 2008 at 09:02:43AM +0200, Geert Uytterhoeven wrote:
> > I have the habit of doing `make .config{.old,}' after each config run,
> > to see what was changed. But since a few weeks, `make oldconfig' no longer
> > seems to update `.config.old'.
> > 
> > This also breaks the default behavior of `scripts/diffconfig' (`If no
> > config files are specified, .config and .config.old are used.').
> > 
> > Was this change intentional?
> 
> .config is with current kconfig updated only if a user visible
> symbol changes (or something like that).
> I had another similar report where .config was not created if
> missing and confi was not changed.
> 
> Fix is below and I will commit it soon.

Thanks! Problem solved.

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
