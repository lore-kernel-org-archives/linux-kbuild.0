Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:33438 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725765AbfGTFJs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 20 Jul 2019 01:09:48 -0400
MIME-Version: 1.0
References: <20190711054434.1177-1-yamada.masahiro@socionext.com>
 <20190711054434.1177-9-yamada.masahiro@socionext.com> <20190716214023.GA15159@redhat.com>
 <CAK7LNAQ41NhPPO6xoVObgFctTO6WewSXPfZkE7_bZXsdAtKSpA@mail.gmail.com> <f1222c8a-9301-1e76-981d-a36e8687a29f@redhat.com>
In-Reply-To: <f1222c8a-9301-1e76-981d-a36e8687a29f@redhat.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 20 Jul 2019 14:09:01 +0900
Message-ID: <CAK7LNATrS_ENkz3-dT70mXi=L89w0a-x6tSsDT-r7qxNa+kaOQ@mail.gmail.com>
Subject: Re: [PATCH v2 08/11] kbuild: create *.mod with full directory path
 and remove MODVERDIR
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Joe Lawrence <joe.lawrence@redhat.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Nicolas Pitre <nico@fluxnic.net>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>

Hi Joe,

On Fri, Jul 19, 2019 at 5:18 AM Joe Lawrence <joe.lawrence@redhat.com> wrote:

> > Perhaps, adding a new field
> > to *.mod files might be cleaner.
>
> I can look into that.  By "field" you mean a new row in the file?

Yes.


-- 
Best Regards
Masahiro Yamada
