Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f176.google.com ([209.85.212.176]:37225 "EHLO
	mail-wi0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753149AbbC1MCq (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 28 Mar 2015 08:02:46 -0400
Received: by wiaa2 with SMTP id a2so64244573wia.0
        for <linux-kbuild@vger.kernel.org>; Sat, 28 Mar 2015 05:02:44 -0700 (PDT)
From: Grant Likely <grant.likely@linaro.org>
Subject: Re: [Patch] dt: OF_UNITTEST make dependency broken
In-Reply-To: <550338CA.50003@gmail.com>
References: <550338CA.50003@gmail.com>
Date: Fri, 27 Mar 2015 18:43:46 -0700
Message-Id: <20150328014346.493EEC40AC2@trevor.secretlab.ca>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: frowand.list@gmail.com, Rob Herring <robh+dt@kernel.org>, Michal Marek <mmarek@suse.cz>, Linux Kernel list <linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-kbuild@vger.kernel.org

On Fri, 13 Mar 2015 12:21:46 -0700
, Frank Rowand <frowand.list@gmail.com>
 wrote:
> From: Frank Rowand <frank.rowand@sonymobile.com>
> 
> If CONFIG_OF_UNITTEST=y then a kernel image make will always cause .version to
> be incremented, even if there are not source changes.  This is caused by
> a lack of dependency tracking and checking for
> drivers/of/unittest-data/testcases.dtb.o.
> 
> 
> Signed-off-by: Frank Rowand <frank.rowand@sonymobile.com>

Brilliant! Thanks for solving this.

g.

> 
> ---
> 
> 
>  drivers/of/Makefile                 |    5 +++--
>  drivers/of/unittest-data/.gitignore |    2 ++
>  drivers/of/unittest-data/Makefile   |    7 +++++++
>  3 files changed, 12 insertions(+), 2 deletions(-)
> 
> Index: b/drivers/of/Makefile
> ===================================================================
> --- a/drivers/of/Makefile
> +++ b/drivers/of/Makefile
> @@ -6,8 +6,7 @@ obj-$(CONFIG_OF_PROMTREE) += pdt.o
>  obj-$(CONFIG_OF_ADDRESS)  += address.o
>  obj-$(CONFIG_OF_IRQ)    += irq.o
>  obj-$(CONFIG_OF_NET)	+= of_net.o
> -obj-$(CONFIG_OF_UNITTEST) += of_unittest.o
> -of_unittest-objs := unittest.o unittest-data/testcases.dtb.o
> +obj-$(CONFIG_OF_UNITTEST) += unittest.o
>  obj-$(CONFIG_OF_MDIO)	+= of_mdio.o
>  obj-$(CONFIG_OF_PCI)	+= of_pci.o
>  obj-$(CONFIG_OF_PCI_IRQ)  += of_pci_irq.o
> @@ -16,5 +15,7 @@ obj-$(CONFIG_OF_RESERVED_MEM) += of_rese
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
> @@ -0,0 +1,7 @@
> +obj-y += testcases.dtb.o
> +
> +targets += testcases.dtb testcases.dtb.S
> +
> +.SECONDARY: \
> +	$(obj)/testcases.dtb.S \
> +	$(obj)/testcases.dtb
> Index: b/drivers/of/unittest-data/.gitignore
> ===================================================================
> --- /dev/null
> +++ b/drivers/of/unittest-data/.gitignore
> @@ -0,0 +1,2 @@
> +testcases.dtb
> +testcases.dtb.S

