Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:45058 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753332AbeAREcW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 Jan 2018 23:32:22 -0500
MIME-Version: 1.0
In-Reply-To: <f7008e72-e762-a86d-8a39-415eae55dae9@intel.com>
References: <20171219012656.23728-1-marc.herbert@intel.com>
 <CAK7LNAR8HedCgZAk1fY9rA8HERh5weQCjWXkP2SXuhzRRWVhVQ@mail.gmail.com>
 <070e7d03-b1a7-430f-709b-bb5fe9e2a0a3@intel.com> <CAK7LNASR8Qmo85FGr0wW-4t2_uTmDZVSituLLuRm73_+Qqstmw@mail.gmail.com>
 <f7008e72-e762-a86d-8a39-415eae55dae9@intel.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 18 Jan 2018 13:31:24 +0900
Message-ID: <CAK7LNAQA8gB1iijS5uoVFdVc-UoyyAQN+N8GvXpw9aR7Jp8dyA@mail.gmail.com>
Subject: Re: [PATCH] Remove silentoldconfig from "make help"; fix
 kconfig/conf's help
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Marc Herbert <Marc.Herbert@intel.com>
Cc: Thiago Macieira <thiago.macieira@intel.com>, Josh Triplett <josh@joshtriplett.org>, Guenter Roeck <groeck@google.com>, Wayne Boyer <wayne.boyer@intel.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Sam Ravnborg <sam@ravnborg.org>

Hi Marc,

Sorry for my late reply.

2018-01-13 7:49 GMT+09:00 Marc Herbert <Marc.Herbert@intel.com>:
> Masahiro,
>
> On 09/01/2018 23:17, Masahiro Yamada wrote:
>
>>  >   "(oldconfig used to be more verbose)"
>
>>    The historical background is git.
>>    If people are interested in archeology,
>>    they would be able to do it by "git log", "git blame", etc.
>>    We are generally interested in the current behavior.
>
> I'd like to keep that sentence because it's there to explain the legacy and
> confusing "--silentoldconfig" name which unfortunately still sticks out in
> the *current* conf.c interface.
>
> +       printf("  --silentoldconfig       Similar to oldconfig but generates configuration in\n"
> +              "                          include/{generated/,config/} (oldconfig used to be more verbose)\n");
>
> The purpose of this sentence is to warn people that: "silentoldconfig is
> just archeology, so you can safely ignore it" and save them time.
>
> The alternative I considered was to entirely remove "silentconfig" not just
> from the Makefile's help but from the conf.c help too.
>
> Thoughts?


Another possibility might be to rename 'silentoldconfig'.
instead of explaining the background in the help message.

Your git-log 'internal interface' implies
renaming has no impact.

Commit fb16d8912db5268f29706010ecafff74b971c58d
renamed oldnoconfig to olddefconfig
to match the name to its behavior.

Then, I want to drop the 'oldnoconfig' alias:
https://patchwork.kernel.org/patch/10172375/


If we worry about the compatibility just in case,
we can keep 'silentoldconfig' as an alias as well.



It is difficult to suggest a clear name,
but 'syncconfig' is the one I came up with.

Please suggest if you have a better idea.


What do you think?

-- 
Best Regards
Masahiro Yamada
