Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from yorgi.telenet-ops.be ([195.130.133.69]:59921 "EHLO
	yorgi.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752939AbYLNQbm (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 14 Dec 2008 11:31:42 -0500
Received: from edna.telenet-ops.be (edna.telenet-ops.be [195.130.132.58])
	by yorgi.telenet-ops.be (Postfix) with ESMTP id 419AA680B64
	for <linux-kbuild@vger.kernel.org>; Sun, 14 Dec 2008 17:31:41 +0100 (CET)
Date: Sun, 14 Dec 2008 17:31:08 +0100 (CET)
From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: make headers_install: .install and ..install.cmd
Message-ID: <Pine.LNX.4.64.0812141728370.5714@anakin>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild@vger.kernel.org, Linux Kernel Development <linux-kernel@vger.kernel.org>

	Hi Sam,

When I use `make ARCH=m68k INSTALL_HDR_PATH=/tmp/headers headers_install',
I get lots of `.install' and `..install.cmd' files in /tmp/headers and its
subdirectories.

I'm building the kernel in a separate output directory and run my make command
from there.

Is this intentional?

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
