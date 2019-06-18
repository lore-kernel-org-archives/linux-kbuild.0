Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:16687 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729209AbfFRPqR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 18 Jun 2019 11:46:17 -0400
MIME-Version: 1.0
References: <20190604101409.2078-14-yamada.masahiro@socionext.com>
 <20190604124248.5564-1-jani.nikula@intel.com> <20190604172553.GA2383@ravnborg.org>
In-Reply-To: <20190604172553.GA2383@ravnborg.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 19 Jun 2019 00:45:22 +0900
Message-ID: <CAK7LNAQ_FxSK=TBvcmKsGEK2jB+rGE7uLqjaNYmKBsCPp8X0Gg@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: add support for ensuring headers are self-contained
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>, Jani Nikula <jani.nikula@intel.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>, David Howells <dhowells@redhat.com>, Chris Wilson <chris@chris-wilson.co.uk>, Michal Marek <michal.lkml@markovi.net>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>

On Wed, Jun 5, 2019 at 2:26 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> On Tue, Jun 04, 2019 at 03:42:48PM +0300, Jani Nikula wrote:
> > Sometimes it's useful to be able to explicitly ensure certain headers
> > remain self-contained, i.e. that they are compilable as standalone
> > units, by including and/or forward declaring everything they depend on.
> >
> > Add special target header-test-y where individual Makefiles can add
> > headers to be tested if CONFIG_HEADER_TEST is enabled. This will
> > generate a dummy C file per header that gets built as part of extra-y.
> >
> > Cc: Chris Wilson <chris@chris-wilson.co.uk>
> > Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> > Cc: Michal Marek <michal.lkml@markovi.net>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> Looks good, thanks.
>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
>

Applied to linux-kbuild.
Thanks.


-- 
Best Regards
Masahiro Yamada
