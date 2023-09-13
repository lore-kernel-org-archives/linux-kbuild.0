Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 841DFEE0213
	for <linux-kbuild@archiver.kernel.org>; Wed, 13 Sep 2023 23:45:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231515AbjIMXqB (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Wed, 13 Sep 2023 19:46:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229894AbjIMXqB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 13 Sep 2023 19:46:01 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 346F2CE9;
        Wed, 13 Sep 2023 16:45:57 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 973B1C433C8;
        Wed, 13 Sep 2023 23:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694648756;
        bh=4SupmE+rd4VHNIr++6SNAIwXVY0TtGJkqm0eRn32dBU=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=ex+9bliNhiW6d2Z5oxJdImJvccrs1Us0hroL3wH7gREKrV0eDqkfJff0P+oCfiAVR
         1Yagtms4oswN+H/E4rGGDJlkAJJVxoEDOIPHHT08RGheVEqQpoNMVSzSoFr5EJ9lSB
         O2JYb0yfsNWosFMSkq2/tFDMAuYoD+wtGM7Qiw6mDrrHWRSgBxfNfv/gT7T9XFvLpJ
         3AX+XCevHhC56Yy/q1Vc26HDdJaUufn3a6TXeoG1p3sawzboxEnopItSMcXibCPSpn
         RFjg17zsCoQTlyFtjyjPZNIgHwVvqyHJ7cLBvh5aW9WJj3hDu4EiITKr5CmFOvAJx6
         xubNlzgf00FGg==
Message-ID: <10887293-fa2e-83e1-9305-487905a8afd2@kernel.org>
Date:   Thu, 14 Sep 2023 08:45:54 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] linux/export: fix reference to exported functions for
 parisc64
Content-Language: en-US
To:     John David Anglin <dave.anglin@bell.net>,
        Helge Deller <deller@gmx.de>,
        James Bottomley <James.Bottomley@HansenPartnership.com>
Cc:     linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kbuild@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>
References: <20230905190828.790400-1-masahiroy@kernel.org>
 <c8a92dc8-de78-7484-bcc8-d4a91bec77de@bell.net>
 <c6568683-86b4-c48d-ed37-f1f87677eb44@bell.net>
 <97859bf1-c8c3-7294-8322-b0c9c408ba5e@bell.net>
 <CAK7LNAR_4rVgAQToSoYmbgYnWoSpowcrKi2ciiH9HyhJUGdmWg@mail.gmail.com>
 <CAK7LNAQQ1Vp4YtvU8Bq9aE+NWxnnOTX2dcZ5Gc9fC+vjRmCe4w@mail.gmail.com>
 <CAK7LNATktSBFe=7cE8kHEGx2R90iVV6AJsCfgg5ZD2+ssMmzow@mail.gmail.com>
 <040a0941-936b-87ab-aedd-5a933383b500@bell.net>
 <b919c7fd-babb-5557-dd8d-c2b8bb428d54@bell.net>
 <4fee8886-daa3-fb03-f9e7-89358fb5fc38@bell.net>
 <b9ceba24-345e-20dc-783b-3759a9819359@bell.net>
From:   Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <b9ceba24-345e-20dc-783b-3759a9819359@bell.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 9/14/23 06:22, John David Anglin wrote:
> On 2023-09-13 1:58 p.m., John David Anglin wrote:
>> On 2023-09-12 5:53 p.m., John David Anglin wrote:
>>> On 2023-09-10 5:30 p.m., John David Anglin wrote:
>>>> Hi Masahiro,
>>>>
>>>> The attached change fixed boot at ddb5cdbafaaa 😁
>>>>
>>>> However, v6.5.x boot is still broken:
>>>>
>>>> Run /init as init process
>>>> process '/usr/bin/sh' started with executable stack
>>>> Loading, please wait...
>>>> Starting systemd-udevd version 254.1-3
>>>> e1000 alternatives: applied 0 out of 569 patches
>>>> e1000: Intel(R) PRO/1000 Network Driver
>>>> e1000: Copyright (c) 1999-2006 Intel Corporation.
>>>> scsi_mod alternatives: applied 0 out of 7 patches
>>>> SCSI subsystem initialized
>>>> usbcore alternatives: applied 0 out of 18 patches
>>>> usbcore: registered new interface driver usbfs
>>>> libata alternatives: applied 0 out of 3 patches
>>>> usbcore: registered new interface driver hub
>>>> usbcore: registered new device driver usb
>>>> mptbase alternatives: applied 0 out of 73 patches
>>>> ehci_hcd alternatives: applied 0 out of 114 patches
>>>> sata_sil24 alternatives: applied 0 out of 56 patches
>>>> Fusion MPT base driver 3.04.20
>>>> Copyright (c) 1999-2008 LSI Corporation
>>>> sata_sil24 0000:00:01.0: Applying completion IRQ loss on PCI-X errata fix
>>>> scsi host0: sata_sil24
>>>> scsi host1: sata_sil24
>>>> pata_sil680 0000:60:02.0: sil680: 133MHz clock.
>>>> scsi host2: sata_sil24
>>>> ehci_pci alternatives: applied 0 out of 2 patches
>>>> ohci_hcd alternatives: applied 0 out of 144 patches
>>>> ehci-pci 0000:60:01.2: EHCI Host Controller
>>>> scsi host3: pata_sil680
>>>> ehci-pci 0000:60:01.2: new USB bus registered, assigned bus number 1
>>>> scsi host4: sata_sil24
>>>> ata1: SATA max UDMA/100 host m128@0xffffffff80088000 port 0xffffffff80080000 ir6
>>>> ata2: SATA max UDMA/100 host m128@0xffffffff80088000 port 0xffffffff80082000 ir6
>>>> ata3: SATA max UDMA/100 host m128@0xffffffff80088000 port 0xffffffff80084000 ir6
>>>> ata4: SATA max UDMA/100 host m128@0xffffffff80088000 port 0xffffffff80086000 ir6
>>>> e1000 0000:60:03.0 eth0: (PCI:33MHz:32-bit) 00:11:0a:31:8a:77
>>>> ehci-pci 0000:60:01.2: irq 71, io mem 0xffffffffb00a1000
>>>> scsi host5: pata_sil680
>>>> ata5: PATA max UDMA/133 cmd 0x26058 ctl 0x26064 bmdma 0x26040 irq 72
>>>> ata6: PATA max UDMA/133 cmd 0x26050 ctl 0x26060 bmdma 0x26048 irq 72
>>>> e1000 0000:60:03.0 eth0: Intel(R) PRO/1000 Network Connection
>>>> ehci-pci 0000:60:01.2: USB 2.0 started, EHCI 0.95
>>>> usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 6.05
>>>> usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
>>>> usb usb1: Product: EHCI Host Controller
>>>> usb usb1: Manufacturer: Linux 6.5.2-dirty ehci_hcd
>>>> usb usb1: SerialNumber: 0000:60:01.2
>>>> hub 1-0:1.0: USB hub found
>>>> hub 1-0:1.0: 5 ports detected
>>>> ata1: SATA link down (SStatus 0 SControl 0)
>>>> ata2: SATA link down (SStatus 0 SControl 0)
>>>> ata3: SATA link down (SStatus 0 SControl 0)
>>>> ata4: SATA link up 3.0 Gbps (SStatus 123 SControl 0)
>>>> ata4.00: ATA-10: ST4000VN008-2DR166, SC60, max UDMA/133
>>>> ata4.00: 7814037168 sectors, multi 0: LBA48 NCQ (depth 31/32)
>>>> ata4.00: configured for UDMA/100
>>>> scsi 4:0:0:0: Direct-Access     ATA      ST4000VN008-2DR1 SC60 PQ: 0 ANSI: 5
>>>> ata6.00: ATAPI: HL-DT-STDVD+-RW GSA-H21L, 1.04, max UDMA/44
>>>> scsi 5:0:0:0: CD-ROM            HL-DT-ST DVD+-RW GSA-H21L 1.04 PQ: 0 ANSI: 5
>>>> random: crng init done
>>>> Timed out for waiting the udev queue being empty.
>>>> Begin: Loading essential drivers ... done.
>>>> Begin: Running /scripts/init-premount ... done.
>>>> Begin: Mounting root file system ... Begin: Running /scripts/local-top ... done.
>>>> Begin: Running /scripts/local-premount ... done.
>>>> Timed out for waiting the udev queue being empty.
>>>> Begin: Waiting for root file system ... Begin: Running /scripts/local-block ....
>>>> Begin: Running /scripts/local-block ... done.
>>>> Begin: Running /scripts/local-block ... done.
>>>> Begin: Running /scripts/local-block ... done.
>>>> Begin: Running /scripts/local-block ... done.
>>>> Begin: Running /scripts/local-block ... done.
>>>> Begin: Running /scripts/local-block ... done.
>>>> Begin: Running /scripts/local-block ... done.
>>>> Begin: Running /scripts/local-block ... done.
>>>> Begin: Running /scripts/local-block ... done.
>>>> Begin: Running /scripts/local-block ... done.
>>>> Begin: Running /scripts/local-block ... done.
>>>> Begin: Running /scripts/local-block ... done.
>>>> Begin: Running /scripts/local-block ... done.
>>>> Begin: Running /scripts/local-block ... done.
>>>> Begin: Running /scripts/local-block ... done.
>>>> Begin: Running /scripts/local-block ... done.
>>>> Begin: Running /scripts/local-block ... done.
>>>> Begin: Running /scripts/local-block ... done.
>>>> done.
>>>> Gave up waiting for root file system device.  Common problems:
>>>>  - Boot args (cat /proc/cmdline)
>>>>    - Check rootdelay= (did the system wait long enough?)
>>>>  - Missing modules (cat /proc/modules; ls /dev)
>>>> ALERT!  LABEL=ROOT does not exist.  Dropping to a shell!
>>>> Rebooting automatically due to panic= boot argument
>>>>
>>>> I'll see if I can find the commit that breaks 6.5.
>>> I've traced this to the following merge commit:
>>>
>>> dave@atlas:~/linux/linux$ git bisect good
>>> ca7ce08d6a063e0ccb91dc57f9bc213120d0d1a7 is the first bad commit
>>> commit ca7ce08d6a063e0ccb91dc57f9bc213120d0d1a7
>>> Merge: 1546cd4bfda4 af92c02fb209
>>> Author: Linus Torvalds <torvalds@linux-foundation.org>
>>> Date:   Fri Jun 30 11:57:07 2023 -0700
>>>
>>>     Merge tag 'scsi-misc' of git://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi
>>>
>>>     Pull SCSI updates from James Bottomley:
>>>      "Updates to the usual drivers (ufs, pm80xx, libata-scsi, smartpqi,
>>>       lpfc, qla2xxx).
>>>
>>>       We have a couple of major core changes impacting other systems:
>>>
>>>        - Command Duration Limits, which spills into block and ATA
>>>
>>>        - block level Persistent Reservation Operations, which touches block,
>>>          nvme, target and dm
>>>
>>>       Both of these are added with merge commits containing a cover letter
>>>       explaining what's going on"
>>>
>>>     * tag 'scsi-misc' of git://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi: (187 commits)
>>>       scsi: core: Improve warning message in scsi_device_block()
>>>       scsi: core: Replace scsi_target_block() with scsi_block_targets()
>>>       scsi: core: Don't wait for quiesce in scsi_device_block()
>>>       scsi: core: Don't wait for quiesce in scsi_stop_queue()
>>>       scsi: core: Merge scsi_internal_device_block() and device_block()
>>>       scsi: sg: Increase number of devices
>>>       scsi: bsg: Increase number of devices
>>>       scsi: qla2xxx: Remove unused nvme_ls_waitq wait queue
>>>       scsi: ufs: ufs-pci: Add support for Intel Arrow Lake
>>>       scsi: sd: sd_zbc: Use PAGE_SECTORS_SHIFT
>>>       scsi: ufs: wb: Add explicit flush_threshold sysfs attribute
>>>       scsi: ufs: ufs-qcom: Switch to the new ICE API
>>>       scsi: ufs: dt-bindings: qcom: Add ICE phandle
>>>       scsi: ufs: ufs-mediatek: Set UFSHCD_QUIRK_MCQ_BROKEN_RTC quirk
>>>       scsi: ufs: ufs-mediatek: Set UFSHCD_QUIRK_MCQ_BROKEN_INTR quirk
>>>       scsi: ufs: core: Add host quirk UFSHCD_QUIRK_MCQ_BROKEN_RTC
>>>       scsi: ufs: core: Add host quirk UFSHCD_QUIRK_MCQ_BROKEN_INTR
>>>       scsi: ufs: core: Remove dedicated hwq for dev command
>>>       scsi: ufs: core: mcq: Fix the incorrect OCS value for the device command
>>>       scsi: ufs: dt-bindings: samsung,exynos: Drop unneeded quotes
>>>       ...
>>>
>>> dave@atlas:~/linux/linux$ lspci
>>> 00:01.0 RAID bus controller: Silicon Image, Inc. SiI 3124 PCI-X Serial ATA Controller (rev 02)
>>> 40:01.0 SCSI storage controller: Broadcom / LSI 53c1030 PCI-X Fusion-MPT Dual Ultra320 SCSI (rev 07)
>>> 40:01.1 SCSI storage controller: Broadcom / LSI 53c1030 PCI-X Fusion-MPT Dual Ultra320 SCSI (rev 07)
>>> 60:01.0 USB controller: NEC Corporation OHCI USB Controller (rev 41)
>>> 60:01.1 USB controller: NEC Corporation OHCI USB Controller (rev 41)
>>> 60:01.2 USB controller: NEC Corporation uPD72010x USB 2.0 Controller (rev 02)
>>> 60:02.0 IDE interface: Silicon Image, Inc. PCI0680 Ultra ATA-133 Host Controller (rev 02)
>>> 60:03.0 Ethernet controller: Intel Corporation 82540EM Gigabit Ethernet Controller (rev 02)
>> This was introduced by the following commit:
>>
>> dave@atlas:~/linux/linux$ git bisect good
>> 624885209f31eb9985bf51abe204ecbffe2fdeea is the first bad commit
>> commit 624885209f31eb9985bf51abe204ecbffe2fdeea
>> Author: Damien Le Moal <dlemoal@kernel.org>
>> Date:   Thu May 11 03:13:41 2023 +0200
>>
>>     scsi: core: Detect support for command duration limits
>>
>>     Introduce the function scsi_cdl_check() to detect if a device supports
>>     command duration limits (CDL). Support for the READ 16, WRITE 16, READ 32
>>     and WRITE 32 commands are checked using the function scsi_report_opcode()
>>     to probe the rwcdlp and cdlp bits as they indicate the mode page defining
>>     the command duration limits descriptors that apply to the command being
>>     tested.
>>
>>     If any of these commands support CDL, the field cdl_supported of struct
>>     scsi_device is set to 1 to indicate that the device supports CDL.
>>
>>     Support for CDL for a device is advertizes through sysfs using the new
>>     cdl_supported device attribute. This attribute value is 1 for a device
>>     supporting CDL and 0 otherwise.
>>
>>     Signed-off-by: Damien Le Moal <dlemoal@kernel.org>
>>     Reviewed-by: Hannes Reinecke <hare@suse.de>
>>     Co-developed-by: Niklas Cassel <niklas.cassel@wdc.com>
>>     Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
>>     Link: https://lore.kernel.org/r/20230511011356.227789-9-nks@flawful.org
>>     Signed-off-by: Martin K. Petersen <martin.petersen@oracle.com>
>>
>>  Documentation/ABI/testing/sysfs-block-device |  9 ++++
>>  drivers/scsi/scsi.c                          | 81 ++++++++++++++++++++++++++++
>>  drivers/scsi/scsi_scan.c                     |  3 ++
>>  drivers/scsi/scsi_sysfs.c                    |  2 +
>>  include/scsi/scsi_device.h                   |  3 ++
>>  5 files changed, 98 insertions(+)
>>
>> Sometimes I see when booting a bad commit:
>> [...]
>> Begin: Running /scripts/local-block ... done.
>> Begin: Running /scripts/local-block ... done.
>> Begin: Running /scripts/local-block ... done.
>> done.
>> Gave up waiting for root file system device.  Common problems:
>>  - Boot args (cat /proc/cmdline)
>>    - Check rootdelay= (did the system wait long enough?)
>>  - Missing modules (cat /proc/modules; ls /dev)
>> ALERT!  LABEL=ROOT does not exist.  Dropping to a shell!
>> Rebooting automatically due to panic= boot argument
>> ata4: SATA link down (SStatus 0 SControl 0)
>> ata5: SATA link down (SStatus 0 SControl 0)
>> ata6: SATA link up 3.0 Gbps (SStatus 123 SControl 0)
>> ata6.00: ATA-10: ST4000VN008-2DR166, SC60, max UDMA/133
>> ata6.00: 7814037168 sectors, multi 0: LBA48 NCQ (depth 31/32)
>> ata6.00: configured for UDMA/100
>> scsi 5:0:0:0: Direct-Access     ATA      ST4000VN008-2DR1 SC60 PQ: 0 ANSI: 5
> 
> System boots master at e56b2b605799 if I disable CDL:
> 
> dave@atlas:~/linux/linux$ git diff drivers/scsi/scsi.c
> diff --git a/drivers/scsi/scsi.c b/drivers/scsi/scsi.c
> index d0911bc28663..dc3a283ebd75 100644
> --- a/drivers/scsi/scsi.c
> +++ b/drivers/scsi/scsi.c
> @@ -578,6 +578,8 @@ static bool scsi_cdl_check_cmd(struct scsi_device *sdev, u8 opcode, u16 sa,
>          int ret;
>          u8 cdlp;
> 
> +       return false;
> +
>          /* Check operation code */
>          ret = scsi_report_opcode(sdev, buf, SCSI_CDL_CHECK_BUF_LEN, opcode, sa);
>          if (ret <= 0)

It is weird that this solves anything... the MAINTENANCE_IN command issued by
scsi_report_opcode() ends up being emulated in libata with
ata_scsiop_maint_in(). There are no actual commands issued to the drive, so
nothing that could actually fail/cause issues. By the time this is issued, the
ATA drive is also fully probed...

Or is the drive connected to the Broadcom HBA you have ? In that case, libata is
not used and the HBA FW SAT (scsi-ata-translation) is likely to blame.

Could you send a full dmesg output for a clean boot and for a failed one so that
I can compare ?

-- 
Damien Le Moal
Western Digital Research

