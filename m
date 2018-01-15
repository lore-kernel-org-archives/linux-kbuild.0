Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ua0-f195.google.com ([209.85.217.195]:33936 "EHLO
        mail-ua0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755129AbeAOLAu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 15 Jan 2018 06:00:50 -0500
MIME-Version: 1.0
In-Reply-To: <20180114210048.GA11442@ravnborg.org>
References: <20180114113345.18623-1-ulfalizer@gmail.com> <20180114210048.GA11442@ravnborg.org>
From: Ulf Magnusson <ulfalizer@gmail.com>
Date: Mon, 15 Jan 2018 12:00:48 +0100
Message-ID: <CAFkk2KTB7BWZB9PHmrWFCEDFed_sjpJ3eTBvoBUWgjL5ER5i1w@mail.gmail.com>
Subject: Re: [PATCH 0/2] kconfig: 'if' and automatic submenu creation documentation
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Sun, Jan 14, 2018 at 10:00 PM, Sam Ravnborg <sam@ravnborg.org> wrote:
> Hi Ulf.
>
> On Sun, Jan 14, 2018 at 12:33:43PM +0100, Ulf Magnusson wrote:
>> These together should make the automatic submenu logic a lot clearer.
>>
>> Ulf Magnusson (2):
>>   kconfig: Document 'if' flattening logic
>>   kconfig: Improve auto. menu documentation accuracy
>>
>>  scripts/kconfig/menu.c | 33 +++++++++++++++++++++++++++++----
>>  1 file changed, 29 insertions(+), 4 deletions(-)
>
> Very good with extra comments in menu_finalize.
> If you can mamage to explain the logic related to select
> then even better.

I added a short comment in
https://patchwork.kernel.org/patch/9986947/, which is already in
linux-next:

    /*
    * Handle selects and implies, which modify the
    * dependencies of the selected/implied symbol
    */
    if (prop->type == P_SELECT) {
    ...

There's also https://patchwork.kernel.org/patch/9983881/:

    /* Reverse dependencies through being selected by other symbols */
    struct expr_value rev_dep;

I guess it could be made more explicit. I don't want to heap on too
many patches at once though.

>
> While on the subject on improving readability, then
> menu_finalize would benefit from a split in a number of
> well named and well documented helper functions.
>
> It would be great if you could try this out.

I had a stab at it earlier, but never got done. I think the high-level
structure in Kconfiglib should work:
https://github.com/ulfalizer/Kconfiglib/blob/master/kconfiglib.py#L3990

Hopefully I'll get back to it later once the current batch of patches
has been merged. I'm just happy to have to have less mystery code in
there for now. Definitely one of the more opaque parts of Kconfig.

Cheers,
Ulf
