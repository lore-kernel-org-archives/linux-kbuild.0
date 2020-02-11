Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:40166 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728197AbgBKNVY (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 11 Feb 2020 08:21:24 -0500
Date: Tue, 11 Feb 2020 14:21:12 +0100
From: Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH] firmware/dmi: Report DMI Bios & EC firmware release
Message-ID: <20200211142112.649d7237@endymion>
In-Reply-To: <20200207083550.360461-1-e.velu@criteo.com>
References: <20200207083550.360461-1-e.velu@criteo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Erwan Velu <erwanaliasr1@gmail.com>
Cc: Erwan Velu <e.velu@criteo.com>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Mattias Jacobsson <2pi@mok.nu>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>, "Darren Hart (VMware)" <dvhart@infradead.org>, Changbin Du <changbin.du@intel.com>, Russell King <rmk+kernel@armlinux.org.uk>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

On Fri,  7 Feb 2020 09:35:47 +0100, Erwan Velu wrote:
> Some vendors like HPe or Dell, encode the release version of their BIOS
> in the "System BIOS {Major|Minor} Release" fields of Type 0.
> 
> This information is used to know which bios release actually runs.
> It could be used for some quirks, debugging sessions or inventory tasks.
> 
> A typical output for a Dell system running the 65.27 bios is :
> 	[root@t1700 ~]# cat /sys/devices/virtual/dmi/id/bios_release
> 	65.27
> 	[root@t1700 ~]#
> 
> Servers that have a BMC encode the release version of their firmware in the
>  "Embedded Controller Firmware {Major|Minor} Release" fields of Type 0.
> 
> This information is used to know which BMC release actually runs.
> It could be used for some quirks, debugging sessions or inventory tasks.
> 
> A typical output for a Dell system running the 3.75 bmc release is :
>     [root@t1700 ~]# cat /sys/devices/virtual/dmi/id/ec_firmware_release
>     3.75
>     [root@t1700 ~]#
> 
> Signed-off-by: Erwan Velu <e.velu@criteo.com>
> ---
>  drivers/firmware/dmi-id.c       |  6 ++++++
>  drivers/firmware/dmi_scan.c     | 30 ++++++++++++++++++++++++++++++
>  include/linux/mod_devicetable.h |  2 ++
>  scripts/mod/file2alias.c        |  2 ++
>  4 files changed, 40 insertions(+)
> (...)

Applied, thanks. Note that I went for "efr" as the shortcut string for
DMI_EC_FIRMWARE_RELEASE, which was your first choice and has my
preference.

-- 
Jean Delvare
SUSE L3 Support
