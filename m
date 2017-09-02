Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:20187 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751681AbdIBHcf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 2 Sep 2017 03:32:35 -0400
Received: from mail-yw0-f179.google.com (mail-yw0-f179.google.com [209.85.161.179]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id v827WPbB008670
        for <linux-kbuild@vger.kernel.org>; Sat, 2 Sep 2017 16:32:25 +0900
Received: by mail-yw0-f179.google.com with SMTP id c85so3404929ywa.0
        for <linux-kbuild@vger.kernel.org>; Sat, 02 Sep 2017 00:32:25 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170818222052.22375-3-nicolasporcel06@gmail.com>
References: <20170818222052.22375-1-nicolasporcel06@gmail.com> <20170818222052.22375-3-nicolasporcel06@gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 2 Sep 2017 16:31:44 +0900
Message-ID: <CAK7LNAQWFKFcm2PbOc-wc2bP1YmKBObhyyWr51mw6MCZRzVGOQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] kconfig: support out of tree KCONFIG_CONFIG
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Porcel <nicolasporcel06@gmail.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

2017-08-19 7:20 GMT+09:00 Nicolas Porcel <nicolasporcel06@gmail.com>:
> If KCONFIG_CONFIG is on a different file system than the kernel source,
> oldconfig/defconfig will fail due to the use of rename in conf_write. It
> will also fail if the kernel source directory is not writable.

If the kernel source is not writable, O= should be used.


> This patch changes the behavior of conf_write to be more intuitive.
>
> When no argument is passed to conf_write, KCONFIG_CONFIG is used instead
> for the config path. The consequence is that the .tmpconfig.%(pid) is
> written in the same directory as KCONFIG_CONFIG.
>
> Some defaulting logic has been added, allowing the use of a directory
> for KCONFIG_CONFIG. In that case, the .config file will be written in
> this directory.



I think KCONFIG_CONFIG only contains a file name
and this restriction is intentional
because conf_write() might be called with a directory path (for
example from gconf.c)


If we change the behavior,
I think conf_write() should just error-out
when directory path is given.



> Signed-off-by: Nicolas Porcel <nicolasporcel06@gmail.com>
> ---
>  scripts/kconfig/confdata.c | 35 ++++++++++++++++++++---------------
>  1 file changed, 20 insertions(+), 15 deletions(-)
>
> diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
> index 297b079ae4d9..3c2b7155a385 100644
> --- a/scripts/kconfig/confdata.c
> +++ b/scripts/kconfig/confdata.c
> @@ -743,32 +743,37 @@ int conf_write(const char *name)
>         FILE *out;
>         struct symbol *sym;
>         struct menu *menu;
> +       struct stat st;
>         const char *basename;
>         const char *str;
>         char dirname[PATH_MAX+1], tmpname[PATH_MAX+1], newname[PATH_MAX+1];
>         char *env;
> +       char *slash;
> +
> +       const char *configname = conf_get_configname();
>
>         dirname[0] = 0;
> -       if (name && name[0]) {
> -               struct stat st;
> -               char *slash;
> -
> -               if (!stat(name, &st) && S_ISDIR(st.st_mode)) {
> -                       strcpy(dirname, name);
> -                       strcat(dirname, "/");
> -                       basename = conf_get_configname();
> -               } else if ((slash = strrchr(name, '/'))) {
> +       if (!name || !name[0])
> +               name = configname;
> +
> +       if (!stat(name, &st) && S_ISDIR(st.st_mode)) {
> +               strcpy(dirname, name);
> +               strcat(dirname, "/");
> +               if (name == configname || strchr(configname, '/'))
> +                       basename =  ".config";


Hmm, I think the intention of conf_get_configname() is
to avoid the bare use of ".config"






-- 
Best Regards
Masahiro Yamada
