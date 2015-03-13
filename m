Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-we0-f181.google.com ([74.125.82.181]:34306 "EHLO
	mail-we0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751093AbbCMNNW (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 13 Mar 2015 09:13:22 -0400
MIME-Version: 1.0
In-Reply-To: <5501918D.2020000@gmail.com>
References: <5501918D.2020000@gmail.com>
From: Rob Herring <robherring2@gmail.com>
Date: Fri, 13 Mar 2015 08:13:00 -0500
Message-ID: <CAL_JsqLbXJFT4+bnyksHmE9TWJbHuHpujiJOc2MOajO5Xem_+g@mail.gmail.com>
Subject: Re: [Patch v3 1/3] dt: OF_UNITTEST make dependency broken, framework fixes
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Frank Rowand <frowand.list@gmail.com>
Cc: Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>, Michal Marek <mmarek@suse.cz>, Linux Kernel list <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-kbuild@vger.kernel.org

On Thu, Mar 12, 2015 at 8:15 AM, Frank Rowand <frowand.list@gmail.com> wrote:
> From: Frank Rowand <frank.rowand@sonymobile.com>
>
> This 3 patch series is not bisectable.  If CONFIG_OF_UNITTEST=y then the kernel
> will not build with just patch 1 or just patches 1 and 2 applied.

If you did 2 patches with the move first, wouldn't that make it
bisectable. However, I'd rather avoid the move.

> If CONFIG_OF_UNITTEST=y then a kernel image make will always cause .version to
> be incremented, even if there are not source changes.  This is caused by
> a lack of dependency tracking and checking for
> drivers/of/unittest-data/testcases.dtb.o.  Fixing the problem was made more
> complicated by the fact that testcases.dtb.o was linked into ../of_unittest.o.

Couldn't we change that to be 2 modules.

> Patch 1 modifies makefiles to move of_unittest.c into unittest-data/ and
> creates missing dependency tracking for testcases.dtb.o.
>
> Patch 2 will move of_unittest.c into unittest-data/
>
> Patch 3 will fix an of_unittest.c include path to account for the move.

This should all be in an intro email, not patch #1.

Rob

>
> Signed-off-by: Frank Rowand <frank.rowand@sonymobile.com>
>
> ---
>
> changes since version 2:
>
>   patch 1:
>   Add .gitignore so that generated files will not get committed.
>
> changes since version 1:
>
>   patch 1:
>   Remove some changes to scripts/Makefile.lib that are not needed.  They
>   were left over from attempts to fix the problem without moving of_unitest.c
>   into unittest-data/.
>
>
>  drivers/of/Makefile                 |    4 ++--
>  drivers/of/unittest-data/.gitignore |    2 ++
>  drivers/of/unittest-data/Makefile   |    9 +++++++++
>  3 files changed, 13 insertions(+), 2 deletions(-)
>
> Index: b/drivers/of/Makefile
> ===================================================================
> --- a/drivers/of/Makefile
> +++ b/drivers/of/Makefile
> @@ -6,8 +6,6 @@ obj-$(CONFIG_OF_PROMTREE) += pdt.o
>  obj-$(CONFIG_OF_ADDRESS)  += address.o
>  obj-$(CONFIG_OF_IRQ)    += irq.o
>  obj-$(CONFIG_OF_NET)   += of_net.o
> -obj-$(CONFIG_OF_UNITTEST) += of_unittest.o
> -of_unittest-objs := unittest.o unittest-data/testcases.dtb.o
>  obj-$(CONFIG_OF_MDIO)  += of_mdio.o
>  obj-$(CONFIG_OF_PCI)   += of_pci.o
>  obj-$(CONFIG_OF_PCI_IRQ)  += of_pci_irq.o
> @@ -16,5 +14,7 @@ obj-$(CONFIG_OF_RESERVED_MEM) += of_rese
>  obj-$(CONFIG_OF_RESOLVE)  += resolver.o
>  obj-$(CONFIG_OF_OVERLAY) += overlay.o
>
> +obj-$(CONFIG_OF_UNITTEST) += unittest-data/
> +
>  CFLAGS_fdt.o = -I$(src)/../../scripts/dtc/libfdt
>  CFLAGS_fdt_address.o = -I$(src)/../../scripts/dtc/libfdt
> Index: b/drivers/of/unittest-data/Makefile
> ===================================================================
> --- /dev/null
> +++ b/drivers/of/unittest-data/Makefile
> @@ -0,0 +1,9 @@
> +
> +obj-$(CONFIG_OF_UNITTEST) += of_unittest.o
> +of_unittest-objs := unittest.o testcases.dtb.o
> +
> +targets += testcases.dtb testcases.dtb.S
> +
> +.SECONDARY: \
> +       $(obj)/testcases.dtb.S \
> +       $(obj)/testcases.dtb
> Index: b/drivers/of/unittest-data/.gitignore
> ===================================================================
> --- /dev/null
> +++ b/drivers/of/unittest-data/.gitignore
> @@ -0,0 +1,2 @@
> +testcases.dtb
> +testcases.dtb.S
