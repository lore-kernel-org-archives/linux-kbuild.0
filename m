Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:33474 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753378AbcLOSKA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Dec 2016 13:10:00 -0500
From: Nikolay Borisov <n.borisov.lkml@gmail.com>
Subject: default 0 if KASAN expression not working in kbuild
Message-ID: <e8e7205e-17f4-1d2c-f6d1-bd741b65e032@gmail.com>
Date: Thu, 15 Dec 2016 20:09:27 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, yann.morin.1998@free.fr, mmarek@suse.com

Hello,

I was doing some kasan-related debugging and when I enabled it I started
getting warnings for large stackframes. So CONFIG_FRAME_WARN has :

int "Warn for stack frames larger than (needs gcc 4.4)"
    range 0 8192
    default 0 if KASAN
    default 2048 if GCC_PLUGIN_LATENT_ENTROPY
    default 1024 if !64BIT
    default 2048 if 64BIT

This means that frame_warns should effectively be disabled when kasan is
enabled. However in my case this is not the situation.
http://sprunge.us/FiGf here is the config file. It does have
CONFIG_KASAN=y and CONFIG_FRAME_WARN=1024 . And even this is erroneous
since it's a 64bit kernel, so it should be 2k. I haven't manually set
the limit to 1k either.

Regards,
Nikolay
