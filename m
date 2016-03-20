Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from relay06.alfahosting-server.de ([109.237.142.242]:38462 "EHLO
	relay06.alfahosting-server.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755278AbcCTLl6 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 20 Mar 2016 07:41:58 -0400
Date: Sun, 20 Mar 2016 12:35:50 +0100
From: Richard Leitner <dev@g0hl1n.net>
Subject: menuconfig doesn't reset terminal colors correctly
Message-ID: <20160320123550.5331cfb6@frodo>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yann.morin.1998@free.fr, linux-kbuild@vger.kernel.org

Hello,
I just noticed that "make menuconfig" doesn't reset the terminal colors correctly.
I'm running a XFCE Terminal with "xterm" emulation setting configured with black on white.
After "make menuconfig" exits all terminal output is white on black.

I've added fprintf's with the ANSI reset code for stdout and stderr to the mconf.c:handle_exit:

--- a/scripts/kconfig/mconf.c
+++ b/scripts/kconfig/mconf.c
@@ -969,6 +969,10 @@ static int handle_exit(void)
 
 	end_dialog(saved_x, saved_y);
 
+	/* reset terminal */
+	fprintf(stdout, "\033[0m");
+	fprintf(stderr, "\033[0m");
+
 	switch (res) {
 	case 0:
 		if (conf_write(filename)) {


Basically this works for my tests, but I'm not sure if this is a desired solution...
Any comments? Should I prepare a patch for that or is this approach completely wrong?

thanks & regards,
Richard

