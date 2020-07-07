Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725825AbgGGHTz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Jul 2020 03:19:55 -0400
MIME-Version: 1.0
References: <20200707034604.1539157-1-nickrterrell@gmail.com> <20200707034604.1539157-5-nickrterrell@gmail.com>
In-Reply-To: <20200707034604.1539157-5-nickrterrell@gmail.com>
From: Norbert Lange <nolange79@gmail.com>
Date: Tue, 7 Jul 2020 09:19:43 +0200
Message-ID: <CADYdroOfCsGsjid9aSOLoRf9gycc1iLD9JndH8WF+Rg+a5Gu-g@mail.gmail.com>
Subject: Re: [PATCH v6 4/8] init: add support for zstd compressed kernel
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Terrell <nickrterrell@gmail.com>
Cc: Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, linux-kernel <linux-kernel@vger.kernel.org>, Chris Mason <clm@fb.com>, linux-kbuild@vger.kernel.org, x86@kernel.org, gregkh@linuxfoundation.org, Petr Malat <oss@malat.biz>, Kees Cook <keescook@chromium.org>, Kernel Team <Kernel-team@fb.com>, Adam Borowski <kilobyte@angband.pl>, Patrick Williams <patrickw3@fb.com>, rmikey@fb.com, mingo@kernel.org, Patrick Williams <patrick@stwcx.xyz>, Sedat Dilek <sedat.dilek@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Nick Terrell <terrelln@fb.com>

Thanks for the respin.

Am Di., 7. Juli 2020 um 05:51 Uhr schrieb Nick Terrell <nickrterrell@gmail.com>:
>
> From: Nick Terrell <terrelln@fb.com>
>
> * Adds the zstd cmd to scripts/Makefile.lib
> * Adds the HAVE_KERNEL_ZSTD and KERNEL_ZSTD options
>
> Architecture specific support is still needed for decompression.
>
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Tested-by: Sedat Dilek <sedat.dilek@gmail.com>
> Signed-off-by: Nick Terrell <terrelln@fb.com>
> ---
>  init/Kconfig         | 15 ++++++++++++++-
>  scripts/Makefile.lib | 15 +++++++++++++++
>  2 files changed, 29 insertions(+), 1 deletion(-)
>
> diff --git a/init/Kconfig b/init/Kconfig
> index 0498af567f70..8d99f0c5e240 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -191,13 +191,16 @@ config HAVE_KERNEL_LZO
>  config HAVE_KERNEL_LZ4
>         bool
>
> +config HAVE_KERNEL_ZSTD
> +       bool
> +
>  config HAVE_KERNEL_UNCOMPRESSED
>         bool
>
>  choice
>         prompt "Kernel compression mode"
>         default KERNEL_GZIP
> -       depends on HAVE_KERNEL_GZIP || HAVE_KERNEL_BZIP2 || HAVE_KERNEL_LZMA || HAVE_KERNEL_XZ || HAVE_KERNEL_LZO || HAVE_KERNEL_LZ4 || HAVE_KERNEL_UNCOMPRESSED
> +       depends on HAVE_KERNEL_GZIP || HAVE_KERNEL_BZIP2 || HAVE_KERNEL_LZMA || HAVE_KERNEL_XZ || HAVE_KERNEL_LZO || HAVE_KERNEL_LZ4 || HAVE_KERNEL_ZSTD || HAVE_KERNEL_UNCOMPRESSED
>         help
>           The linux kernel is a kind of self-extracting executable.
>           Several compression algorithms are available, which differ
> @@ -276,6 +279,16 @@ config KERNEL_LZ4
>           is about 8% bigger than LZO. But the decompression speed is
>           faster than LZO.
>
> +config KERNEL_ZSTD
> +       bool "ZSTD"
> +       depends on HAVE_KERNEL_ZSTD
> +       help
> +         ZSTD is a compression algorithm targeting intermediate compression
> +         with fast decompression speed. It will compress better than GZIP and
> +         decompress around the same speed as LZO, but slower than LZ4. You
> +         will need at least 192 KB RAM or more for booting. The zstd command
> +         line tools is required for compression.
> +
>  config KERNEL_UNCOMPRESSED
>         bool "None"
>         depends on HAVE_KERNEL_UNCOMPRESSED
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 916b2f7f7098..d960f8815f87 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -413,6 +413,21 @@ quiet_cmd_xzkern = XZKERN  $@
>  quiet_cmd_xzmisc = XZMISC  $@
>        cmd_xzmisc = cat $(real-prereqs) | $(XZ) --check=crc32 --lzma2=dict=1MiB > $@
>
> +# ZSTD
> +# ---------------------------------------------------------------------------
> +# Appends the uncompressed size of the data using size_append. The .zst
> +# format has the size information available at the beginning of the file too,
> +# but it's in a more complex format and it's good to avoid changing the part
> +# of the boot code that reads the uncompressed size.
> +# Note that the bytes added by size_append will make the zstd tool think that
> +# the file is corrupt. This is expected.
> +
> +quiet_cmd_zstd = ZSTD    $@
> +cmd_zstd = (cat $(filter-out FORCE,$^) | \
> +       zstd -19 && \
> +        $(call size_append, $(filter-out FORCE,$^))) > $@ || \
> +       (rm -f $@ ; false)

Is there any reason not to use '--ultra -22' ?
As far as I understand the other patches, the decompression should be
able to handle it,
and in terms of time required for a kernel build the difference is
insignificant.

And would it be better to run zstd on a prepared file instead of
stream enconding?
windowsize would be adjusted to min(windowsize, filesize) for one.

Regards, Norbert
