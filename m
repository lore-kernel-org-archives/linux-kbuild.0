Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:45510 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732373AbfAPWDn (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 16 Jan 2019 17:03:43 -0500
Subject: Re: [PATCH 01/12] selftests: gpio-mockup-chardev: Check asprintf()
 for error
References: <20190114135144.26096-1-geert+renesas@glider.be>
 <20190114135144.26096-2-geert+renesas@glider.be>
From: shuah <shuah@kernel.org>
Message-ID: <7a3ce526-aefc-c2f1-9b11-215d609952b3@kernel.org>
Date: Wed, 16 Jan 2019 15:03:41 -0700
MIME-Version: 1.0
In-Reply-To: <20190114135144.26096-2-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>
Cc: Jonathan Corbet <corbet@lwn.net>, Bamvor Jian Zhang <bamv2005@gmail.com>, Kees Cook <keescook@chromium.org>, linux-kselftest@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, shuah <shuah@kernel.org>

On 1/14/19 6:51 AM, Geert Uytterhoeven wrote:
> With gcc 7.3.0:
> 
>      gpio-mockup-chardev.c: In function ‘get_debugfs’:
>      gpio-mockup-chardev.c:62:3: warning: ignoring return value of ‘asprintf’, declared with attribute warn_unused_result [-Wunused-result]
>         asprintf(path, "%s/gpio", mnt_fs_get_target(fs));
>         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Handle asprintf() failures to fix this.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>   tools/testing/selftests/gpio/gpio-mockup-chardev.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/testing/selftests/gpio/gpio-mockup-chardev.c b/tools/testing/selftests/gpio/gpio-mockup-chardev.c
> index f8d468f54e986dd0..aaa1e9f083c37215 100644
> --- a/tools/testing/selftests/gpio/gpio-mockup-chardev.c
> +++ b/tools/testing/selftests/gpio/gpio-mockup-chardev.c
> @@ -37,7 +37,7 @@ static int get_debugfs(char **path)
>   	struct libmnt_table *tb;
>   	struct libmnt_iter *itr = NULL;
>   	struct libmnt_fs *fs;
> -	int found = 0;
> +	int found = 0, ret;
>   
>   	cxt = mnt_new_context();
>   	if (!cxt)
> @@ -58,8 +58,11 @@ static int get_debugfs(char **path)
>   			break;
>   		}
>   	}
> -	if (found)
> -		asprintf(path, "%s/gpio", mnt_fs_get_target(fs));
> +	if (found) {
> +		ret = asprintf(path, "%s/gpio", mnt_fs_get_target(fs));
> +		if (ret < 0)
> +			err(EXIT_FAILURE, "failed to format string");
> +	}
>   
>   	mnt_free_iter(itr);
>   	mnt_free_context(cxt);
> 

Thanks for the patch. Applied to linux-kselftest fixes for 5.0-rc4

thanks,
-- Shuah
