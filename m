Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:46015 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726420AbgCJPbj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 10 Mar 2020 11:31:39 -0400
MIME-Version: 1.0
References: <20200308073400.23398-1-natechancellor@gmail.com>
 <CAK7LNARcTHpd8fzrAhFVB_AR7NoBgenX64de0eS2uN8g0by9PQ@mail.gmail.com>
 <20200310012545.GA16822@ubuntu-m2-xlarge-x86> <c2a687d065c1463d8eea9947687b3b05@AcuMS.aculab.com>
In-Reply-To: <c2a687d065c1463d8eea9947687b3b05@AcuMS.aculab.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 11 Mar 2020 00:30:57 +0900
Message-ID: <CAK7LNARMsO0AeO8-kH4czMuW0Y_=dN+ZhtXNdRE7CWGvU2PNvA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Disable -Wpointer-to-enum-cast
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David Laight <David.Laight@aculab.com>
Cc: Nathan Chancellor <natechancellor@gmail.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, clang-built-linux <clang-built-linux@googlegroups.com>, stable <stable@vger.kernel.org>

On Tue, Mar 10, 2020 at 8:31 PM David Laight <David.Laight@aculab.com> wrote:
>
> From: Nathan Chancellor
> > Sent: 10 March 2020 01:26
> ...
> > Sure, I can send v2 to do that but I think that sending 97 patches just
> > casting the small values (usually less than twenty) to unsigned long
> > then to the enum is rather frivolous. I audited at least ten to fifteen
> > of these call sites when creating the clang patch and they are all
> > basically false positives.
>
> Such casts just make the code hard to read.
> If misused casts can hide horrid bugs.
> IMHO sprinkling the code with casts just to remove
> compiler warnings will bite back one day.
>

I agree that too much casts make the code hard to read,
but irrespective of this patch, there is no difference
in the fact that we need a cast to convert
(const void *) to a non-pointer value.

The difference is whether we use
(uintptr_t) or (enum foo).




If we want to avoid casts completely,
we could use union in struct of_device_id
although this might be rejected.


FWIW:

diff --git a/drivers/ata/ahci_brcm.c b/drivers/ata/ahci_brcm.c
index 6853dbb4131d..534170bea134 100644
--- a/drivers/ata/ahci_brcm.c
+++ b/drivers/ata/ahci_brcm.c
@@ -415,11 +415,11 @@ static struct scsi_host_template ahci_platform_sht = {
 };

 static const struct of_device_id ahci_of_match[] = {
-       {.compatible = "brcm,bcm7425-ahci", .data = (void *)BRCM_SATA_BCM7425},
-       {.compatible = "brcm,bcm7445-ahci", .data = (void *)BRCM_SATA_BCM7445},
-       {.compatible = "brcm,bcm63138-ahci", .data = (void *)BRCM_SATA_BCM7445},
-       {.compatible = "brcm,bcm-nsp-ahci", .data = (void *)BRCM_SATA_NSP},
-       {.compatible = "brcm,bcm7216-ahci", .data = (void *)BRCM_SATA_BCM7216},
+       {.compatible = "brcm,bcm7425-ahci", .data2 = BRCM_SATA_BCM7425},
+       {.compatible = "brcm,bcm7445-ahci", .data2 = BRCM_SATA_BCM7445},
+       {.compatible = "brcm,bcm63138-ahci", .data2 = BRCM_SATA_BCM7445},
+       {.compatible = "brcm,bcm-nsp-ahci", .data2 = BRCM_SATA_NSP},
+       {.compatible = "brcm,bcm7216-ahci", .data2 = BRCM_SATA_BCM7216},
        {},
 };
 MODULE_DEVICE_TABLE(of, ahci_of_match);
@@ -442,7 +442,7 @@ static int brcm_ahci_probe(struct platform_device *pdev)
        if (!of_id)
                return -ENODEV;

-       priv->version = (enum brcm_ahci_version)of_id->data;
+       priv->version = of_id->data2;
        priv->dev = dev;

        res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "top-ctrl");
diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index e3596db077dc..98d44ebf146a 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -261,7 +261,10 @@ struct of_device_id {
        char    name[32];
        char    type[32];
        char    compatible[128];
-       const void *data;
+       union {
+               const void *data;
+               unsigned long data2;
+       };
 };

 /* VIO */






-- 
Best Regards
Masahiro Yamada
