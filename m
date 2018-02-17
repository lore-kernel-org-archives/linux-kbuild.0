Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr0-f182.google.com ([209.85.128.182]:35136 "EHLO
        mail-wr0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751021AbeBQR0d (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 17 Feb 2018 12:26:33 -0500
Received: by mail-wr0-f182.google.com with SMTP id l43so5760487wrc.2
        for <linux-kbuild@vger.kernel.org>; Sat, 17 Feb 2018 09:26:33 -0800 (PST)
From: Eugeniu Rosca <roscaeugeniu@gmail.com>
Date: Sat, 17 Feb 2018 18:26:30 +0100
Subject: Re: [PATCH 2/2] kconfig: Print the value of each reverse dependency
Message-ID: <20180217172630.GB16512@example.com>
References: <20180213005610.10575-1-rosca.eugeniu@gmail.com>
 <20180213005610.10575-2-rosca.eugeniu@gmail.com>
 <CAFkk2KQ80dKfQaT1sx_X72ZYVu+N8dBLhEpJEAeK7f52Bb5V1g@mail.gmail.com>
 <20180213235448.GA30690@example.com>
 <20180214004153.GA1154@x230>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180214004153.GA1154@x230>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Petr Vorel <petr.vorel@gmail.com>
Cc: Ulf Magnusson <ulfalizer@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Randy Dunlap <rdunlap@infradead.org>, Paul Bolle <pebolle@tiscali.nl>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Eugeniu Rosca <rosca.eugeniu@gmail.com>, Eugeniu Rosca <erosca@de.adit-jv.com>

Hello Petr,

On Wed, Feb 14, 2018 at 01:41:54AM +0100, Petr Vorel wrote:
> Hi Eugeniu,
> 
> > To be honest, purely as a user, I would probably prefer something like
> > below:
> 
> > Selected by [y/m]:
> > - EXPR_01
> > - EXPR_02
> > Selected by [n]:
> > - EXPR_03
> > - EXPR_04
> Sorting again, just with header? It looks more readable (although Masahiro's approach is
> quite readable as well). If you chose this, I'd suggest not displaying title, when there
> is empty list. i.e., don't show "Selected by [y/m]" in this:
> Selected by [y/m]:
> Selected by [n]:
> - EXPR_03
> - EXPR_04

I took your preference into consideration in the v3 revision. Thanks!

Best regards,
Eugeniu.
