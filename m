Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.133]:34329 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726339AbfCLSww (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 Mar 2019 14:52:52 -0400
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
Subject: Standalone version of Kconfig
Message-ID: <088f45cb-204e-4fa4-1062-5574ef97cb8a@metux.net>
Date: Tue, 12 Mar 2019 19:52:46 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: LKML <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>

Hello folks,


YFYI: I've started a standalone version of Kconfig, which can be used
other programs. There have been some attempts to do so, but none seem
to be still alive.

I intend to keep it alive for a long time and sync it w/ the kernel
regularily. The program is meant to be installed just as any other
program (not as part as some other, like it already is in the kernel
or busybox, etc) and I'm going to package it to some distros, too.

At the moment, I'm just supporting menuconfig (other versions follow).
Later, I'll also makefile includes for common stuff (eg. handle module
targets like we do in the kernel, etc).

I'll yet have to find a decent way for syncing w/ the kernel, while
retaining history. Maybe some filter-branch + rebase voodoo ;-)

Feel free to play around :)

https://github.com/metux/kconfig

--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
