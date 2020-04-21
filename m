Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:49485 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725870AbgDURhy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 21 Apr 2020 13:37:54 -0400
MIME-Version: 1.0
References: <20200229003731.2728-1-robh@kernel.org> <20200421100749.GA5429@pendragon.ideasonboard.com>
 <CAK7LNARvPytUQoncngLe=s-TzQByQCXd64H99UgrW40=X34JyQ@mail.gmail.com>
 <20200421110537.GC5983@pendragon.ideasonboard.com> <CAK7LNAQtfyqfbQx2ivg=sVdhxDH9ShVBa+bL-4sC7MU1N=y+cw@mail.gmail.com>
 <20200421134654.GD5983@pendragon.ideasonboard.com>
In-Reply-To: <20200421134654.GD5983@pendragon.ideasonboard.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 22 Apr 2020 02:36:36 +0900
Message-ID: <CAK7LNARcL5tfwFWE=EbW6pnpJKwfQY5n93WmFD0Ggw+EkSJ8mg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] kbuild: Always validate DT binding examples
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Rob Herring <robh@kernel.org>, DTML <devicetree@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi Laurent,

On Tue, Apr 21, 2020 at 10:47 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:

>   HOSTLD  scripts/dtc/dtc
>   CHKDT   Documentation/devicetree/bindings/arm/psci.yaml
> make[2]: execvp: /bin/sh: Argument list too long
> make[2]: *** [/home/laurent/src/kernel/this_is_a_long_directory_name/linux/Documentation/devicetree/bindings/Makefile:38: Documentation/devicetree/bindings/processed-schema-examples.yaml] Error 127
> make[1]: *** [/home/laurent/src/kernel/this_is_a_long_directory_name/linux/Makefile:1300: dt_binding_check] Error 2
> make[1]: Leaving directory '/home/laurent/src/kernel/this_is_a_long_directory_name/linux/output/x86'
> make: *** [Makefile:180: sub-make] Error 2
>
> It seems to only fail with out of tree builds (O=...). I expect that
> failures will become more common the more YAML bindings we have, even
> without long directory names.

Indeed. This will be a common problem sooner or later.

Rob already suggested a solution.


Another way is to use a pipe.

See the following code in scripts/Makefile.modpost


# Read out modules.order instead of expanding $(modules) to pass in modpost.
# Otherwise, allmodconfig would fail with "Argument list too long".
quiet_cmd_modpost = MODPOST $(words $(modules)) modules
      cmd_modpost = sed 's/ko$$/o/' $(MODORDER) | $(MODPOST)


The same issue happens for modpost
because allmodconfig floods the command line.


-- 
Best Regards
Masahiro Yamada
