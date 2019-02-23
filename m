Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qk1-f193.google.com ([209.85.222.193]:38346 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725980AbfBWBW5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 22 Feb 2019 20:22:57 -0500
Received: by mail-qk1-f193.google.com with SMTP id p15so2288953qkl.5
        for <linux-kbuild@vger.kernel.org>; Fri, 22 Feb 2019 17:22:56 -0800 (PST)
Subject: Re: [PATCH] [v2] kasan: turn off asan-stack for clang-8 and earlier
References: <20190222222950.3997333-1-arnd@arndb.de>
From: Qian Cai <cai@lca.pw>
Message-ID: <0bbc79a7-9a50-1340-1712-41b42ee36b4f@lca.pw>
Date: Fri, 22 Feb 2019 20:22:52 -0500
MIME-Version: 1.0
In-Reply-To: <20190222222950.3997333-1-arnd@arndb.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Andrey Ryabinin <aryabinin@virtuozzo.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Andrew Morton <akpm@linux-foundation.org>
Cc: Dmitry Vyukov <dvyukov@google.com>, Nick Desaulniers <ndesaulniers@google.com>, Mark Brown <broonie@kernel.org>, Kostya Serebryany <kcc@google.com>, Andrey Konovalov <andreyknvl@google.com>, Alexander Potapenko <glider@google.com>, linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-kbuild@vger.kernel.org



On 2/22/19 5:29 PM, Arnd Bergmann wrote:
> Building an arm64 allmodconfig kernel with clang results in over 140 warnings
> about overly large stack frames, the worst ones being:
> 
> drivers/gpu/drm/panel/panel-sitronix-st7789v.c:196:12: error: stack frame size of 20224 bytes in function 'st7789v_prepare'
> drivers/video/fbdev/omap2/omapfb/displays/panel-tpo-td028ttec1.c:196:12: error: stack frame size of 13120 bytes in function 'td028ttec1_panel_enable'
> drivers/usb/host/max3421-hcd.c:1395:1: error: stack frame size of 10048 bytes in function 'max3421_spi_thread'
> drivers/net/wan/slic_ds26522.c:209:12: error: stack frame size of 9664 bytes in function 'slic_ds26522_probe'
> drivers/crypto/ccp/ccp-ops.c:2434:5: error: stack frame size of 8832 bytes in function 'ccp_run_cmd'
> drivers/media/dvb-frontends/stv0367.c:1005:12: error: stack frame size of 7840 bytes in function 'stv0367ter_algo'
> 
> None of these happen with gcc today, and almost all of these are the result
> of a single known issue in llvm.  Hopefully it will eventually get fixed with
> the clang-9 release.
> 
> In the meantime, the best idea I have is to turn off asan-stack for clang-8
> and earlier, so we can produce a kernel that is safe to run.
> 
> I have posted three patches that address the frame overflow warnings that are
> not addressed by turning off asan-stack, so in combination with this change,
> we get much closer to a clean allmodconfig build, which in turn is necessary
> to do meaningful build regression testing.
> 
> It is still possible to turn on the CONFIG_ASAN_STACK option on all versions
> of clang, and it's always enabled for gcc, but when CONFIG_COMPILE_TEST is
> set, the option remains invisible, so allmodconfig and randconfig builds
> (which are normally done with a forced CONFIG_COMPILE_TEST) will still result
> in a mostly clean build.
> 
> Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>
> Cc: Dmitry Vyukov <dvyukov@google.com>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Qian Cai <cai@lca.pw>
> Cc: Kostya Serebryany <kcc@google.com>
> Cc: Andrey Konovalov <andreyknvl@google.com>
> Link: https://bugs.llvm.org/show_bug.cgi?id=38809
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Reviewed-by: Qian Cai <cai@lca.pw>
