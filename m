Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:55920 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726155AbgDYRBK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 25 Apr 2020 13:01:10 -0400
MIME-Version: 1.0
References: <20200413153542.94064-1-masahiroy@kernel.org>
In-Reply-To: <20200413153542.94064-1-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 26 Apr 2020 02:00:20 +0900
Message-ID: <CAK7LNAS+wPzf6oAEyKQcE4irbw-5CStMTrZgmi0RGS0_8MQbsA@mail.gmail.com>
Subject: Re: [PATCH] kconfig: do not assign a variable in the return statement
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Apr 14, 2020 at 12:35 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> I am not a big fan of doing assignment in a return statement.
> Split it into two lines.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>



Applied to linux-kbuild.

> ---
>
>  scripts/kconfig/menu.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
> index e436ba44c9c5..a5fbd6ccc006 100644
> --- a/scripts/kconfig/menu.c
> +++ b/scripts/kconfig/menu.c
> @@ -65,7 +65,8 @@ void menu_add_entry(struct symbol *sym)
>  struct menu *menu_add_menu(void)
>  {
>         last_entry_ptr = &current_entry->list;
> -       return current_menu = current_entry;
> +       current_menu = current_entry;
> +       return current_menu;
>  }
>
>  void menu_end_menu(void)
> --
> 2.25.1
>


-- 
Best Regards
Masahiro Yamada
