Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:36599 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727118AbfEMCcN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 12 May 2019 22:32:13 -0400
MIME-Version: 1.0
References: <1557507361-7418-1-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1557507361-7418-1-git-send-email-yamada.masahiro@socionext.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 13 May 2019 11:31:21 +0900
Message-ID: <CAK7LNATXs4Cr_2zwX08dd7xE84JaG6K6LF3YXA1=aFNVYji2Ew@mail.gmail.com>
Subject: Re: [PATCH] kconfig: make parent directories for the saved .config as needed
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Sat, May 11, 2019 at 1:56 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> With menuconfig / nconfig, users can input any file path from the
> "Save" menu, but it fails if the parent directory does not exist.
>
> Why not create the parent directory automatically. I think this is
> a user-friendly behavior.
>
> I changed the error messages in menuconfig / nconfig.
>
> "Nonexistent directory" is no longer the most likely reason of the
> failure. Perhaps, the user specified the existing directory, or
> attempted to write to the location without write permission.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Applied to linux-kbuild.


>  scripts/kconfig/confdata.c | 3 +++
>  scripts/kconfig/mconf.c    | 2 +-
>  scripts/kconfig/nconf.c    | 3 +--
>  3 files changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
> index 431b805..b7bdd96 100644
> --- a/scripts/kconfig/confdata.c
> +++ b/scripts/kconfig/confdata.c
> @@ -881,6 +881,9 @@ int conf_write(const char *name)
>                 return -1;
>         }
>
> +       if (make_parent_dir(name))
> +               return -1;
> +
>         env = getenv("KCONFIG_OVERWRITECONFIG");
>         if (env && *env) {
>                 *tmpname = 0;
> diff --git a/scripts/kconfig/mconf.c b/scripts/kconfig/mconf.c
> index 5f8c82a..694091f 100644
> --- a/scripts/kconfig/mconf.c
> +++ b/scripts/kconfig/mconf.c
> @@ -936,7 +936,7 @@ static void conf_save(void)
>                                 set_config_filename(dialog_input_result);
>                                 return;
>                         }
> -                       show_textbox(NULL, "Can't create file!  Probably a nonexistent directory.", 5, 60);
> +                       show_textbox(NULL, "Can't create file!", 5, 60);
>                         break;
>                 case 1:
>                         show_helptext("Save Alternate Configuration", save_config_help);
> diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
> index ac92c0d..cbafe3b 100644
> --- a/scripts/kconfig/nconf.c
> +++ b/scripts/kconfig/nconf.c
> @@ -1438,8 +1438,7 @@ static void conf_save(void)
>                                 set_config_filename(dialog_input_result);
>                                 return;
>                         }
> -                       btn_dialog(main_window, "Can't create file! "
> -                               "Probably a nonexistent directory.",
> +                       btn_dialog(main_window, "Can't create file!",
>                                 1, "<OK>");
>                         break;
>                 case 1:
> --
> 2.7.4
>


-- 
Best Regards
Masahiro Yamada
