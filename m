Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pandora.armlinux.org.uk ([78.32.30.218]:58328 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754981AbdJIPFe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Oct 2017 11:05:34 -0400
Date: Mon, 9 Oct 2017 16:05:23 +0100
From: Russell King - ARM Linux <linux@armlinux.org.uk>
Subject: Re: [PATCH] kbuild: fix dependency of dtbs targets
Message-ID: <20171009150523.GT20805@n2100.armlinux.org.uk>
References: <1507091240-12756-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1507091240-12756-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Ley Foon Tan <lftan@altera.com>, nios2-dev@lists.rocketboards.org, linux-arm-kernel@lists.infradead.org

On Wed, Oct 04, 2017 at 01:27:20PM +0900, Masahiro Yamada wrote:
> The target "dtbs" should depend on "scripts" because it needs to
> build dtc.  The "prepare" target is unneeded here.

Looks fine for ARM, as the only thing the dtbs should depend on is
the kernel configuration (to decide which to build) and DT tooling.

Acked-by: Russell King <rmk+kernel@armlinux.org.uk>

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 8.8Mbps down 630kbps up
According to speedtest.net: 8.21Mbps down 510kbps up
