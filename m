Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from nat28.tlf.novell.com ([130.57.49.28]:33067 "EHLO
	nat28.tlf.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754262Ab2ISLuJ convert rfc822-to-8bit (ORCPT
	<rfc822;groupwise-linux-kbuild@vger.kernel.org:3:1>);
	Wed, 19 Sep 2012 07:50:09 -0400
Message-Id: <5059CD8F020000780009C4BD@nat28.tlf.novell.com>
Date: Wed, 19 Sep 2012 12:50:07 +0100
From: "Jan Beulich" <JBeulich@suse.com>
Subject: RE: [PATCH] firmware: fix directory creation rule matching
 with make 3.80
References: <1347975403-30332-1-git-send-email-mark.asselstine@windriver.com>
 <1347984591-11064-1-git-send-email-mark.asselstine@windriver.com>
In-Reply-To: <1347984591-11064-1-git-send-email-mark.asselstine@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: dwmw2@infradead.org, mmarek@suse.cz, Mark Asselstine <mark.asselstine@windriver.com>
Cc: linux-kbuild@vger.kernel.org

>>> On 18.09.12 at 18:09, Mark Asselstine <mark.asselstine@windriver.com> wrote:
>>  commit 6c7080a61fc7 [firmware: fix directory creation rule matching
>> with make 3.82] broke builds with make 3.80. This is caused by the
>> literal substitution behaving differently with this version of
>> make. The following works with make 3.82, 3.81 and 3.80.
>> 
>> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
>> ---
>> 
>> Jan I was able to reproduce your error and this change fixes it, can
>> you try this out? I would prefer to keep things working with the
>> latest versions of make. I am still looking into any possible
>> consequences of removing the double dollar sign.
>> 
>>  scripts/Makefile.fwinst |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>> 
>> diff --git a/scripts/Makefile.fwinst b/scripts/Makefile.fwinst
>> index c3f69ae..e264fab 100644
>> --- a/scripts/Makefile.fwinst
>> +++ b/scripts/Makefile.fwinst
>> @@ -42,7 +42,7 @@ quiet_cmd_install = INSTALL $(subst $(srctree)/,,$@)
>>  $(installed-fw-dirs):
>>  	$(call cmd,mkdir)
>>  
>> -$(installed-fw): $(INSTALL_FW_PATH)/%: $(obj)/% | $$(dir $(INSTALL_FW_PATH)/%)
>> +$(installed-fw): $(INSTALL_FW_PATH)/%: $(obj)/% | $(dir $(INSTALL_FW_PATH)/%)

This would clearly break the .SECONDEXPANSION expectations (or
otherwise the double-$ wouldn't have been needed in the first
place).

> Actually I believe this should be
> +$(installed-fw): $(INSTALL_FW_PATH)/%: $(obj)/% | $(dir $(INSTALL_FW_PATH)/$$(%))

This one can't be right either, for the same reason.

The main thing, afaict, is that your initial patch disconnected the
rule here from the PHONY addition (and the corresponding fallback
rule) a few lines up. And I can't see how to restore the connection
reliably (the fact that $(dir) was reported as missing dependency
suggests that using this for the PHONY addition and fallback line
instead might be possible, but it would need to be clarified where
the $(INSTALL_FW_PATH)/% (i.e. the argument to $(dir )) went,
and hence whether $(dir) wouldn't, e.g. for a non-empty
$(INSTALL_FW_PATH), expand to something else.

Jan

