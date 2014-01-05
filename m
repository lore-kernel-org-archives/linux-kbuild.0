Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.active-venture.com ([67.228.131.205]:56143 "EHLO
	mail.active-venture.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751335AbaAES5Y (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 5 Jan 2014 13:57:24 -0500
Message-ID: <52C9AB14.8060603@roeck-us.net>
Date: Sun, 05 Jan 2014 10:57:24 -0800
From: Guenter Roeck <linux@roeck-us.net>
MIME-Version: 1.0
Subject: Re: [PATCH] isdn: Build telespci and hfc_pci only for little endian
 CPUs
References: <1388944204-13008-1-git-send-email-linux@roeck-us.net> <CAMuHMdVfr0ExtrU7bNUttJwkMXv-ZRo0A=j3gJ-=9nakP0uP+g@mail.gmail.com>
In-Reply-To: <CAMuHMdVfr0ExtrU7bNUttJwkMXv-ZRo0A=j3gJ-=9nakP0uP+g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Karsten Keil <isdn@linux-pingi.de>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

On 01/05/2014 10:30 AM, Geert Uytterhoeven wrote:
> On Sun, Jan 5, 2014 at 6:50 PM, Guenter Roeck <linux@roeck-us.net> wrote:
>> -       depends on PCI && (BROKEN || !(SPARC || PPC || PARISC || M68K || (MIPS && !CPU_LITTLE_ENDIAN) || FRV || (XTENSA && !CPU_LITTLE_ENDIAN)))
>> +       depends on CPU_LITTLE_ENDIAN && PCI && (BROKEN || !(SPARC || PPC || PARISC || M68K || MIPS || FRV || XTENSA))
>
> Unfortunately CPU_LITTLE_ENDIAN is only available on architectures
> that support two endiannesses. So the above will preclude e.g. x86, which is
> where most ISDN users are.
>
> One solution is to move CPU_LITTLE_ENDIAN and CPU_BIG_ENDIAN to the
> common Kconfig parts. After that, the dependency above can just become
>
>      depends on CPU_LITTLE_ENDIAN && PCI.
>

Excellent idea, but more invasive than I want to get into. I'll mark the build for the drivers
as broken for big endian ARM machines instead. The cleanup you suggested can then go in as
separate patch (if wanted).

Thanks,
Guenter

