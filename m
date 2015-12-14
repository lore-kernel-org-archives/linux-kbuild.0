Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:39791 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752730AbbLNRQx (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 14 Dec 2015 12:16:53 -0500
Subject: Re: [PATCH] kbuild: support make dir/file.i for *.S
References: <20151210163329.GA18947@udknight>
 <CAMzpN2jG+mKQdAxKnvTebQtF1J79pC+E4QxELLO_C2K6ZR8PzA@mail.gmail.com>
 <20151214161401.GA8036@udknight>
From: Michal Marek <mmarek@suse.com>
Message-ID: <566EF982.7040404@suse.com>
Date: Mon, 14 Dec 2015 18:16:50 +0100
MIME-Version: 1.0
In-Reply-To: <20151214161401.GA8036@udknight>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Wang YanQing <udknight@gmail.com>, Brian Gerst <brgerst@gmail.com>, linux-kbuild@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, yamada.masahiro@socionext.com

Dne 14.12.2015 v 17:14 Wang YanQing napsal(a):
> On Sat, Dec 12, 2015 at 02:13:03PM -0500, Brian Gerst wrote:
>> On Thu, Dec 10, 2015 at 11:33 AM, Wang YanQing <udknight@gmail.com> wrote:
>>> This feature could reduce a little time to expand all
>>> the macros in *.S for reading.
>>>
>>> Signed-off-by: Wang YanQing <udknight@gmail.com>
>>> ---
>>>  Makefile               | 2 ++
>>>  scripts/Makefile.build | 6 ++++++
>>>  2 files changed, 8 insertions(+)
>>>
>>> diff --git a/Makefile b/Makefile
>>> index 7558c9c..d7e2060 100644
>>> --- a/Makefile
>>> +++ b/Makefile
>>> @@ -1552,6 +1552,8 @@ endif
>>>         $(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
>>>  %.s: %.S prepare scripts FORCE
>>>         $(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
>>> +%.i: %.S prepare scripts FORCE
>>> +       $(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
>>>  %.o: %.S prepare scripts FORCE
>>>         $(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
>>>  %.symtypes: %.c prepare scripts FORCE
>>> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
>>> index 2c47f9c..2a51d49 100644
>>> --- a/scripts/Makefile.build
>>> +++ b/scripts/Makefile.build
>>> @@ -287,6 +287,12 @@ cmd_as_s_S       = $(CPP) $(a_flags)   -o $@ $<
>>>  $(obj)/%.s: $(src)/%.S FORCE
>>>         $(call if_changed_dep,as_s_S)
>>>
>>> +quiet_cmd_cc_i_S = CPP $(quiet_modtag) $@
>>> +cmd_cc_i_S       = $(CPP) $(a_flags)   -o $@ $<
>>> +
>>> +$(obj)/%.i: $(src)/%.S FORCE
>>> +       $(call if_changed_dep,cc_i_S)
>>> +
>>>  quiet_cmd_as_o_S = AS $(quiet_modtag)  $@
>>>  cmd_as_o_S       = $(CC) $(a_flags) -c -o $@ $<
>>
>> *.s (lower case) is the suffix used for preprocessed assembly files,
>> and there is already a rule for that.  *.i is for preprocessed C
>> files.
> 
> Agreed, you are right!

Ah, I missed. I'll revert the patch in the kbuild tree.

Michal

