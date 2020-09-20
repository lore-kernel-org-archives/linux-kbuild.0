Return-Path: <SRS0=pYaD=C5=vger.kernel.org=linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CBE0C43463
	for <linux-kbuild@archiver.kernel.org>; Sun, 20 Sep 2020 03:43:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2048E21531
	for <linux-kbuild@archiver.kernel.org>; Sun, 20 Sep 2020 03:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600573424;
	bh=gCra25U5rSXL9tLqwLoTd+kUHPvAPG3vF/l+O2IvKZg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=pTAD/NlJCtA5iTIN3xDZo1q982Uv2FeQNclADJsroMYi9PT59/0PNzDx1wtv4LrSe
	 F4AR9sU+cYPKl0ukZ7Mzc8Kj0QgqyymT03f/aI/KJvR5gi9BumORtacb9gkzOWpfnn
	 4lqXZKWerqHcz7vqiWyyjHdnvHG4vVQ4UYhjWcVg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726886AbgITDnn (ORCPT
        <rfc822;linux-kbuild@archiver.kernel.org>);
        Sat, 19 Sep 2020 23:43:43 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:28693 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726885AbgITDnn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 19 Sep 2020 23:43:43 -0400
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 08K3hSUU026169;
        Sun, 20 Sep 2020 12:43:29 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 08K3hSUU026169
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1600573409;
        bh=NthGsbldEtAMwHyc0s+2D6ye20kfWkbW0LDJXWSvK+c=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=iKUZu9un/0Kk4YALw8V457qNCyJhrjVJTVguijeQJZU7nIN9F3owfVRCKzOuDezz+
         1gwyzMQqQKGw+ExXVbJkpXhyB99VvN8ZmqHnCS+7I5tVIW+OjaytNK8aF4uXZ/vAIY
         cD9yR2zgnGXOaBJSYK5Dsfanvqf4qxYfRACjVrgpyFBzRZEPmyy4OzjyzI/8LKP7/D
         8g2XFjuBNTxaRyy0Qth7LvpDSKFzJSwBaRuFz0VWHdfu76SmMZ6VUu9Pg4AU7MiDFc
         e7JMIQO16fNLcGi/FAczsQ4lBX5JjwF1I6uvyxr6u5Fxw09iK8Ef0jc2ShK5s+tKn9
         /AWYpb6GW3gGw==
X-Nifty-SrcIP: [209.85.214.181]
Received: by mail-pl1-f181.google.com with SMTP id u9so5129889plk.4;
        Sat, 19 Sep 2020 20:43:29 -0700 (PDT)
X-Gm-Message-State: AOAM530LD9YqULfPqhO6CJIzaLoWFilkcK4iiGuz+1faNtg47I91agmb
        JVXVNfGMlwd9PomT/ltql+7FMZyaduu0aTMXvOg=
X-Google-Smtp-Source: ABdhPJxEs9qseXaQ5ss9N4Zd8S95pFiRiyrWbKdP5omaq7bI4sC0+VUxJfWoj5TDeTwO7LMTEhNUo/jB1Hup8rnYSuk=
X-Received: by 2002:a17:90b:208:: with SMTP id fy8mr19938997pjb.153.1600573408216;
 Sat, 19 Sep 2020 20:43:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200919190258.3673246-1-andrew@lunn.ch>
In-Reply-To: <20200919190258.3673246-1-andrew@lunn.ch>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 20 Sep 2020 12:42:51 +0900
X-Gmail-Original-Message-ID: <CAK7LNASY6hTDo8cuH5H_ExciEybBPbAuB3OxsmHbUUgoES94EA@mail.gmail.com>
Message-ID: <CAK7LNASY6hTDo8cuH5H_ExciEybBPbAuB3OxsmHbUUgoES94EA@mail.gmail.com>
Subject: Re: [PATCH RFC/RFT 0/2] W=1 by default for Ethernet PHY subsystem
To:     Andrew Lunn <andrew@lunn.ch>
Cc:     netdev <netdev@vger.kernel.org>,
        David Miller <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Sep 20, 2020 at 4:03 AM Andrew Lunn <andrew@lunn.ch> wrote:
>
> There is a movement to make the code base compile clean with W=1. Some
> subsystems are already clean. In order to keep them clean, we need
> developers to build new code with W=1 by default in these subsystems.
>
> This patchset refactors the core Makefile warning code to allow the
> additional warnings W=1 adds available to any Makefile. The Ethernet
> PHY subsystem Makefiles then make use of this to make W=1 the default
> for this subsystem.
>
> RFT since i've only tested with x86 and arm with a modern gcc. Is the
> code really clean for older compilers? For clang?


I appreciate your efforts for keeping your subsystems
clean for W=1 builds, and I hope this work will be
extended towards upper directory level,
drivers/net/phy -> drivers/net -> drivers/.


However, when we talk about W=1, we consider not only the current
option set in W=1, but also options that might be added
by future compilers because every GCC/Clang
release adds new warning options.



Let's say, the future release, GCC 14 would
add a new option -Wfoo-bar, which is
reasonable enough to be enabled by default,
but doing so would emit a lot of warnings
in the current kernel tree.

We cannot add -Wfoo-bar to W=0 right away,
because our general consensus is that
the normal build should be warning-free.


In the current routine, we add -Wfoo-bar to W=1
with hope we can gradually fix the code and
eventually migrate it to W=0.
It is not always easy to move W=1 options to W=0
when we have lots of code fixed.
At least, 0-day bot iterates compile tests with W=1,
so new code violating -Wfoo-bar would be blocked.


With this patch series applied, where should we
add -Wfoo-bar? Adding it to W=1 would emit warnings
under drivers/net/ since W=1 is now the default
for the net subsystem.

Do we require to fix the code under driver/net/ first?
Or, should we add it to W=2 temporarily, then move it to W=1
once we fix drivers/net/?



So, another idea might be hard-coding extra warnings
like drivers/gpu/drm/i915/Makefile.

For example, your subsystem already achieved
-Wmissing-declarations free.

You can add

   subdir-ccflags-y += -Wmissing-declarations

to drivers/net/phy/Makefile.

Once you fix all net drivers, you can move it to
the parent, drivers/net/Makefile.

Then, drivers/Makefile next, and if it reaches
the top directory level, we can move it to W=0.



Some W=1 options stay there just because we cannot
fix lots of code.
So, our code should be improved with regard to W=1
warnings, but we might need some clarification
about how to do it gradually.

Comments are appreciated.







> Andrew Lunn (2):
>   scripts: Makefile.extrawarn: Add W=1 warnings to a symbol
>   net: phylib: Enable W=1 by default
>
>  drivers/net/mdio/Makefile  |  3 +++
>  drivers/net/pcs/Makefile   |  3 +++
>  drivers/net/phy/Makefile   |  3 +++
>  scripts/Makefile.extrawarn | 33 ++++++++++++++++++---------------
>  4 files changed, 27 insertions(+), 15 deletions(-)
>
> --
> 2.28.0
>


--
Best Regards
Masahiro Yamada
