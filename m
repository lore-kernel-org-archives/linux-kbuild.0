Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from condef001-v.nifty.com ([210.131.4.238]:60200 "EHLO
	condef001-v.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751182AbbLMISr (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 13 Dec 2015 03:18:47 -0500
Received: from conssluserg001-v.nifty.com ([10.16.229.200])by condef001-v.nifty.com with ESMTP id tBD8HvqK026248
	for <linux-kbuild@vger.kernel.org>; Sun, 13 Dec 2015 17:17:57 +0900
MIME-Version: 1.0
In-Reply-To: <CAMzpN2jG+mKQdAxKnvTebQtF1J79pC+E4QxELLO_C2K6ZR8PzA@mail.gmail.com>
References: <20151210163329.GA18947@udknight>
	<CAMzpN2jG+mKQdAxKnvTebQtF1J79pC+E4QxELLO_C2K6ZR8PzA@mail.gmail.com>
Date: Sun, 13 Dec 2015 17:17:31 +0900
Message-ID: <CAK7LNAR6AWS7VeaSVi+N7eBUeO2yq1pXvf+ucTT0jM00jsKHbg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: support make dir/file.i for *.S
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Brian Gerst <brgerst@gmail.com>
Cc: Wang YanQing <udknight@gmail.com>, Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2015-12-13 4:13 GMT+09:00 Brian Gerst <brgerst@gmail.com>:
> On Thu, Dec 10, 2015 at 11:33 AM, Wang YanQing <udknight@gmail.com> wrote:
>> This feature could reduce a little time to expand all
>> the macros in *.S for reading.
>>
>> Signed-off-by: Wang YanQing <udknight@gmail.com>
>> ---
>>  Makefile               | 2 ++
>>  scripts/Makefile.build | 6 ++++++
>>  2 files changed, 8 insertions(+)
>>
>> diff --git a/Makefile b/Makefile
>> index 7558c9c..d7e2060 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -1552,6 +1552,8 @@ endif
>>         $(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
>>  %.s: %.S prepare scripts FORCE
>>         $(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
>> +%.i: %.S prepare scripts FORCE
>> +       $(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
>>  %.o: %.S prepare scripts FORCE
>>         $(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
>>  %.symtypes: %.c prepare scripts FORCE
>> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
>> index 2c47f9c..2a51d49 100644
>> --- a/scripts/Makefile.build
>> +++ b/scripts/Makefile.build
>> @@ -287,6 +287,12 @@ cmd_as_s_S       = $(CPP) $(a_flags)   -o $@ $<
>>  $(obj)/%.s: $(src)/%.S FORCE
>>         $(call if_changed_dep,as_s_S)
>>
>> +quiet_cmd_cc_i_S = CPP $(quiet_modtag) $@
>> +cmd_cc_i_S       = $(CPP) $(a_flags)   -o $@ $<
>> +
>> +$(obj)/%.i: $(src)/%.S FORCE
>> +       $(call if_changed_dep,cc_i_S)
>> +
>>  quiet_cmd_as_o_S = AS $(quiet_modtag)  $@
>>  cmd_as_o_S       = $(CC) $(a_flags) -c -o $@ $<
>
> *.s (lower case) is the suffix used for preprocessed assembly files,
> and there is already a rule for that.  *.i is for preprocessed C
> files.
>

Right.  We already support *.s and it is completely the same as
what this patch adds (except that *.i is now an alias of *.s,
which is also wrong as Brian pointed out.)

quiet_cmd_as_s_S = CPP $(quiet_modtag) $@
cmd_as_s_S       = $(CPP) $(a_flags)   -o $@ $<

$(obj)/%.s: $(src)/%.S FORCE
         $(call if_changed_dep,as_s_S)


-- 
Best Regards
Masahiro Yamada
