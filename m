Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:40602 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731182AbgCaQMd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 31 Mar 2020 12:12:33 -0400
MIME-Version: 1.0
References: <20200330180711.14393-1-skhan@linuxfoundation.org>
In-Reply-To: <20200330180711.14393-1-skhan@linuxfoundation.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 1 Apr 2020 01:11:39 +0900
Message-ID: <CAK7LNARyVVNo8Ck4=s_bkwfxuFXj7MUFr2E_f-oOZEkjgm5Bmg@mail.gmail.com>
Subject: Re: [PATCH] Makefile: Update kselftest help information
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>

On Tue, Mar 31, 2020 at 3:07 AM Shuah Khan <skhan@linuxfoundation.org> wrote:
>
> Update kselftest help information.
>
> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
> ---
>  Makefile | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index e56bf7ef182d..5e5c770423c7 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1470,12 +1470,15 @@ help:
>         @echo  '  nsdeps          - Generate missing symbol namespace dependencies'
>         @echo  ''
>         @echo  'Kernel selftest:'
> -       @echo  '  kselftest       - Build and run kernel selftest (run as root)'
> -       @echo  '                    Build, install, and boot kernel before'
> -       @echo  '                    running kselftest on it'
> -       @echo  '  kselftest-clean - Remove all generated kselftest files'
> -       @echo  '  kselftest-merge - Merge all the config dependencies of kselftest to existing'
> -       @echo  '                    .config.'
> +       @echo  '  kselftest         - Build and run kernel selftest'
> +       @echo  '                      Build, install, and boot kernel before'
> +       @echo  '                      running kselftest on it'
> +       @echo  '                      Run as root for full coverage'
> +       @echo  '  kselftest-all     - Build kernel selftest'
> +       @echo  '  kselftest-install - Build and install kernel selftest'
> +       @echo  '  kselftest-clean   - Remove all generated kselftest files'
> +       @echo  '  kselftest-merge   - Merge all the config dependencies of'
> +       @echo  '                      kselftest to existing .config.'
>         @echo  ''
>         @$(if $(dtstree), \
>                 echo 'Devicetree:'; \
> --
> 2.20.1
>


Applied to linux-kbuild. Thanks.

But, if we have more entries in the future,
we might want to consider to move these
to tools/testing/selftests/Makefile.



-- 
Best Regards
Masahiro Yamada
