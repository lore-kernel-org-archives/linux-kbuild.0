Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:55316 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725747AbfDRJ0n (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 18 Apr 2019 05:26:43 -0400
MIME-Version: 1.0
References: <cover.1555382110.git.mchehab+samsung@kernel.org> <5cfeb21a8841c1e029e8396bdaa7cd55ac0b08a2.1555382110.git.mchehab+samsung@kernel.org>
In-Reply-To: <5cfeb21a8841c1e029e8396bdaa7cd55ac0b08a2.1555382110.git.mchehab+samsung@kernel.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 18 Apr 2019 18:25:45 +0900
Message-ID: <CAK7LNAQUGkW=Mnz-EtUkm=7uBpGLZNgO+3MUTmkWOggo+_eHjw@mail.gmail.com>
Subject: Re: [PATCH 18/57] docs: kbuild: convert it to ReST output
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Tue, Apr 16, 2019 at 12:01 PM Mauro Carvalho Chehab
<mchehab+samsung@kernel.org> wrote:
>
> The kbuild documentation clearly shows that the documents
> there are written at different times: some use markdown,
> some use their own peculiar logic to split sections.
>
> Convert everything to ReST without affecting too much
> the author's style and avoiding adding uneeded markups.

Sorry for my ignorance, but shouldn't ReST use
the extension '.rst' instead of '.txt' ?



> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> ---
>  Documentation/kbuild/headers_install.txt      |   5 +-
>  Documentation/kbuild/kbuild.txt               | 119 ++--
>  Documentation/kbuild/kconfig-language.txt     | 232 ++++----
>  .../kbuild/kconfig-macro-language.txt         |  37 +-
>  Documentation/kbuild/kconfig.txt              | 136 +++--
>  Documentation/kbuild/makefiles.txt            | 518 +++++++++++-------
>  Documentation/kbuild/modules.txt              | 166 +++---
>  7 files changed, 720 insertions(+), 493 deletions(-)
>

-- 
Best Regards
Masahiro Yamada
