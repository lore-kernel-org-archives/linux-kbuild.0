Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:46776 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751450AbeAZXAp (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 26 Jan 2018 18:00:45 -0500
Subject: Re: [PATCH] Remove silentoldconfig from "make help"; fix
 kconfig/conf's help
References: <20171219012656.23728-1-marc.herbert@intel.com>
 <CAK7LNAR8HedCgZAk1fY9rA8HERh5weQCjWXkP2SXuhzRRWVhVQ@mail.gmail.com>
 <070e7d03-b1a7-430f-709b-bb5fe9e2a0a3@intel.com>
 <CAK7LNASR8Qmo85FGr0wW-4t2_uTmDZVSituLLuRm73_+Qqstmw@mail.gmail.com>
 <f7008e72-e762-a86d-8a39-415eae55dae9@intel.com>
 <CAK7LNAQA8gB1iijS5uoVFdVc-UoyyAQN+N8GvXpw9aR7Jp8dyA@mail.gmail.com>
From: Marc Herbert <Marc.Herbert@intel.com>
Message-ID: <594ca2cb-5a21-2bba-4132-73d42f3a909a@intel.com>
Date: Fri, 26 Jan 2018 15:00:44 -0800
MIME-Version: 1.0
In-Reply-To: <CAK7LNAQA8gB1iijS5uoVFdVc-UoyyAQN+N8GvXpw9aR7Jp8dyA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Thiago Macieira <thiago.macieira@intel.com>, Josh Triplett <josh@joshtriplett.org>, Guenter Roeck <groeck@google.com>, Wayne Boyer <wayne.boyer@intel.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Sam Ravnborg <sam@ravnborg.org>

Masahiro,

On 17/01/2018 20:31, Masahiro Yamada wrote: 

> Sorry for my late reply.

I think we're even now :-)

>> I'd like to keep that sentence because it's there to explain the legacy and
>> confusing "--silentoldconfig" name which unfortunately still sticks out in
>> the *current* conf.c interface.
>>
>> +       printf("  --silentoldconfig       Similar to oldconfig but generates configuration in\n"
>> +              "                          include/{generated/,config/} (oldconfig used to be more verbose)\n");
>>
>> The purpose of this sentence is to warn people that: "silentoldconfig is
>> just archeology, so you can safely ignore it" and save them time.
>>
>> The alternative I considered was to entirely remove "silentconfig" not just
>> from the Makefile's help but from the conf.c help too.
 
> 
> Another possibility might be to rename 'silentoldconfig'.
> instead of explaining the background in the help message.
> [...]
> It is difficult to suggest a clear name,
> but 'syncconfig' is the one I came up with.
> 
> Please suggest if you have a better idea.

Look like a good idea and name to me but... for a different, bigger
and later commit.

> Commit fb16d8912db5268f29706010ecafff74b971c58d
> renamed oldnoconfig to olddefconfig...

... but it didn't remove any "now internal API" from "make help". Instead it
changed the name of an external and preserved "API".

> If we worry about the compatibility just in case,
> we can keep 'silentoldconfig' as an alias as well.

Yes - but later?

In the meantime I found another instance of silentoldconfig in
Documentation/admin-guide/; posting v3 with that removed too.
I'm also adding some deprecation comments in the source.

-- 
Marc
