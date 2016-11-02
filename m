Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.skyhub.de ([78.46.96.112]:50398 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753174AbcKBTzg (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 Nov 2016 15:55:36 -0400
Date: Wed, 2 Nov 2016 20:55:32 +0100
From: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH 1/2] Documentation/HOWTO: Use a more recent gcc + binutils
Message-ID: <20161102195531.26534fn2at36hdy6@pd.tnic>
References: <20161102172058.13641-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20161102172058.13641-1-bigeasy@linutronix.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, Sven Joachim <svenjoac@gmx.de>, Tomas Janousek <tomi@nomi.cz>, Joe Perches <joe@perches.com>, Adam Borowski <kilobyte@angband.pl>, Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, ben@decadent.org.uk, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, "H. Peter Anvin" <hpa@zytor.com>

On Wed, Nov 02, 2016 at 06:20:57PM +0100, Sebastian Andrzej Siewior wrote:
> Etch (with gcc v4.1.2) gets to compile the kernel without plenty of
> warnings and it also chokes on Wno-override-init but that one could be
> easily fixed if we want to keep v4.1 as the minimum.
> So I think raising the bar to gcc v4.1 isn't that bad given that the
> last release of gcc 4.1 was on February 13, 2007.

You'd need to adjust

#if GCC_VERSION < 30200

in include/linux/compiler-gcc.h.

> 
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>  Documentation/Changes | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/Changes b/Documentation/Changes
> index 22797a15dc24..14e65b445707 100644
> --- a/Documentation/Changes
> +++ b/Documentation/Changes
> @@ -29,9 +29,9 @@ you probably needn't concern yourself with isdn4k-utils.
>  ====================== ===============  ========================================
>          Program        Minimal version       Command to check the version
>  ====================== ===============  ========================================
> -GNU C                  3.2              gcc --version
> +GNU C                  4.1              gcc --version
>  GNU make               3.80             make --version
> -binutils               2.12             ld -v
> +binutils               2.17             ld -v

That probably would be a good thing as 2.16 is the Binutils Version from
Hell.

-- 
Regards/Gruss,
    Boris.

ECO tip #101: Trim your mails when you reply.
