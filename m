Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:36220 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753543Ab1CAAtH convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 28 Feb 2011 19:49:07 -0500
Received: by bwz15 with SMTP id 15so4192015bwz.19
        for <linux-kbuild@vger.kernel.org>; Mon, 28 Feb 2011 16:49:05 -0800 (PST)
MIME-Version: 1.0
Date: Tue, 1 Mar 2011 01:49:05 +0100
Message-ID: <AANLkTinBrt-fr_e61thAqLO-MN90BA6a28Lain8u__sR@mail.gmail.com>
Subject: Minimal kernel config generator based on Kconfig language
From: Filip Honckiewicz <f.honckiewicz@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Hi!

I am working on automatic kernel configurator (which is part of my
thesis) written in python, that will provide config as minimal as
possible. First stage of the project is to take loaded module names of
running kernel and add theirs config options to some created
previously config file (I use for testing make allnoconfig).

I created some parser that builds entries tree - holding all entries
with their attributes like dependencies and references to parents,
etc. - but in future it could be replaced by Kconfiglib (patched to
kernel some time ago), because it looks nicer. I also wrote
lekser/parser which builds expression tree to resolve dependencies.

I know that streamline_config.pl exists but I wanted to create tool
that is more flexible. My approach is to resolve dependencies “from
behind”. Tools like make menuconfig forces to enable some lower level
options before enabling this appropriate - higher level options
otherwise high level option will not be visible. I want to do this
opposite way what should help to automatize process of creating
configuration. For example system has loaded “radeon” module. We can
automatically get corresponding config option (DRM_RADEON), enable it
and enable all options which it depends on, going upper and upper
through DRM, PCI, HAS_IOMEM, etc.

But I have problems with Kconfig syntax and understanding all of
dependencies which are implemented in configuration tools like make
menuconfig, but described not enought in kconfig-language, so I am
asking you for help, because I will not jump over some things only by
myself:(

My questions:
1. How dependencies impacts on possible values of config? Can I set
“m” value for config option if dependency expression returns “y” or
can I set “y” if dependency expression returns “m”?
2. How config value impacts on value of selects? For example can I set
“y” for selects if config option has “m” value? What will change if we
add “if” clause in select?
3. Use case: I use make allnoconfig to generate initial config and my
“tool” to enable DRM_CONFIG what results enabling also some
dependencies and select options too what looks ok when I analyze it
using pen and sheet of paper. So why, when I use make allnoconfig and
then enable proper option using make menuconfig it also enables dozen
of another? Where is the connection?
4. Could anyone show me on DRM_CONFIG example looking on its
dependendencies and selects which options should be enabled, but doing
it from behind, I mean I know that I want to set DRM_CONFIG to “m”
value, so how should I set dependencies going upper and upper?

I would be very very very grateful for help and I thought this
explanation could be very helpful not only for me, but for anyone who
want to understand kconfig system.

Yours faithfully
Filip
