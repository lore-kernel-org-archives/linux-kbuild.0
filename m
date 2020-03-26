Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr1-f67.google.com ([209.85.221.67]:36391 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727670AbgCZPku (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Mar 2020 11:40:50 -0400
Received: by mail-wr1-f67.google.com with SMTP id 31so8378829wrs.3
        for <linux-kbuild@vger.kernel.org>; Thu, 26 Mar 2020 08:40:49 -0700 (PDT)
Date: Thu, 26 Mar 2020 16:40:38 +0100
From: Petr Malat <oss@malat.biz>
Subject: Re: [PATCH v3 1/8] lib: prepare zstd for preboot environment
Message-ID: <20200326154038.GA21231@ntb.petris.klfree.czf>
References: <20200325195849.407900-1-nickrterrell@gmail.com>
 <20200325195849.407900-2-nickrterrell@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200325195849.407900-2-nickrterrell@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Terrell <nickrterrell@gmail.com>
Cc: Nick Terrell <terrelln@fb.com>, linux-kernel@vger.kernel.org, Chris Mason <clm@fb.com>, linux-kbuild@vger.kernel.org, x86@kernel.org, gregkh@linuxfoundation.org, Kees Cook <keescook@chromium.org>, Kernel Team <Kernel-team@fb.com>, Adam Borowski <kilobyte@angband.pl>, Patrick Williams <patrickw3@fb.com>, rmikey@fb.com, mingo@kernel.org, Patrick Williams <patrick@stwcx.xyz>

Hi Nick,
I finally got some time to review your patch, here are my comments:

On Wed, Mar 25, 2020 at 12:58:42PM -0700, Nick Terrell wrote:
> * Don't export symbols if ZSTD_PREBOOT is defined.
I'm not sure if this is needed. When I worked on my patch, I have found that
all exporting and modinfo macros generate symbols in modinfo and discard.ksym
sections, which are then dropped by the vmlinux linker script, thus one
will get the same binary independently if he puts this change in or not.

I'm not sure if this is intentional as there is also __DISABLE_EXPORTS define,
which should be used by a decompressor (according to comments in export.h).

> * Remove a double definition of the CHECK_F macro when the zstd
>   library is amalgamated.
> * Switch ZSTD_copy8() to __builtin_memcpy(), because in the preboot
>   environment on x86 gcc can't inline `memcpy()` otherwise.
> * Limit the gcc hack in ZSTD_wildcopy() to the broken gcc version. See
>   https://gcc.gnu.org/bugzilla/show_bug.cgi?id=81388.
No comments to the rest.
  Petr
