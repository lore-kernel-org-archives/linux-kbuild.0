Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from frisell.zx2c4.com ([192.95.5.64]:54792 "EHLO frisell.zx2c4.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751556AbbGMWml (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 13 Jul 2015 18:42:41 -0400
MIME-Version: 1.0
In-Reply-To: <1436293567-20226-1-git-send-email-Jason@zx2c4.com>
References: <1436293567-20226-1-git-send-email-Jason@zx2c4.com>
Date: Tue, 14 Jul 2015 00:42:38 +0200
Message-ID: <CAHmME9r3dEyAhduT6_+z8wVW0Q4J7ivPcPVsAWm31urGuQV8TA@mail.gmail.com>
Subject: Re: [PATCH] Makefile: Force gzip and xz on module install
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Bump? This should be trivial to merge, and it fixes a really annoying
bug for module development.

On Tue, Jul 7, 2015 at 8:26 PM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> Running `make modules_install` ordinarily will overwrite existing
> modules. This is the desired behavior, and is how pretty much every
> other `make install` target works.
>
> However, if CONFIG_MODULE_COMPRESS is enabled, modules are passed
> through gzip and xz which then do the file writing. Both gzip and xz
> will error out if the file already exists, unless -f is passed.
>
> This patch adds -f so that the behavior is uniform.
>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>  Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 6c6f146..5d2ec1c 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -849,10 +849,10 @@ export mod_strip_cmd
>  mod_compress_cmd = true
>  ifdef CONFIG_MODULE_COMPRESS
>    ifdef CONFIG_MODULE_COMPRESS_GZIP
> -    mod_compress_cmd = gzip -n
> +    mod_compress_cmd = gzip -n -f
>    endif # CONFIG_MODULE_COMPRESS_GZIP
>    ifdef CONFIG_MODULE_COMPRESS_XZ
> -    mod_compress_cmd = xz
> +    mod_compress_cmd = xz -f
>    endif # CONFIG_MODULE_COMPRESS_XZ
>  endif # CONFIG_MODULE_COMPRESS
>  export mod_compress_cmd
> --
> 2.4.2
>
