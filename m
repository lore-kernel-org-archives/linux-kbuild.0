Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f44.google.com ([74.125.82.44]:54950 "EHLO
        mail-wm0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755719AbdJJA1R (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Oct 2017 20:27:17 -0400
Received: by mail-wm0-f44.google.com with SMTP id i124so702391wmf.3
        for <linux-kbuild@vger.kernel.org>; Mon, 09 Oct 2017 17:27:16 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAK7LNARBy5JSNPZf6k+O6sMA=Wd6-Sd0Hdk1rDvT2AbT22DBWA@mail.gmail.com>
References: <1507089367-10402-1-git-send-email-yamada.masahiro@socionext.com>
 <1507089367-10402-4-git-send-email-yamada.masahiro@socionext.com>
 <CAD=FV=Um_MOaTT=kEvYSA=rTq8w9w39iuKaDgHedSo5ck9JPqw@mail.gmail.com> <CAK7LNARBy5JSNPZf6k+O6sMA=Wd6-Sd0Hdk1rDvT2AbT22DBWA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 9 Oct 2017 17:27:14 -0700
Message-ID: <CAD=FV=U0eHcZ3aZwEN-i5eOQg5gdGcrs+cnC0XEpo1xrfmkKLg@mail.gmail.com>
Subject: Re: [RFC PATCH 4/4] kbuild: evaluate cc-option and friends only when
 building kernel
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi,

On Mon, Oct 9, 2017 at 5:23 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> I am still wondering if I should apply this one
> because your cache approach provides much more benefits.
>
> (that is why I prefixed this 4/4 with RFC.)
>
>
> Maybe I will send v2, or maybe not.

I'm not sure I have a strong opinion either way.  In general your idea
makes a lot of sense--no need to do extra work if you don't need to.
It's all a question of how clean / maintainable it will be I guess.

-Doug
