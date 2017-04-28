Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:21047 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1033559AbdD1Agi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 27 Apr 2017 20:36:38 -0400
MIME-Version: 1.0
In-Reply-To: <20170425224735.131835-1-mka@chromium.org>
References: <20170425224735.131835-1-mka@chromium.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 28 Apr 2017 09:36:32 +0900
Message-ID: <CAK7LNAQOZ-A+JRP1hCmKs1JdN5XsRkWW3OhhRb5-Hj+TMTs7jw@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: clang: add -no-integrated-as to KBUILD_[AC]FLAGS
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Michal Marek <mmarek@suse.com>, Michael Davidson <md@google.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Grant Grundler <grundler@chromium.org>, Greg Hackmann <ghackmann@google.com>, Saleem Abdulrasool <compnerd@compnerd.org>

2017-04-26 7:47 GMT+09:00 Matthias Kaehlcke <mka@chromium.org>:
> From: Michael Davidson <md@google.com>
>
> The Linux Kernel relies on GCC's acceptance of inline assembly as an
> opaque object which will not have any validation performed on the content.
> The current behaviour in LLVM is to perform validation of the contents by
> means of parsing the input if the MC layer can handle it.
>
> Disable clangs integrated assembler and use the GNU assembler instead.
>
> Wording-mostly-from: Saleem Abdulrasool <compnerd@compnerd.org>
> Signed-off-by: Michael Davidson <md@google.com>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---


Applied to linux-kbuild/kbuild.  Thanks!


-- 
Best Regards
Masahiro Yamada
