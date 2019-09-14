Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg1-f193.google.com ([209.85.215.193]:34526 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727570AbfINT1q (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 14 Sep 2019 15:27:46 -0400
Received: by mail-pg1-f193.google.com with SMTP id n9so17057329pgc.1
        for <linux-kbuild@vger.kernel.org>; Sat, 14 Sep 2019 12:27:45 -0700 (PDT)
Date: Sat, 14 Sep 2019 12:27:44 -0700 (PDT)
Subject: RE: [RFC] buildtar: add case for riscv architecture
In-Reply-To: <MN2PR04MB60613FADCF3482C14F29F4558DB20@MN2PR04MB6061.namprd04.prod.outlook.com>
From: Palmer Dabbelt <palmer@sifive.com>
Message-ID: <mhng-4e30fb12-057c-425c-a867-ecf93e080ed9@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Anup Patel <Anup.Patel@wdc.com>
Cc: mail@aurabindo.in, Troy Benjegerdes <troy.benjegerdes@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

On Sat, 14 Sep 2019 06:05:59 PDT (-0700), Anup Patel wrote:
> 
> 
>> -----Original Message-----
>> From: linux-kernel-owner@vger.kernel.org <linux-kernel-
>> owner@vger.kernel.org> On Behalf Of Palmer Dabbelt
>> Sent: Saturday, September 14, 2019 6:30 PM
>> To: mail@aurabindo.in
>> Cc: Troy Benjegerdes <troy.benjegerdes@sifive.com>; Paul Walmsley
>> <paul.walmsley@sifive.com>; aou@eecs.berkeley.edu; linux-
>> riscv@lists.infradead.org; linux-kernel@vger.kernel.org; linux-
>> kbuild@vger.kernel.org
>> Subject: Re: [RFC] buildtar: add case for riscv architecture
>> 
>> On Wed, 11 Sep 2019 05:54:07 PDT (-0700), mail@aurabindo.in wrote:
>> >
>> >
>> >> None of the available RiscV platforms that I’m aware of use compressed
>> images, unless there are some new bootloaders I haven’t seen yet.
>> >>
>> >
>> > I noticed that default build image is Image.gz, which is why I thought its a
>> good idea to copy it into the tarball. Does such a copy not make sense at this
>> point ?
>> 
>> Image.gz can't be booted directly: it's just Image that's been compressed
>> with the standard gzip command.  A bootloader would have to decompress
>> that image before loading it into memory, which requires extra bootloader
>> support.
>> Contrast that with the zImage style images (which are vmlinuz on x86), which
>> are self-extracting and therefor require no bootloader support.  The
>> examples for u-boot all use the "booti" command, which expects
>> uncompressed images.
>> Poking around I couldn't figure out a way to have u-boot decompress the
>> images, but that applies to arm64 as well so I'm not sure if I'm missing
>> something.
>> 
>> If I was doing this, I'd copy over arch/riscv/boot/Image and call it
>> "/boot/image-${KERNELRELEASE}", as calling it vmlinuz is a bit confusing to
>> me because I'd expect vmlinuz to be a self-extracting compressed
>> executable and not a raw gzip file.
> 
> On the contrary, it is indeed possible to boot Image.gz directly using
> U-Boot booti command so this patch would be useful.
> 
> Atish had got it working on U-Boot but he has deferred booti Image.gz
> support due to few more dependent changes. May be he can share
> more info.

Oh, great.  I guess it makes sense to just put both in the tarball, then, as 
users will still need to use the Image format for now.

> 
> Regards,
> Anup
