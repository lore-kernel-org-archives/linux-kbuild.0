Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ozlabs.org ([203.11.71.1]:40883 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S964863AbeEJNDO (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 10 May 2018 09:03:14 -0400
From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2 4/5] powerpc/kbuild: Use flags variables rather than overriding LD/CC/AS
In-Reply-To: <20180510051659.15356-5-npiggin@gmail.com>
References: <20180510051659.15356-1-npiggin@gmail.com> <20180510051659.15356-5-npiggin@gmail.com>
Date: Thu, 10 May 2018 23:03:08 +1000
Message-ID: <878t8rzmr7.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicholas Piggin <npiggin@gmail.com>, linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, linuxppc-dev@lists.ozlabs.org

Nicholas Piggin <npiggin@gmail.com> writes:

> The powerpc toolchain can compile combinations of 32/64 bit and
> big/little endian, so it's convenient to consider, e.g.,
>
>   `CC -m64 -mbig-endian`
>
> To be the C compiler for the purpose of invoking it to build target
> artifacts. So overriding the the CC variable to include thse flags
> works for this purpose.
>
> Unfortunately that is not compatible with the way the proposed new
> Kconfig macro language will work.
>
> After previous patches in this series, these flags can be carefully
> passed in using flags instead.
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/Makefile   | 16 +++++++++-------
>  scripts/recordmcount.pl |  8 ++++++++

We should probably at least Cc Rostedt on the recordmcount.pl change.

> diff --git a/scripts/recordmcount.pl b/scripts/recordmcount.pl
> index 191eb949d52c..919711dd9d6c 100755
> --- a/scripts/recordmcount.pl
> +++ b/scripts/recordmcount.pl
> @@ -274,6 +274,14 @@ if ($arch eq "x86_64") {

Despite what the above says you're patching the powerpc entry AFAICS, so
I guess that's pretty harmless.

>      if ($bits == 64) {
>  	$type = ".quad";
>      }
> +    $ld .= " -EB ";
> +    if ($endian eq "big") {
> +	    $cc .= " -mbig-endian ";
> +	    $ld .= " -EB ";

Don't we end up with two "-EB"s for the big endian case?

Or do I understand perl even less than I thought I did?

> +    } else {
> +	    $cc .= " -mlittle-endian ";
> +	    $ld .= " -EL ";
> +    }
>  
>  } elsif ($arch eq "arm") {
>      $alignment = 2;

cheers
