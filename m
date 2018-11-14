Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl1-f193.google.com ([209.85.214.193]:32984 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725791AbeKOFfR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Nov 2018 00:35:17 -0500
Received: by mail-pl1-f193.google.com with SMTP id w22-v6so8259608plk.0
        for <linux-kbuild@vger.kernel.org>; Wed, 14 Nov 2018 11:30:46 -0800 (PST)
From: Paul Walmsley <paul.walmsley@sifive.com>
Date: Wed, 14 Nov 2018 11:30:45 -0800 (PST)
Subject: Re: [PATCH 2/2] modpost: skip ELF local symbols by default during
 section mismatch check
In-Reply-To: <CAK7LNARC2+BLFay_-CtaJXKCu3M0NZzxbeff1XandeH58BbUcg@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.9999.1811141126450.22477@viisi.sifive.com>
References: <20181020131911.22443-1-paul.walmsley@sifive.com> <20181020131911.22443-3-paul.walmsley@sifive.com> <CAK7LNARC2+BLFay_-CtaJXKCu3M0NZzxbeff1XandeH58BbUcg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: paul.walmsley@sifive.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Russell King <linux@armlinux.org.uk>, jimw@sifive.com, Michal Marek <michal.lkml@markovi.net>, Paul Walmsley <paul@pwsan.com>

Hello Masahiro,

On Tue, 13 Nov 2018, Masahiro Yamada wrote:

> Hi Paul,
>
> On Sat, Oct 20, 2018 at 10:21 PM Paul Walmsley <paul.walmsley@sifive.com> wrote:
>>
>> During development of a serial console driver with a RISC-V toolchain,
>> the following modpost warning appeared:
>>
>> ----
>> WARNING: vmlinux.o(.data+0x19b10): Section mismatch in reference from the variable .LANCHOR1 to the function .init.text:sifive_serial_console_setup()
>> The variable .LANCHOR1 references
>> the function __init sifive_serial_console_setup()
>> If the reference is valid then annotate the
>> variable with __init* or __refdata (see linux/init.h) or name the variable:
>> *_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console
>> ----
>
> Could you provide me a little more information to reproduce it?
>
> I tried your dev/paulw/serial-v4.19-rc7,
> but I could not get that warning.
>
> I used risc64-linux-gcc (GCC 7.3, 8.1) from kernel.org

I observed this issue with gcc 8.2:

riscv64-unknown-linux-gnu-gcc (crosstool-NG 1.23.0.534-710c8) 8.2.0

This toolchain was built with mainline crosstool-NG:

https://github.com/crosstool-ng/crosstool-ng

using the "riscv64-unknown-linux-gnu" sample configuration.


- Paul
