Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:34460 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751251AbeA1B3D (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 27 Jan 2018 20:29:03 -0500
MIME-Version: 1.0
In-Reply-To: <594ca2cb-5a21-2bba-4132-73d42f3a909a@intel.com>
References: <20171219012656.23728-1-marc.herbert@intel.com>
 <CAK7LNAR8HedCgZAk1fY9rA8HERh5weQCjWXkP2SXuhzRRWVhVQ@mail.gmail.com>
 <070e7d03-b1a7-430f-709b-bb5fe9e2a0a3@intel.com> <CAK7LNASR8Qmo85FGr0wW-4t2_uTmDZVSituLLuRm73_+Qqstmw@mail.gmail.com>
 <f7008e72-e762-a86d-8a39-415eae55dae9@intel.com> <CAK7LNAQA8gB1iijS5uoVFdVc-UoyyAQN+N8GvXpw9aR7Jp8dyA@mail.gmail.com>
 <594ca2cb-5a21-2bba-4132-73d42f3a909a@intel.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 28 Jan 2018 10:28:18 +0900
Message-ID: <CAK7LNARk_VjS=37Ffckcc20EarzRs221RoKR=MY9ww-LmqxGQA@mail.gmail.com>
Subject: Re: [PATCH] Remove silentoldconfig from "make help"; fix
 kconfig/conf's help
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Marc Herbert <Marc.Herbert@intel.com>
Cc: Thiago Macieira <thiago.macieira@intel.com>, Josh Triplett <josh@joshtriplett.org>, Guenter Roeck <groeck@google.com>, Wayne Boyer <wayne.boyer@intel.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Sam Ravnborg <sam@ravnborg.org>

2018-01-27 8:00 GMT+09:00 Marc Herbert <Marc.Herbert@intel.com>:
> Masahiro,
>
> On 17/01/2018 20:31, Masahiro Yamada wrote:
>
>> Sorry for my late reply.
>
> I think we're even now :-)
>
>>> I'd like to keep that sentence because it's there to explain the legacy and
>>> confusing "--silentoldconfig" name which unfortunately still sticks out in
>>> the *current* conf.c interface.
>>>
>>> +       printf("  --silentoldconfig       Similar to oldconfig but generates configuration in\n"
>>> +              "                          include/{generated/,config/} (oldconfig used to be more verbose)\n");
>>>
>>> The purpose of this sentence is to warn people that: "silentoldconfig is
>>> just archeology, so you can safely ignore it" and save them time.
>>>
>>> The alternative I considered was to entirely remove "silentconfig" not just
>>> from the Makefile's help but from the conf.c help too.
>
>>
>> Another possibility might be to rename 'silentoldconfig'.
>> instead of explaining the background in the help message.
>> [...]
>> It is difficult to suggest a clear name,
>> but 'syncconfig' is the one I came up with.
>>
>> Please suggest if you have a better idea.
>
> Look like a good idea and name to me but... for a different, bigger
> and later commit.
>
>> Commit fb16d8912db5268f29706010ecafff74b971c58d
>> renamed oldnoconfig to olddefconfig...
>
> ... but it didn't remove any "now internal API" from "make help". Instead it
> changed the name of an external and preserved "API".
>
>> If we worry about the compatibility just in case,
>> we can keep 'silentoldconfig' as an alias as well.
>
> Yes - but later?
>
> In the meantime I found another instance of silentoldconfig in
> Documentation/admin-guide/; posting v3 with that removed too.
> I'm also adding some deprecation comments in the source.
>
> --

Okay, let's go with your patch for now.



-- 
Best Regards
Masahiro Yamada
