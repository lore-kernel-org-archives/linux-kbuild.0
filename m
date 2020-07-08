Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725848AbgGHUnU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 8 Jul 2020 16:43:20 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7290DC061A0B
        for <linux-kbuild@vger.kernel.org>; Wed,  8 Jul 2020 13:43:20 -0700 (PDT)
Subject: Re: linux-kbuild missing from lore?
References: <CAKwvOd=i8mLYsSNtJTcZ=RTk76F_mYy9fM9FBtDveFybxyGyiw@mail.gmail.com>
 <CAK7LNARc4L18CP6ZbTheh43VobQZ1s_2Q=4O7oKmTZRLgiTw6Q@mail.gmail.com>
 <f30f6849-9d94-4ba9-f875-9ab8c0700620@infradead.org>
 <CAKwvOdnknZNPuucvy0Kim6xCfyUhmNKXQiERCQcoSMYdo6=6FQ@mail.gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <acc9cbac-982b-e3a0-d1bf-5d3d4ffd9b08@infradead.org>
Date: Wed, 8 Jul 2020 13:42:59 -0700
MIME-Version: 1.0
In-Reply-To: <CAKwvOdnknZNPuucvy0Kim6xCfyUhmNKXQiERCQcoSMYdo6=6FQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, helpdesk@kernel.org, Sam Ravnborg <sam@ravnborg.org>, Nathan Huckleberry <nhuck@google.com>, Michal Marek <michal.lkml@markovi.net>

On 7/8/20 11:42 AM, Nick Desaulniers wrote:
> On Mon, Mar 16, 2020 at 6:06 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>>
>> On 3/16/20 5:47 PM, Masahiro Yamada wrote:
>>> Hi Nick,
>>>
>>> On Tue, Mar 17, 2020 at 8:22 AM Nick Desaulniers
>>> <ndesaulniers@google.com> wrote:
>>>>
>>>> Hi Masahiro,
>>>> I noticed that linux-kbuild@vger.kernel.org seems to be missing from
>>>> https://lore.kernel.org/lists.html.  Is that intentional or
>>>> accidental?
>>>> --
>>>> Thanks,
>>>> ~Nick Desaulniers
>>>
>>>
>>> Thanks for letting me know this.
>>> I guess it is accidental.
>>>
>>> In fact, I do not know what to do
>>> to take good care of the kbuild ML.
>>
>> Maybe ask Sam Ravnborg or Michal Marek if they have kbuild ML archives.
>>
>> or see if they are available from some other ML archive site, like
>> https://www.spinics.net/lists/linux-kbuild/
>>
>>
>> My kbuild archive has about 20,000 emails in it, beginning around the
>> middle of 2011.
>> I could make that available, but I don't claim that it is complete.
>>
>> And I'm sure that it has some duplicate emails in it [if an email is
>> kbuild-related, I put the email into this "folder", no matter what
>> mailing list it came from].
> 
> https://lore.kernel.org/lists.html links to
> https://www.kernel.org/lore.html links to
> https://korg.docs.kernel.org/lore.html
> which seems to indicate that we need such an archive.
> 
> cc'ing help desk for the request.  It looks like we need to
> collect+merge then sanitize mboxes.  Randy, if we could start with
> your archive, I'd be happy to help drive this across the finish line.

Hi,

As long as you or someone will go thru the mbox file (about 164 MB or
34 MB when gzipped) and select emails that are To: or Cc:
linux-kbuild@vger.kernel.org, I'm OK with making it available.
The reason I say that is because it just might have some personal
emails in it that should not be added to a public archive.

Also, as I said earlier, once the correct emails are selected,
there are going to be duplicates of many of them, so dropping
those duplicates (or triplicates etc.) would be a Good Idea.


Has anyone thought about trying to get the kbuild archive from
marc.info/?l=linux-kbuild ?  or contacted the marc.info admin?


-- 
~Randy
