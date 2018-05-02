Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:60660 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751552AbeEBPtV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 May 2018 11:49:21 -0400
Received: from mail-ua0-f177.google.com (mail-ua0-f177.google.com [209.85.217.177]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id w42FnCBt016470
        for <linux-kbuild@vger.kernel.org>; Thu, 3 May 2018 00:49:13 +0900
Received: by mail-ua0-f177.google.com with SMTP id i3so9768950uad.4
        for <linux-kbuild@vger.kernel.org>; Wed, 02 May 2018 08:49:13 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1522430045-31685-1-git-send-email-juro.bystricky@intel.com>
References: <1522430045-31685-1-git-send-email-juro.bystricky@intel.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 3 May 2018 00:48:31 +0900
Message-ID: <CAK7LNAR3D4=7Z+T1odxG2FidWF0KM79MLiLNZNy8KqhcwLagDA@mail.gmail.com>
Subject: Re: [PATCH] modpost: srcversion sometimes incorrect
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Juro Bystricky <juro.bystricky@intel.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Richard Purdie <richard.purdie@linuxfoundation.org>, jurobystricky@hotmail.com

2018-03-31 2:14 GMT+09:00 Juro Bystricky <juro.bystricky@intel.com>:
> "srcversion" field inserted into module modinfo section contains a
> sum of the source files which made it. However, this field can
> be incorrect. Building the same module can end up having inconsistent
> srcversion field eventhough the sources remain the same.
> This can be reproduced by building modules in a deeply nested directory,
> but other factors contribute as well.
>
> The reason for incorrect srcversion is that some source files can be
> simply silently skipped from the checksum calculation due to limited
> buffer space for line parsing.
>
> This patch addresses two issues:
>
> 1. Allocates a larger line buffer (32k vs 4k).
> 2. Issues a warning if a line length exceeds the line buffer.
>
> Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> ---
>  scripts/mod/modpost.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 9917f92..955f26e 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -385,9 +385,10 @@ void *grab_file(const char *filename, unsigned long *size)
>    * spaces in the beginning of the line is trimmed away.
>    * Return a pointer to a static buffer.
>    **/
> +#define MODPOST_MAX_LINE 32768
>  char *get_next_line(unsigned long *pos, void *file, unsigned long size)
>  {
> -       static char line[4096];
> +       static char line[MODPOST_MAX_LINE];
>         int skip = 1;
>         size_t len = 0;
>         signed char *p = (signed char *)file + *pos;
> @@ -402,8 +403,11 @@ char *get_next_line(unsigned long *pos, void *file, unsigned long size)
>                 if (*p != '\n' && (*pos < size)) {
>                         len++;
>                         *s++ = *p++;
> -                       if (len > 4095)
> +                       if (len > (sizeof(line)-1)) {
> +                               warn(" %s: line exceeds buffer size %zu bytes\n"
> +                                    , __func__, sizeof(line));
>                                 break; /* Too long, stop */
> +                       }
>                 } else {
>                         /* End of string */
>                         *s = '\0';
> --
> 2.7.4

The whole of the file content is mapped by grab_file().

I believe the right thing to do is,
to not increase the buffer size,
but to not use such a temporary buffer.




-- 
Best Regards
Masahiro Yamada
