Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pd0-f176.google.com ([209.85.192.176]:35063 "EHLO
	mail-pd0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755886Ab3GZKX1 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 26 Jul 2013 06:23:27 -0400
MIME-Version: 1.0
Date: Fri, 26 Jul 2013 12:23:26 +0200
Message-ID: <CAMuHMdUjaGRnHZpxs1j4VkYgTUXQNXvqu8LstpxLe8tYdf1oVw@mail.gmail.com>
Subject: kisskb: sparc-allmodconfig is actually sparc64
From: Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Michael Ellerman <michael@ellerman.id.au>
Cc: sparclinux <sparclinux@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

Hi Michael, Stephen,

The sparc-allmodconfig builds on http://kisskb.ellerman.id.au/kisskb/matrix/
seem to be sparc64, not sparc32, allmodconfig builds.
The sparc-allnoconfig builds are sparc32.

BTW, what's the simplest way to make an all*config build with fixed sparc32 or
sparc64?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
