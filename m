Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730799AbgEKRLE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 11 May 2020 13:11:04 -0400
MIME-Version: 1.0
References: <20200207083550.360461-1-e.velu@criteo.com> <20200211142112.649d7237@endymion>
 <ba5b88c9-f056-9375-d1fb-7832c76db29f@criteo.com>
In-Reply-To: <ba5b88c9-f056-9375-d1fb-7832c76db29f@criteo.com>
From: Erwan Velu <erwanaliasr1@gmail.com>
Date: Mon, 11 May 2020 19:10:52 +0200
Message-ID: <CAL2Jzuw8K-p11kZ1DdcVtTn76GE-Y+nr-=UM86DJAiUGSNh6zg@mail.gmail.com>
Subject: Re: [PATCH] firmware/dmi: Report DMI Bios & EC firmware release
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Erwan Velu <e.velu@criteo.com>
Cc: Jean Delvare <jdelvare@suse.de>, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Mattias Jacobsson <2pi@mok.nu>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>, "Darren Hart (VMware)" <dvhart@infradead.org>, Changbin Du <changbin.du@intel.com>, Russell King <rmk+kernel@armlinux.org.uk>, open list <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org

Jean, I don't see my patches in the 5.7-rc series.
Is there anything wrong with them ?

Le mar. 11 f=C3=A9vr. 2020 =C3=A0 14:31, Erwan Velu <e.velu@criteo.com> a =
=C3=A9crit :
>
> No issue with that.
>
> Thanks for applying.
>
> Erwan,
>
> On 11/02/2020 14:21, Jean Delvare wrote:
> > On Fri,  7 Feb 2020 09:35:47 +0100, Erwan Velu wrote:
> >> Some vendors like HPe or Dell, encode the release version of their BIO=
S
> >> in the "System BIOS {Major|Minor} Release" fields of Type 0.
> >>
> >> This information is used to know which bios release actually runs.
> >> It could be used for some quirks, debugging sessions or inventory task=
s.
> >>
> >> A typical output for a Dell system running the 65.27 bios is :
> >>      [root@t1700 ~]# cat /sys/devices/virtual/dmi/id/bios_release
> >>      65.27
> >>      [root@t1700 ~]#
> >>
> >> Servers that have a BMC encode the release version of their firmware i=
n the
> >>   "Embedded Controller Firmware {Major|Minor} Release" fields of Type =
0.
> >>
> >> This information is used to know which BMC release actually runs.
> >> It could be used for some quirks, debugging sessions or inventory task=
s.
> >>
> >> A typical output for a Dell system running the 3.75 bmc release is :
> >>      [root@t1700 ~]# cat /sys/devices/virtual/dmi/id/ec_firmware_relea=
se
> >>      3.75
> >>      [root@t1700 ~]#
> >>
> >> Signed-off-by: Erwan Velu <e.velu@criteo.com>
> >> ---
> >>   drivers/firmware/dmi-id.c       |  6 ++++++
> >>   drivers/firmware/dmi_scan.c     | 30 ++++++++++++++++++++++++++++++
> >>   include/linux/mod_devicetable.h |  2 ++
> >>   scripts/mod/file2alias.c        |  2 ++
> >>   4 files changed, 40 insertions(+)
> >> (...)
> > Applied, thanks. Note that I went for "efr" as the shortcut string for
> > DMI_EC_FIRMWARE_RELEASE, which was your first choice and has my
> > preference.
> >
