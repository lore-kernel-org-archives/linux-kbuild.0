Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf1-f195.google.com ([209.85.210.195]:36669 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387462AbfINM75 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 14 Sep 2019 08:59:57 -0400
Received: by mail-pf1-f195.google.com with SMTP id y22so19799014pfr.3
        for <linux-kbuild@vger.kernel.org>; Sat, 14 Sep 2019 05:59:57 -0700 (PDT)
Date: Sat, 14 Sep 2019 05:59:55 -0700 (PDT)
Subject: Re: [RFC] buildtar: add case for riscv architecture
In-Reply-To: <X9f9LozkDQUeBwasTsPlPseP6ZT5yJHNY2GcIgoAgNQJPuFAyYimnDXTJUqxfrZ64GOIl5-uPh07NZnD1pi4uWhCpZvbu9khOW6rEq5P4jU=@aurabindo.in>
From: Palmer Dabbelt <palmer@sifive.com>
Message-ID: <mhng-ed262582-dc00-41fe-9be5-2487297f2432@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mail@aurabindo.in
Cc: Troy Benjegerdes <troy.benjegerdes@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

On Wed, 11 Sep 2019 05:54:07 PDT (-0700), mail@aurabindo.in wrote:
>
>
>> None of the available RiscV platforms that I’m aware of use compressed images, unless there are some new bootloaders I haven’t seen yet.
>>
>
> I noticed that default build image is Image.gz, which is why I thought its a good idea to copy it into the tarball. Does such a copy not make sense at this point ?

Image.gz can't be booted directly: it's just Image that's been compressed with 
the standard gzip command.  A bootloader would have to decompress that image 
before loading it into memory, which requires extra bootloader support.  
Contrast that with the zImage style images (which are vmlinuz on x86), which 
are self-extracting and therefor require no bootloader support.  The examples 
for u-boot all use the "booti" command, which expects uncompressed images.  
Poking around I couldn't figure out a way to have u-boot decompress the images, 
but that applies to arm64 as well so I'm not sure if I'm missing something.

If I was doing this, I'd copy over arch/riscv/boot/Image and call it 
"/boot/image-${KERNELRELEASE}", as calling it vmlinuz is a bit confusing to me 
because I'd expect vmlinuz to be a self-extracting compressed executable and 
not a raw gzip file.
