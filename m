Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:60677 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753160AbbK3Igb (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 30 Nov 2015 03:36:31 -0500
Subject: Re: [PATCH 1/2] kbuild: add AFLAGS_REMOVE_(basename).o option
References: <1448103599-6660-1-git-send-email-heiko.carstens@de.ibm.com>
 <1448103599-6660-2-git-send-email-heiko.carstens@de.ibm.com>
 <20151130081708.GA4045@osiris>
From: Michal Marek <mmarek@suse.com>
Message-ID: <565C0A8D.2010900@suse.com>
Date: Mon, 30 Nov 2015 09:36:29 +0100
MIME-Version: 1.0
In-Reply-To: <20151130081708.GA4045@osiris>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Heiko Carstens <heiko.carstens@de.ibm.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Martin Schwidefsky <schwidefsky@de.ibm.com>

On 2015-11-30 09:17, Heiko Carstens wrote:
> On Sat, Nov 21, 2015 at 11:59:58AM +0100, Heiko Carstens wrote:
>> It is already possible to remove CFLAGS with the CFLAGS_REMOVE option
>> that was introduced with commit 656ee82cc855 ("kbuild: create new
>> CFLAGS_REMOVE_(basename).o option").  However it is not possible to
>> remove AFLAGS for assembler files.
>>
>> So this patch just adds the AFLAGS_REMOVE option which works the same
>> like CFLAGS_REMOVE.
>>
>> Signed-off-by: Heiko Carstens <heiko.carstens@de.ibm.com>
>> ---
>>  scripts/Makefile.lib | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
>> index 79e86613712f..26a48d76eb9d 100644
>> --- a/scripts/Makefile.lib
>> +++ b/scripts/Makefile.lib
>> @@ -104,8 +104,9 @@ modname_flags  = $(if $(filter 1,$(words $(modname))),\
>>  orig_c_flags   = $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS) $(KBUILD_SUBDIR_CCFLAGS) \
>>                   $(ccflags-y) $(CFLAGS_$(basetarget).o)
>>  _c_flags       = $(filter-out $(CFLAGS_REMOVE_$(basetarget).o), $(orig_c_flags))
>> -_a_flags       = $(KBUILD_CPPFLAGS) $(KBUILD_AFLAGS) $(KBUILD_SUBDIR_ASFLAGS) \
>> +orig_a_flags   = $(KBUILD_CPPFLAGS) $(KBUILD_AFLAGS) $(KBUILD_SUBDIR_ASFLAGS) \
>>                   $(asflags-y) $(AFLAGS_$(basetarget).o)
>> +_a_flags       = $(filter-out $(AFLAGS_REMOVE_$(basetarget).o), $(orig_a_flags))
>>  _cpp_flags     = $(KBUILD_CPPFLAGS) $(cppflags-y) $(CPPFLAGS_$(@F))
>>  
>>  #
> 
> Hello Michal,
> 
> since I didn't hear anything from you, I'll simply add this to the s390 tree.
> The patch should be trivial enough and is certainly not controversial.

Hi Heiko,

yes, please go ahead, the patch is fine.

Michal

