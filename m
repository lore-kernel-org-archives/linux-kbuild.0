Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qk0-f180.google.com ([209.85.220.180]:32899 "EHLO
	mail-qk0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754148AbbDIAA3 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 8 Apr 2015 20:00:29 -0400
MIME-Version: 1.0
In-Reply-To: <1428537385-15089-1-git-send-email-gregory.0xf0@gmail.com>
References: <1428537385-15089-1-git-send-email-gregory.0xf0@gmail.com>
From: Gregory Fong <gregory.0xf0@gmail.com>
Date: Wed, 8 Apr 2015 16:59:58 -0700
Message-ID: <CADtm3G5z-r6MVpT1iBt7MoFPv=i+Te9Z99YDL5Y8fQDya1KpTQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] kconfig: Print full defined and depends for
 multiply-defined symbols
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Gregory Fong <gregory.0xf0@gmail.com>, "open list:KCONFIG" <linux-kbuild@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>

I accidentally marked this as patch 1/2, but this is the only patch.
Sorry for the confusion.

On Wed, Apr 8, 2015 at 4:56 PM, Gregory Fong <gregory.0xf0@gmail.com> wrote:
> get_symbol_str() was assuming that symbols would only have a single
> property for the purpose of printing define and depends information.
> This is not true, and one current example is FRAME_POINTER which is
> both in lib/Kconfig.debug and arch/arm/Kconfig.debug.
>
> In order to print out the correct Defined and Depends info, iterate
> over all properties associated with the given symbol, similarly to was
> done for selects.  And for depends, rather than iterating over the
> property, just use the direct dependency expression.
>
> CONFIG_FRAME_POINTER text, before:
>   Defined at lib/Kconfig.debug:323
>   Depends on: DEBUG_KERNEL [=y] && (ARM [=y] || CRIS || M68K || FRV || UML || AVR32 || SUPERH || BLACKFIN || MN10300 || METAG) || ARCH_WANT_FRAME_POINTERS [=n]
>
> After:
>   Defined at lib/Kconfig.debug:323, arch/arm/Kconfig.debug:35
>   Depends on: DEBUG_KERNEL [=y] && (ARM [=y] || CRIS || M68K || FRV || UML || AVR32 || SUPERH || BLACKFIN || MN10300 || METAG) || ARCH_WANT_FRAME_POINTERS [=n] || !THUMB2_KERNEL [=n]
>
> Removes now-unused function get_symbol_prop().
>
> Signed-off-by: Gregory Fong <gregory.0xf0@gmail.com>
> [snip]
