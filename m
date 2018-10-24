Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi1-f195.google.com ([209.85.167.195]:46440 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726240AbeJXLUT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 24 Oct 2018 07:20:19 -0400
MIME-Version: 1.0
References: <20181023011042.GA6582@WindFlash> <fe54aafc-1dbc-d4a1-96b5-37455595956e@koikeco.de>
In-Reply-To: <fe54aafc-1dbc-d4a1-96b5-37455595956e@koikeco.de>
From: Leonardo Bras <leobras.c@gmail.com>
Date: Tue, 23 Oct 2018 22:48:34 -0300
Message-ID: <CADvQ+rE0THV2ZYwGi2jxU3sNSQhPxurfTSqpf022s5OP7ftiGw@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] Creates macro to avoid variable shadowing
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: helen@koikeco.de
Cc: lkcamp@lists.libreplanetbr.org, Borislav Petkov <bp@alien8.de>, David.Laight@aculab.com, Andy Lutomirski <luto@kernel.org>, Ingo Molnar <mingo@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>

Hello Helen,
On Tue, Oct 23, 2018 at 6:35 PM Helen Koike <helen@koikeco.de> wrote:
> Like this you are not changing the logic in this file, you are just
> renaming the variable which is more then enough to solve the -Wshadow
> warning.
> I don't it is worthy changing the logic.

You are right, that was what the patch was supposed to do. For some
crazy reason I must have submitted the wrong commit as a patch.

I will fix it and send you all a v3 ASAP.

Sorry for the inconvenience.
Thanks!

Leonardo Br=C3=A1s
