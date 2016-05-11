Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:57117 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751491AbcEKLHV (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 11 May 2016 07:07:21 -0400
Date: Wed, 11 May 2016 13:07:18 +0200
From: Michal Marek <mmarek@suse.com>
Subject: Re: [PATCH] kbuild: move -Wunused-const-variable to W=1 warning level
Message-ID: <20160511110718.GA2660@sepie.suse.cz>
References: <1462915821-2843456-1-git-send-email-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1462915821-2843456-1-git-send-email-arnd@arndb.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-kbuild@vger.kernel.org, Olof Johansson <olof@lixom.net>, stable@vger.kernel.org, Ingo Molnar <mingo@kernel.org>, David Howells <dhowells@redhat.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Josh Poimboeuf <jpoimboe@redhat.com>, David Woodhouse <David.Woodhouse@intel.com>, Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org

On Tue, May 10, 2016 at 11:30:01PM +0200, Arnd Bergmann wrote:
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

Applied to kbuild.git#kbuild.

Michal
