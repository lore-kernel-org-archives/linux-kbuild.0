Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lj1-f195.google.com ([209.85.208.195]:38392 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387937AbfITPlP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 20 Sep 2019 11:41:15 -0400
Received: by mail-lj1-f195.google.com with SMTP id b20so2155145ljj.5
        for <linux-kbuild@vger.kernel.org>; Fri, 20 Sep 2019 08:41:13 -0700 (PDT)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com. [209.85.208.177])
        by smtp.gmail.com with ESMTPSA id n9sm499229ljh.53.2019.09.20.08.41.11
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Sep 2019 08:41:11 -0700 (PDT)
Received: by mail-lj1-f177.google.com with SMTP id n14so2480003ljj.10
        for <linux-kbuild@vger.kernel.org>; Fri, 20 Sep 2019 08:41:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAK7LNARsoed86dY75b_HNXXkCXRAKdMUGaEWUUca4BuGaZCwcg@mail.gmail.com>
 <20190917150902.GA4116@linux-8ccs> <CAK7LNAR_8atC3M9gGQ=DBwzFG52PVuNaFVAzAr32TKxTwDCLug@mail.gmail.com>
 <20190917180136.GA10376@linux-8ccs> <20190917181636.7sngz5lrldx34rth@willie-the-truck>
 <20190917184844.GA15149@linux-8ccs> <CAK7LNARxmDwu4QmV3bRBtptu-jUaHum=hHaia11-vmOd2ZkeKw@mail.gmail.com>
 <CAHk-=wggsTOU44tvdHAXBP-mmH+UJMXbJAdZYTOYD0PzPJntkg@mail.gmail.com>
In-Reply-To: <CAHk-=wggsTOU44tvdHAXBP-mmH+UJMXbJAdZYTOYD0PzPJntkg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 20 Sep 2019 08:40:55 -0700
Message-ID: <CAHk-=wjk=0KUP+Kkr=vRnUrL71j5q_SEQc0x5EPhq2ZJ-=sV1Q@mail.gmail.com>
Subject: Re: [GIT PULL] Kbuild updates for v5.4-rc1
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Will Deacon <will@kernel.org>, Matthias Maennich <maennich@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jessica Yu <jeyu@kernel.org>

On Thu, Sep 19, 2019 at 8:48 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> No problem. I'm used to merges, and I appreciate the heads-up.

Heh. The Kbuild merge turns out to be painful for other trees too. I
suspect the module tree isn't going to be any worse than the
DEBUG_INFO_BTF conflict.

             Linus
