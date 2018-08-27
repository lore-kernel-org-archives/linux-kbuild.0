Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vk0-f68.google.com ([209.85.213.68]:37872 "EHLO
        mail-vk0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726875AbeH0KmV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 Aug 2018 06:42:21 -0400
MIME-Version: 1.0
References: <152883965482.1936.13657625103232933481.stgit@taos> <152883969032.1936.15155267369758178246.stgit@taos>
In-Reply-To: <152883969032.1936.15155267369758178246.stgit@taos>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 27 Aug 2018 08:56:50 +0200
Message-ID: <CAMuHMdVf-QDAVh-vHF_xyvX73_nsO9X7RnDc=yCK_FS68i6zTw@mail.gmail.com>
Subject: Re: [PATCH v9 2/2] iommu/amd: Add basic debugfs infrastructure for
 AMD IOMMU
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: gary.hook@amd.com
Cc: Linux IOMMU <iommu@lists.linux-foundation.org>, Joerg Roedel <joro@8bytes.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild <linux-kbuild@vger.kernel.org>

Hi Gary,

On Tue, Jun 12, 2018 at 11:42 PM Gary R Hook <gary.hook@amd.com> wrote:
> Implement a skeleton framework for debugfs support in the AMD
> IOMMU.  Add an AMD-specific Kconfig boolean that depends upon
> general enablement of DebugFS in the IOMMU.
>
> Signed-off-by: Gary R Hook <gary.hook@amd.com>

This is now commit 7d0f5fd3e4d68742 ("iommu/amd: Add basic debugfs
infrastructure for AMD IOMMU").

> --- a/drivers/iommu/Kconfig
> +++ b/drivers/iommu/Kconfig
> @@ -146,6 +146,18 @@ config AMD_IOMMU_V2
>           hardware. Select this option if you want to use devices that support
>           the PCI PRI and PASID interface.
>
> +config AMD_IOMMU_DEBUGFS
> +       bool "Enable AMD IOMMU internals in DebugFS"
> +       depends on AMD_IOMMU && IOMMU_DEBUGFS
> +       ---help---
> +         !!!WARNING!!!  !!!WARNING!!!  !!!WARNING!!!  !!!WARNING!!!
> +
> +         DO NOT ENABLE THIS OPTION UNLESS YOU REALLY, -REALLY- KNOW WHAT YOU ARE DOING!!!
> +         Exposes AMD IOMMU device internals in DebugFS.
> +
> +         This option is -NOT- intended for production environments, and should
> +         not generally be enabled.

If it is that bad, shouldn't this option be protected by some Kconfig
trickery to avoid it being enabled in allmodconfig/allyesconfig builds?

I forgot the way to do that, so some CCs added.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
