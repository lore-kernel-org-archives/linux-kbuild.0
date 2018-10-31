Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt1-f193.google.com ([209.85.160.193]:42080 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729429AbeKAIY1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 1 Nov 2018 04:24:27 -0400
Message-ID: <16b6518d7b36787e1813d62336b661bf603d54b2.camel@gmail.com>
Subject: Re: [PATCH v3 4/5] modpost: Changes parameter name to avoid
 shadowing.
From: Leonardo Bras <leobras.c@gmail.com>
Date: Wed, 31 Oct 2018 20:24:01 -0300
In-Reply-To: <CAK7LNAQzgdFPpwHEtfDazLd2jAhNy8=f_4mvOQMWfOWCb07E1Q@mail.gmail.com>
References: <20181024040354.24879-1-leobras.c@gmail.com>
         <20181024040354.24879-5-leobras.c@gmail.com>
         <CAK7LNAQzgdFPpwHEtfDazLd2jAhNy8=f_4mvOQMWfOWCb07E1Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: lkcamp@lists.libreplanetbr.org, Borislav Petkov <bp@alien8.de>, David.Laight@aculab.com, Andy Lutomirski <luto@kernel.org>, Ingo Molnar <mingo@kernel.org>, helen@koikeco.de, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Em seg, 2018-10-29 às 01:42 +0900, Masahiro Yamada escreveu:
> On Wed, Oct 24, 2018 at 1:05 PM Leonardo Bras <leobras.c@gmail.com>
> wrote:
> > Changes the parameter name to avoid shadowing a variable.
> > 
> > Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
> 
> For this one, I'd rather like to see code refactoring
> than renaming the variable.
> 
> I will take a closer look.


What do you suggest to refactor?
I volunteer for this work.

Leonardo Bras
