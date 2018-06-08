Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from services.gouders.net ([141.101.32.176]:58619 "EHLO
        services.gouders.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751286AbeFHIMa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 8 Jun 2018 04:12:30 -0400
From: Dirk Gouders <dirk@gouders.net>
Subject: Re: [RFC 0/1] mconf: Emacs-like isearch
In-Reply-To: <20180607163208.GA26914@ravnborg.org> (Sam Ravnborg's message of
        "Thu, 7 Jun 2018 18:32:08 +0200")
References: <20180606215616.12817-1-dirk@gouders.net>
        <a594b5a7-d5c8-e938-df4e-dbba93ff3837@infradead.org>
        <ghzi07v944.fsf@lena.gouders.net>
        <f833ff8b-75ed-3ca4-ec24-a129a05902d1@infradead.org>
        <ghr2ljv5c9.fsf@lena.gouders.net>
        <CAK7LNARWC3J4V=Nx9rypwaWK8Lsv9A6J3LDW7s6E1xjc0JDE4A@mail.gmail.com>
        <ghmuw7uoku.fsf@lena.gouders.net>
        <20180607163208.GA26914@ravnborg.org>
Date: Fri, 08 Jun 2018 09:56:50 +0200
Message-ID: <gha7s5socd.fsf@lena.gouders.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Randy Dunlap <rdunlap@infradead.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Segher Boessenkool <segher@kernel.crashing.org>

Sam Ravnborg <sam@ravnborg.org> writes:

>> 
>> I'd say it's not important to start isearch with CTRL-s, I am just so
>> used to it.  So, I am open for suggestions.
>
> Today we have first or one of the first letters as shortcut to menus.
> How about considering everything typed as search inputs.
> Search is then stopped by ESC, arrow keys and maybe more.
>
> Search is only possible when a menu is selected, not with focus on the buttons.
>
> This will break the habits of people used to the shortcut variant,
> but then we have the more flexible i-search variant.
>
> Idea?

Sounds very interesting, I will see if I can prepare a prototype so that
users can test it an see if they feel that would be an improvement for
them.  In mconf, a focus on the buttons would be conceptually new
and I am anticipating I am not yet realizing all of the consequences.

One situation, I am still thinking about how to handle it (without a
dedicated search key):

* The user types a string and then doesn't want to enter further string
  characters but find further occurences of the already entered string.

  (In my imagination, TAB is reserved to change focus to the buttons,
   ENTER is reserved to stop searching -- and enter a submenu, depending
   on the item.)

Dirk
