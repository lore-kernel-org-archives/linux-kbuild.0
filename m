Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr0-f179.google.com ([209.85.128.179]:32975 "EHLO
        mail-wr0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S966287AbeBNAl7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Feb 2018 19:41:59 -0500
Received: by mail-wr0-f179.google.com with SMTP id s5so20376474wra.0
        for <linux-kbuild@vger.kernel.org>; Tue, 13 Feb 2018 16:41:58 -0800 (PST)
Date: Wed, 14 Feb 2018 01:41:54 +0100
From: Petr Vorel <petr.vorel@gmail.com>
Subject: Re: [PATCH 2/2] kconfig: Print the value of each reverse dependency
Message-ID: <20180214004153.GA1154@x230>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20180213005610.10575-1-rosca.eugeniu@gmail.com>
 <20180213005610.10575-2-rosca.eugeniu@gmail.com>
 <CAFkk2KQ80dKfQaT1sx_X72ZYVu+N8dBLhEpJEAeK7f52Bb5V1g@mail.gmail.com>
 <20180213235448.GA30690@example.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180213235448.GA30690@example.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Eugeniu Rosca <roscaeugeniu@gmail.com>
Cc: Ulf Magnusson <ulfalizer@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Nicolas Pitre <nicolas.pitre@linaro.org>, Randy Dunlap <rdunlap@infradead.org>, Paul Bolle <pebolle@tiscali.nl>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Eugeniu Rosca <rosca.eugeniu@gmail.com>, Eugeniu Rosca <erosca@de.adit-jv.com>

Hi Eugeniu,

> To be honest, purely as a user, I would probably prefer something like
> below:

> Selected by [y/m]:
> - EXPR_01
> - EXPR_02
> Selected by [n]:
> - EXPR_03
> - EXPR_04
Sorting again, just with header? It looks more readable (although Masahiro's approach is
quite readable as well). If you chose this, I'd suggest not displaying title, when there
is empty list. i.e., don't show "Selected by [y/m]" in this:
Selected by [y/m]:
Selected by [n]:
- EXPR_03
- EXPR_04


> But (as a developer) I feel it can only come at the price of increased
> complexity of __expr_print() (at least, if not bigger than, [1]). What I
> like about the current approach suggested by Masahiro is that it keeps
> the impact low with still making a great improvement in readability.

> If you think we should explore the second possibility of grouping the
> active/inactive dependencies, I'll try to come up with some solution
> in the next days.

> [1] https://marc.info/?l=linux-kbuild&m=151777006005199&w=4


Kind regards,
Petr
