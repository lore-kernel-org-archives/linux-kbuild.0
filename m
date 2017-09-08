Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io0-f193.google.com ([209.85.223.193]:36939 "EHLO
        mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932391AbdIHViZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 8 Sep 2017 17:38:25 -0400
MIME-Version: 1.0
In-Reply-To: <CA+55aFzz_fv--Kx8phjWt_VOzZOMmbs0XX7_kL--_XRitWwJQA@mail.gmail.com>
References: <1503132577-24423-1-git-send-email-yamada.masahiro@socionext.com>
 <CA+55aFzQ4shyD=bqdSMreU33iLVkEsSgnMXegL5wcu5ug0fOUg@mail.gmail.com>
 <CA+55aFzr2HTZVOuzpHYDwmtRJLsVzE-yqg2DHpHi_9ePsYp5ug@mail.gmail.com>
 <CAK7LNATaisd3tPNbujTWLUq-2sMQ3pyTkPRSgjw00zUzv=GvSQ@mail.gmail.com>
 <CA+55aFwvaZSXubcmaaZD-i5c_F5bHWhr6OBxRM+=7dGueua0Ng@mail.gmail.com>
 <CA+55aFzZNpuYjVa4EZ2eJhvtU7-bzZTor_596TA5_CY77j+BEw@mail.gmail.com> <CA+55aFzz_fv--Kx8phjWt_VOzZOMmbs0XX7_kL--_XRitWwJQA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 8 Sep 2017 14:38:23 -0700
Message-ID: <CA+55aFy4w6Ken-a83EE+otw6d+cgRfdV9wj6ayoDYFhi251Gvg@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] kbuild: generate intermediate C files instead of
 copying _shipped files
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Richard Purdie <richard.purdie@linuxfoundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Markus Heiser <markus.heiser@darmarit.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, Rob Herring <robh+dt@kernel.org>, SeongJae Park <sj38.park@gmail.com>, "Yann E. MORIN" <yann.morin.1998@free.fr>

On Fri, Sep 8, 2017 at 11:39 AM, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Strange. Does anybody see what the pattern to the failure is?

Found it. Stupid special case for 'typeof()' that used
is_reserved_word() in ways I hadn't realized.

Fix committed.

             Linus
