Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from gate.crashing.org ([63.228.1.57]:45646 "EHLO gate.crashing.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757143AbZLNMV1 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 14 Dec 2009 07:21:27 -0500
In-Reply-To: <20091214100613.GA21769@sepie.suse.cz>
References: <1260615744-23165-1-git-send-email-mmarek@suse.cz> <BECBC631-3E9B-48EF-AA08-5C37806C4A7D@kernel.crashing.org> <20091214100613.GA21769@sepie.suse.cz>
Mime-Version: 1.0 (Apple Message framework v753.1)
Content-Type: text/plain; charset=US-ASCII; delsp=yes; format=flowed
Message-Id: <3807088D-7DBE-4966-97A7-457D0E46136D@kernel.crashing.org>
Content-Transfer-Encoding: 7bit
From: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH] modpost: fix segfault with short symbol names
Date: Mon, 14 Dec 2009 13:29:57 +0100
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Rusty Russell <rusty@rustcorp.com.au>, linux-kbuild@vger.kernel.org

>>> memcmp() is wrong here, the symbol name can be shorter than
>>> KSYMTAB_PFX
>>> or CRC_PFX.
>>
>>> -		if (memcmp(symname, CRC_PFX, strlen(CRC_PFX)) == 0) {
>>> +		if (strncmp(symname, CRC_PFX, strlen(CRC_PFX)) == 0) {
>>
>> This doesn't change anything.  In both cases the function will  
>> return 0
>> only if all strlen(CRC_PFX) chars match, and in both cases it can  
>> access
>> strlen(CRC_PFX) chars (strncmp() is allowed to access characters  
>> after
>> the first \0 just fine).
>
> str(n)cmp is not allowed to access characters past the NUL byte.

You are wrong.  strncmp() _is_ allowed to do that.  So this patch
doesn't change anything.


Segher

