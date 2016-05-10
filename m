Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io0-f193.google.com ([209.85.223.193]:33745 "EHLO
	mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751938AbcEJWZM (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 10 May 2016 18:25:12 -0400
Received: by mail-io0-f193.google.com with SMTP id x35so3418226ioi.0
        for <linux-kbuild@vger.kernel.org>; Tue, 10 May 2016 15:25:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1462915821-2843456-1-git-send-email-arnd@arndb.de>
References: <1462915821-2843456-1-git-send-email-arnd@arndb.de>
Date: Tue, 10 May 2016 15:25:11 -0700
Message-ID: <CAOesGMjCuwqnykojjPQNcXyB9Jqy7Kw6_jEKuZgw9bXY97y26g@mail.gmail.com>
Subject: Re: [PATCH] kbuild: move -Wunused-const-variable to W=1 warning level
From: Olof Johansson <olof@lixom.net>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.com>, stable <stable@vger.kernel.org>, Ingo Molnar <mingo@kernel.org>, David Howells <dhowells@redhat.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Josh Poimboeuf <jpoimboe@redhat.com>, David Woodhouse <David.Woodhouse@intel.com>, Lee Jones <lee.jones@linaro.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, May 10, 2016 at 2:30 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> gcc-6 started warning by default about variables that are not
> used anywhere and that are marked 'const', generating many
> false positives in an allmodconfig build, e.g.:
>
> arch/arm/mach-davinci/board-da830-evm.c:282:20: warning: 'da830_evm_emif25_pins' defined but not used [-Wunused-const-variable=]
> arch/arm/plat-omap/dmtimer.c:958:34: warning: 'omap_timer_match' defined but not used [-Wunused-const-variable=]
> drivers/bluetooth/hci_bcm.c:625:39: warning: 'acpi_bcm_default_gpios' defined but not used [-Wunused-const-variable=]
> drivers/char/hw_random/omap-rng.c:92:18: warning: 'reg_map_omap4' defined but not used [-Wunused-const-variable=]
> drivers/devfreq/exynos/exynos5_bus.c:381:32: warning: 'exynos5_busfreq_int_pm' defined but not used [-Wunused-const-variable=]
> drivers/dma/mv_xor.c:1139:34: warning: 'mv_xor_dt_ids' defined but not used [-Wunused-const-variable=]
>
> This is similar to the existing -Wunused-but-set-variable warning
> that was added in an earlier release and that we disable by default
> now and only enable when W=1 is set, so it makes sense to do
> the same here. Once we have eliminated the majority of the
> warnings for both, we can put them back into the default list.
>
> We probably want this in backport kernels as well, to allow building
> them with gcc-6 without introducing extra warnings.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Cc: stable@vger.kernel.org

Acked-by: Olof Johansson <olof@lixom.net>

> I had originally started testing with gcc-6 a while ago and turned off
> this option in my build scripts because it was too noisy. I fixed all
> the other warnings I got and forgot about it until Olof mentioned it
> when he upgraded his build bot and the warnings started exploding.

Yeah, it makes for a very noisy build that makes the valid real warnings drown.

Someone should feel free to clean these up sometimes, but until then
we shouldn't surface them by default.

I'd love to see this go in before 4.6.


-Olof
