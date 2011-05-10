Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-iw0-f174.google.com ([209.85.214.174]:51119 "EHLO
	mail-iw0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751625Ab1EJWCT convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 10 May 2011 18:02:19 -0400
Received: by iwn34 with SMTP id 34so5591004iwn.19
        for <linux-kbuild@vger.kernel.org>; Tue, 10 May 2011 15:02:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <201105102238.47557.yann.morin.1998@anciens.enib.fr>
References: <201105100053.37010.yann.morin.1998@anciens.enib.fr>
	<BANLkTinRk7zbr6odrFhW2YLcHvwnuzEJtg@mail.gmail.com>
	<201105102238.47557.yann.morin.1998@anciens.enib.fr>
Date: Tue, 10 May 2011 18:02:18 -0400
Message-ID: <BANLkTi=-7wvh_UG7mGSp0a+XUk21Lwd5FA@mail.gmail.com>
Subject: Re: Choice visibility issue
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
Cc: linux-kbuild@vger.kernel.org

Hi,

On Tue, May 10, 2011 at 4:38 PM, Yann E. MORIN
<yann.morin.1998@anciens.enib.fr> wrote:
> Arnaud, All,
>
> On Tuesday 10 May 2011 20:12:11 Arnaud Lacombe wrote:
>> On Mon, May 9, 2011 at 6:53 PM, Yann E. MORIN
>> <yann.morin.1998@anciens.enib.fr> wrote:
>> > In case a choice appears in two places, and each instance depends on
>> > different conditions, the visibility of the choice item is not coherent.
> [--SNIP--]
>> > If neither A not B is selected, the choice is not visible (expected):
>> >  [ ] A
>> >  [ ]   B
>> > ==> OK
>> >
>> No, there is a first bug here, B should not appear as a child of A,
>> but it is irrelevant to the other issue. [note for later,
>> menu_finalize() is breaking the tree, damn dependency...]
>
> The first I saw this behavior, I thought as you did: B should not be
> considered a child of A, as it does not depend on A, but on !A.
>
> But then, B is directly dependent on the value of A, so it kind of makes
> sense to treat it as a child of A, and indent it.
>
> Of course, I don't really mind one way or the other. :-)
>
> [--SNIP--]
>> > For the conf frontend, the issue happens only on the second run, not
>> > on the first run, which somewhat makes sense. I was not able to run
>> > xconfig, as I lack proper qt devel here.
>> of course, your problem is in the backend.
>
> Yes, I just wanted to confirm the behavior was common to all frontends,
> just to check it was not some weirdness in mconf, then I looked at
> menu.c but got /lost in translation/ when trying to understand how the
> visibility of choices was established...
>
>> > So:
>> > - is this a limitation that can not be overcome?
>> yes, the problem is that choice's visibility are only determined by
>> the visibility of the underlying symbol. In your case, the same symbol
>> appear in twice in the tree.
>
> Good to know. Thanks! :-)
>
>> > - if it can be overcome, where should I start to look at?
>> you may want to try:
>>
>> diff --git a/scripts/kconfig/menu.c b/scripts/kconfig/menu.c
>> index 5fdf10d..55b6fe0 100644
>> --- a/scripts/kconfig/menu.c
>> +++ b/scripts/kconfig/menu.c
>> @@ -279,6 +279,10 @@ void menu_finalize(struct menu *parent)
>>                                         }
>>                                 }
>>                         }
>> +                       if (parent->prompt &&
>> !expr_is_yes(parent->prompt->visible.expr)) {
>> +                               parent->visibility =
>> expr_alloc_and(parent->visibility,
>> +                                           parent->prompt->visible.expr);
>> +                       }
>>                         /* set the type of the remaining choice values */
>>                         for (menu = parent->list; menu; menu = menu->next) {
>>                                 current_entry = menu;
>
> \o/ Yes! It works! It fixes both the test case I submitted, and it also
> fixes the use-case in crosstool-NG as well! Great! :-)
>
>> I did not regress-tested it yet, but it seems to help in this specific
>> case.
>
> I've done a few tests here, and all seems OK. See the attached test file.
> Tested against linux-next 1139a3e1bfbc0320175eaaf9c09261956271eb36 with
> your patch applied on-top.
>
>> [I anticipate that GMail is gonna wrap lines ... d'oh!]
>
> Yep... :-)
> Will you re-send a properly formatted patch, or do you want me to do so?
>
I'll resent, it may need to be tuned.

 - Arnaud

> Thank you again!
>
> Regards,
> Yann E. MORIN.
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
>
