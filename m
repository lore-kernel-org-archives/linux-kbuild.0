Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:19989 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731586AbgGAPXQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 1 Jul 2020 11:23:16 -0400
MIME-Version: 1.0
References: <3f61abe3ae457bb5b61fb217394bbb9590ca17ef.1593499731.git.mchehab+huawei@kernel.org>
In-Reply-To: <3f61abe3ae457bb5b61fb217394bbb9590ca17ef.1593499731.git.mchehab+huawei@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 2 Jul 2020 00:22:23 +0900
Message-ID: <CAK7LNATkdfnFYGaKBr1-CFath=btDW8uudeWfq0GWE5JMX5Aog@mail.gmail.com>
Subject: Re: [PATCH] kconfig: qconf: parse newer types at debug info
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Jun 30, 2020 at 3:49 PM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> There are 3 types that are not parsed by the debug info logic.
> Add support for them.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---


Applied to linux-kbuild.


>  scripts/kconfig/qconf.cc | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
> index fd721c6c4c94..4a616128a154 100644
> --- a/scripts/kconfig/qconf.cc
> +++ b/scripts/kconfig/qconf.cc
> @@ -1154,6 +1154,9 @@ QString ConfigInfoView::debug_info(struct symbol *sym)
>                 case P_DEFAULT:
>                 case P_SELECT:
>                 case P_RANGE:
> +               case P_COMMENT:
> +               case P_IMPLY:
> +               case P_SYMBOL:
>                         debug += prop_get_type_name(prop->type);
>                         debug += ": ";
>                         expr_print(prop->expr, expr_print_help, &debug, E_NONE);
> --
> 2.26.2
>


-- 
Best Regards
Masahiro Yamada
