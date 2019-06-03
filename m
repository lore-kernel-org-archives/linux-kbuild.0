Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:52815 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726717AbfFCRQz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 3 Jun 2019 13:16:55 -0400
MIME-Version: 1.0
References: <20190516194818.29230-1-jani.nikula@intel.com> <CAK7LNAQv-fm2iV6HW_FM0Fe6hNDeJ25c9CS2SbroSOneoepFMQ@mail.gmail.com>
 <87zhnh8ou6.fsf@intel.com>
In-Reply-To: <87zhnh8ou6.fsf@intel.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 4 Jun 2019 02:16:16 +0900
Message-ID: <CAK7LNAT=nB0=at0X4OnHVKB=y7WwHGm4LXkrQnCw9HpjB5LooA@mail.gmail.com>
Subject: Re: [Intel-gfx] [RFC 1/3] kbuild: add support for ensuring headers
 are self-contained
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Michal Marek <michal.lkml@markovi.net>, intel-gfx@lists.freedesktop.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi Jani,

On Mon, May 20, 2019 at 6:16 PM Jani Nikula <jani.nikula@intel.com> wrote:
>
> >
> > I will take a little time to considier
> > how far we can extend the idea about
> > "headers should be self-contained".
>
> Thanks! Please let me know if/when you need further action from me, I
> won't post new versions until then.


Could you send v2 with the following changes ?


[1] Could you rename *.header_test.c to *.hdrtest.c ?
    (I just thought .header_test.c was a bit too long.)

[2] %.hdrtest.c should not depend on the header

This will avoid unnecessary regeneration of *.hdrtest.c

quiet_cmd_header_test = HDRTEST $@
      cmd_header_test = echo "\#include \"$*.h\"" > $@

$(obj)/%.hdrtest.c:
        $(call cmd,header_test)

[3] Please add '*.hdrtest.c' to  .gitignore, Documentation/dontdiff

[4] Please add '*.hdrtest.c' to 'make clean' (around line 1640 of top Makefile)


-- 
Best Regards
Masahiro Yamada
