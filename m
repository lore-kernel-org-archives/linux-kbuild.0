Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk4.altibox.net ([109.247.116.15]:34410 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753703AbeFGQcP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 7 Jun 2018 12:32:15 -0400
Date: Thu, 7 Jun 2018 18:32:08 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [RFC 0/1] mconf: Emacs-like isearch
Message-ID: <20180607163208.GA26914@ravnborg.org>
References: <20180606215616.12817-1-dirk@gouders.net>
 <a594b5a7-d5c8-e938-df4e-dbba93ff3837@infradead.org>
 <ghzi07v944.fsf@lena.gouders.net>
 <f833ff8b-75ed-3ca4-ec24-a129a05902d1@infradead.org>
 <ghr2ljv5c9.fsf@lena.gouders.net>
 <CAK7LNARWC3J4V=Nx9rypwaWK8Lsv9A6J3LDW7s6E1xjc0JDE4A@mail.gmail.com>
 <ghmuw7uoku.fsf@lena.gouders.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ghmuw7uoku.fsf@lena.gouders.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dirk Gouders <dirk@gouders.net>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Randy Dunlap <rdunlap@infradead.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Segher Boessenkool <segher@kernel.crashing.org>

> 
> I'd say it's not important to start isearch with CTRL-s, I am just so
> used to it.  So, I am open for suggestions.

Today we have first or one of the first letters as shortcut to menus.
How about considering everything typed as search inputs.
Search is then stopped by ESC, arrow keys and maybe more.

Search is only possible when a menu is selected, not with focus on the buttons.

This will break the habits of people used to the shortcut variant,
but then we have the more flexible i-search variant.

Idea?

	Sam
