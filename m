Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:17284 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751611AbeBYMcZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 25 Feb 2018 07:32:25 -0500
Received: from mail-ua0-f171.google.com (mail-ua0-f171.google.com [209.85.217.171]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id w1PCWGiA024974
        for <linux-kbuild@vger.kernel.org>; Sun, 25 Feb 2018 21:32:17 +0900
Received: by mail-ua0-f171.google.com with SMTP id f5so2715451uam.5
        for <linux-kbuild@vger.kernel.org>; Sun, 25 Feb 2018 04:32:17 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20180224152418.9289-1-rosca.eugeniu@gmail.com>
References: <20180224152418.9289-1-rosca.eugeniu@gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 25 Feb 2018 21:31:35 +0900
Message-ID: <CAK7LNATQ2=ump3Mf57Cg8bodeDbSkOcOqwuAudao68dDNGmvPw@mail.gmail.com>
Subject: Re: [PATCH v5] kconfig: Print reverse dependencies in groups
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Eugeniu Rosca <roscaeugeniu@gmail.com>
Cc: Ulf Magnusson <ulfalizer@gmail.com>, Petr Vorel <petr.vorel@gmail.com>, Randy Dunlap <rdunlap@infradead.org>, Paul Bolle <pebolle@tiscali.nl>, Eugeniu Rosca <erosca@de.adit-jv.com>, Eugeniu Rosca <rosca.eugeniu@gmail.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

2018-02-25 0:24 GMT+09:00 Eugeniu Rosca <roscaeugeniu@gmail.com>:
> From: Eugeniu Rosca <erosca@de.adit-jv.com>
>
> Surprisingly or not, disabling a CONFIG option (which is assumed to
> be unneeded) may be not so trivial. Especially it is not trivial, when
> this CONFIG option is selected by a dozen of other configs. Before the
> moment commit 1ccb27143360 ("kconfig: make "Selected by:" and
> "Implied by:" readable") popped up in v4.16-rc1, it was an absolute pain
> to break down the "Selected by" reverse dependency expression in order
> to identify all those configs which select (IOW *do not allow
> disabling*) a certain feature (assumed to be not needed).
>
> This patch tries to make one step further by putting at users'
> fingertips the revdep top level OR sub-expressions grouped/clustered by
> the tristate value they evaluate to. This should allow the users to
> directly concentrate on and tackle the _active_ reverse dependencies.
>
> To give some numbers and quantify the complexity of certain reverse
> dependencies, assuming commit 617aebe6a97e ("Merge tag
> 'usercopy-v4.16-rc1' of
> git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux"), ARCH=arm64
> and vanilla arm64 defconfig, here is the top 10 CONFIG options with
> the highest amount of top level "||" sub-expressions/tokens that make
> up the final "Selected by" reverse dependency expression.
>
> | Config            | All revdep | Active revdep |
> |-------------------|------------|---------------|
> | REGMAP_I2C        | 212        | 9             |
> | CRC32             | 167        | 25            |
> | FW_LOADER         | 128        | 5             |
> | MFD_CORE          | 124        | 9             |
> | FB_CFB_IMAGEBLIT  | 114        | 2             |
> | FB_CFB_COPYAREA   | 111        | 2             |
> | FB_CFB_FILLRECT   | 110        | 2             |
> | SND_PCM           | 103        | 2             |
> | CRYPTO_HASH       | 87         | 19            |
> | WATCHDOG_CORE     | 86         | 6             |
>
> The story behind the above is that users need to visually
> review/evaluate 212 expressions which *potentially* select REGMAP_I2C
> in order to identify the expressions which *actually* select REGMAP_I2C,
> for a particular ARCH and for a particular defconfig used.
>
> To make this experience smoother, change the way reverse dependencies
> are displayed to the user from [1] to [2].
>
> [1] Old representation of DMA_ENGINE_RAID:
>   Selected by:
>   - AMCC_PPC440SPE_ADMA [=n] && DMADEVICES [=y] && (440SPe || 440SP)
>   - BCM_SBA_RAID [=m] && DMADEVICES [=y] && (ARM64 [=y] || ...
>   - FSL_RAID [=n] && DMADEVICES [=y] && FSL_SOC && ...
>   - INTEL_IOATDMA [=n] && DMADEVICES [=y] && PCI [=y] && X86_64
>   - MV_XOR [=n] && DMADEVICES [=y] && (PLAT_ORION || ARCH_MVEBU [=y] ...
>   - MV_XOR_V2 [=y] && DMADEVICES [=y] && ARM64 [=y]
>   - XGENE_DMA [=n] && DMADEVICES [=y] && (ARCH_XGENE [=y] || ...
>   - DMATEST [=n] && DMADEVICES [=y] && DMA_ENGINE [=y]
>
> [2] New representation of DMA_ENGINE_RAID:
>   Selected by [y]:
>   - MV_XOR_V2 [=y] && DMADEVICES [=y] && ARM64 [=y]
>   Selected by [m]:
>   - BCM_SBA_RAID [=m] && DMADEVICES [=y] && (ARM64 [=y] || ...
>   Selected by [n]:
>   - AMCC_PPC440SPE_ADMA [=n] && DMADEVICES [=y] && (440SPe || ...
>   - FSL_RAID [=n] && DMADEVICES [=y] && FSL_SOC && ...
>   - INTEL_IOATDMA [=n] && DMADEVICES [=y] && PCI [=y] && X86_64
>   - MV_XOR [=n] && DMADEVICES [=y] && (PLAT_ORION || ARCH_MVEBU [=y] ...
>   - XGENE_DMA [=n] && DMADEVICES [=y] && (ARCH_XGENE [=y] || ...
>   - DMATEST [=n] && DMADEVICES [=y] && DMA_ENGINE [=y]
>
> Suggested-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
> ---
> v4->v5:
> * 99% based on Masahiro's https://patchwork.kernel.org/patch/10231295/
> * Requires Masahiro's https://patchwork.kernel.org/patch/10229545/
> * Fixes review findings from Petr Vorel:
>   * Adds a colon symbol to the end of every "Selected by [y|m|n]"
>   * Fixes copy-paste error (s/sym->rev_dep.expr/sym->implied.expr/)
>     leading to segfault when searching for PTP_1588_CLOCK in menuconfig.
> * Ignores checkpatch findings:
>   * "WARNING: line over 80 characters", for the same of readability.
>   * "ERROR: Please use git commit description style", which seems to
>     be a checkpatch issue.
>
> v3->v4 (fixed review findings from Ulf):
> * Remove redundant default cases in switch constructs.
> * Remove gettext _() tokens in str_append() calls.
> * Aggregate code repetitions in expr_print_revdep().
>
> v2->v3:
> * Switch from reverse dependencies prefixed by their tristate value to
>   reverse dependencies grouped by the tristate value they evaluate to.
> * Skip printing "{Selected,Implied} by [y|m|n]:" if there are no top
>   level OR tokens/sub-expressions that evaluate to y|m|n (suggested
>   by Petr).
> * Use [1] as template for updating the interface/prototype of
>   __expr_print() (suggested by Ulf).
>
> v1->v2:
> * Don't skip the =n reverse dependency OR tokens, since some users might
>   still need this information (suggested by Ulf).
> * Instead of using "Selected by" for active tokens only, use it for all
>   OR tokens, but specify the tristate value of each token as prefix
>   (suggested by Masahiro).

Applied with

Reviewed-by: Petr Vorel <pvorel@suse.cz>
Reviewed-by: Ulf Magnusson <ulfalizer@gmail.com>


Thanks!




-- 
Best Regards
Masahiro Yamada
