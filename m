Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi0-f46.google.com ([209.85.218.46]:44030 "EHLO
        mail-oi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750798AbeEKBWE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 10 May 2018 21:22:04 -0400
MIME-Version: 1.0
In-Reply-To: <CAFkk2KRWon_S--dxYw82cDyGXKTFA6jxrrQwstzLvHPs=6-dqQ@mail.gmail.com>
References: <CAFkk2KRTnRpi5thUGTM2+LZMyitggdJtiOBO7E0pTn93fz6-SQ@mail.gmail.com>
 <d4c3b2ab-385d-fe7a-bdb1-2d497d620de5@infradead.org> <CAFkk2KRozscmd4kQSJKwKmY3WpTody7S5XZZObf8SKLF62k6+w@mail.gmail.com>
 <CAFkk2KRkEt3+786QvyjzPPAm+3HDe2+ydzZJpshfdKyUDQVfuw@mail.gmail.com>
 <CAFkk2KRvSxu+x-nb045=3L63KEk5h9URr5QYLPoYp6rqqTR4qA@mail.gmail.com>
 <3d9be2f2-3fbe-411b-8529-0e0847f01346@infradead.org> <CAFkk2KRWon_S--dxYw82cDyGXKTFA6jxrrQwstzLvHPs=6-dqQ@mail.gmail.com>
From: Ulf Magnusson <ulfalizer@gmail.com>
Date: Fri, 11 May 2018 03:22:03 +0200
Message-ID: <CAFkk2KSxkg5j1GOw=z1DDz6mV1F-Ej4Yfwv+S9wMivz9VCi-6g@mail.gmail.com>
Subject: Re: [ANNOUNCE] Kconfiglib menuconfig implementation
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, May 8, 2018 at 6:59 PM, Ulf Magnusson <ulfalizer@gmail.com> wrote:
> Hello,
>
> I've added incremental search for jumping directly to a symbol now.
> Regular expressions are supported as well.
>
> Some screenshots below:
>
> https://raw.githubusercontent.com/ulfalizer/Kconfiglib/screenshots/screenshots/ss10.png
> https://raw.githubusercontent.com/ulfalizer/Kconfiglib/screenshots/screenshots/ss11.png
> https://raw.githubusercontent.com/ulfalizer/Kconfiglib/screenshots/screenshots/ss13.png
>
> The last screenshot shows how things might look after you jump to a
> symbol. The jumped-to symbol wasn't visible in this case, so show-all
> mode was turned on automatically.
>

Some new search-related features:

  - The jump-to dialog now searches and lists prompt texts.

  - A kind of poor man's fuzzy search has been added. 'foo bar baz'
    matches all entries that match all of 'foo', 'bar', and 'baz', as
    regexes.

Demo: https://asciinema.org/a/Q4UNFVPF5zd62KqjrG95mowkG

Cheers,
Ulf
