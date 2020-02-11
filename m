Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-eopbgr30103.outbound.protection.outlook.com ([40.107.3.103]:20870
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728095AbgBKNbi (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 11 Feb 2020 08:31:38 -0500
Subject: Re: [PATCH] firmware/dmi: Report DMI Bios & EC firmware release
References: <20200207083550.360461-1-e.velu@criteo.com>
 <20200211142112.649d7237@endymion>
From: Erwan Velu <e.velu@criteo.com>
Message-ID: <ba5b88c9-f056-9375-d1fb-7832c76db29f@criteo.com>
Date: Tue, 11 Feb 2020 14:31:29 +0100
In-Reply-To: <20200211142112.649d7237@endymion>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jean Delvare <jdelvare@suse.de>, Erwan Velu <erwanaliasr1@gmail.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Mattias Jacobsson <2pi@mok.nu>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>, "Darren Hart (VMware)" <dvhart@infradead.org>, Changbin Du <changbin.du@intel.com>, Russell King <rmk+kernel@armlinux.org.uk>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

No issue with that.

Thanks for applying.

Erwan,

On 11/02/2020 14:21, Jean Delvare wrote:
> On Fri,  7 Feb 2020 09:35:47 +0100, Erwan Velu wrote:
>> Some vendors like HPe or Dell, encode the release version of their BIOS
>> in the "System BIOS {Major|Minor} Release" fields of Type 0.
>>
>> This information is used to know which bios release actually runs.
>> It could be used for some quirks, debugging sessions or inventory tasks.
>>
>> A typical output for a Dell system running the 65.27 bios is :
>> 	[root@t1700 ~]# cat /sys/devices/virtual/dmi/id/bios_release
>> 	65.27
>> 	[root@t1700 ~]#
>>
>> Servers that have a BMC encode the release version of their firmware in the
>>   "Embedded Controller Firmware {Major|Minor} Release" fields of Type 0.
>>
>> This information is used to know which BMC release actually runs.
>> It could be used for some quirks, debugging sessions or inventory tasks.
>>
>> A typical output for a Dell system running the 3.75 bmc release is :
>>      [root@t1700 ~]# cat /sys/devices/virtual/dmi/id/ec_firmware_release
>>      3.75
>>      [root@t1700 ~]#
>>
>> Signed-off-by: Erwan Velu <e.velu@criteo.com>
>> ---
>>   drivers/firmware/dmi-id.c       |  6 ++++++
>>   drivers/firmware/dmi_scan.c     | 30 ++++++++++++++++++++++++++++++
>>   include/linux/mod_devicetable.h |  2 ++
>>   scripts/mod/file2alias.c        |  2 ++
>>   4 files changed, 40 insertions(+)
>> (...)
> Applied, thanks. Note that I went for "efr" as the shortcut string for
> DMI_EC_FIRMWARE_RELEASE, which was your first choice and has my
> preference.
>
