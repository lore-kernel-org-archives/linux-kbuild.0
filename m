Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg1-f195.google.com ([209.85.215.195]:33259 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726211AbgA1WE0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 28 Jan 2020 17:04:26 -0500
Received: by mail-pg1-f195.google.com with SMTP id 6so7748394pgk.0
        for <linux-kbuild@vger.kernel.org>; Tue, 28 Jan 2020 14:04:26 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH] arm64: bcm2835: Drop select of nonexistent HAVE_ARM_ARCH_TIMER
Date: Tue, 28 Jan 2020 14:04:23 -0800
Message-Id: <20200128220423.13270-1-f.fainelli@gmail.com>
In-Reply-To: <20200121100150.31660-1-geert+renesas@glider.be>
References: <20200121100150.31660-1-geert+renesas@glider.be>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: bcm-kernel-feedback-list@broadcom.com, Geert Uytterhoeven <geert+renesas@glider.be>, Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Masahiro Yamada <masahiroy@kernel.org>, Eric Anholt <eric@anholt.net>, Gerd Hoffmann <kraxel@redhat.com>, Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org

On Tue, 21 Jan 2020 11:01:50 +0100, Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> Unlike on arm32, the HAVE_ARM_ARCH_TIMER config symbol does not exist on
> arm64.
> 
> Note that the toplevel ARM64 symbol always selects ARM_ARCH_TIMER, so
> support for it is always included.
> 
> Fixes: 628d30d1ccb897fe ("arm64: Add platform selection for BCM2835.")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Applied to soc-arm64/next, thanks!
--
Florian
