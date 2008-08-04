Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from yorgi.telenet-ops.be ([195.130.133.69]:54939 "EHLO
	yorgi.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1761121AbYHDHDR (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 4 Aug 2008 03:03:17 -0400
Received: from monty.telenet-ops.be (monty.telenet-ops.be [195.130.132.56])
	by yorgi.telenet-ops.be (Postfix) with ESMTP id 2BFA3589359
	for <linux-kbuild@vger.kernel.org>; Mon,  4 Aug 2008 09:03:16 +0200 (CEST)
Date: Mon, 4 Aug 2008 09:02:43 +0200 (CEST)
From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: `make oldconfig' no longer updating `.config.old'?
Message-ID: <Pine.LNX.4.64.0808040857340.23329@anakin>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Linux Kernel Development <linux-kernel@vger.kernel.org>, Tim Bird <tim.bird@am.sony.com>

	Hi,

I have the habit of doing `make .config{.old,}' after each config run,
to see what was changed. But since a few weeks, `make oldconfig' no longer
seems to update `.config.old'.

This also breaks the default behavior of `scripts/diffconfig' (`If no
config files are specified, .config and .config.old are used.').

Was this change intentional?

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
