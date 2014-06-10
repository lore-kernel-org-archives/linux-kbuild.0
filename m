Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:59104 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751809AbaFJMrt (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 10 Jun 2014 08:47:49 -0400
Message-ID: <5396FE72.5030705@suse.cz>
Date: Tue, 10 Jun 2014 14:47:46 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] Documentation/kbuild/makefiles.txt: Improve description
 of lib-* targets
References: <20140511050252.19596.qmail@ns.horizon.com> <5373DE43.5010404@infradead.org> <20140516101433.GB10187@ravnborg.org>
In-Reply-To: <20140516101433.GB10187@ravnborg.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>, George Spelvin <linux@horizon.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-kbuild@vger.kernel.org, yann.morin.1998@free.fr

On 2014-05-16 12:14, Sam Ravnborg wrote:
> On Wed, May 14, 2014 at 02:21:07PM -0700, Randy Dunlap wrote:
>> On 05/10/2014 10:02 PM, George Spelvin wrote:
>>> I had to ask on the mailing list, so save developers the bother of
>>> answering the question again.  (Wanna-be kernel developers might also
>>> be helped, but who cares about them?)
>>>
>>> Signed-off-by: George Spelvin <linux@horizon.com>
>>> ---
>>> As with most documentation patches, this is also an exercise in eliciting
>>> corrections by proposing a wrong answer which will be jumped on.
>>
>> Hi Michal,
>>
>> Any comments on this patch?
>>
>> Thanks.
>>
>>>
>>>  Documentation/kbuild/makefiles.txt | 23 +++++++++++++++++++++--
>>>  1 file changed, 21 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/Documentation/kbuild/makefiles.txt b/Documentation/kbuild/makefiles.txt
>>> index d567a7cc55..f6cc266163 100644
>>> --- a/Documentation/kbuild/makefiles.txt
>>> +++ b/Documentation/kbuild/makefiles.txt
>>> @@ -237,10 +237,29 @@ more details, with real examples.
>>>  	be included in a library, lib.a.
>>>  	All objects listed with lib-y are combined in a single
>>>  	library for that directory.
>>> +
>>> +	The entire kernel is then linked against these libraries,
>>> +	so the linker will include the code in the final kernel only
>>> +	if it is referenced somewhere.  Thus, lib-* goals may be
>>> +	designed with false positives.
>>> +
>>>  	Objects that are listed in obj-y and additionally listed in
>>>  	lib-y will not be included in the library, since they will
>>>  	be accessible anyway.
>>> -	For consistency, objects listed in lib-m will be included in lib.a.
>>> +
>>> +	For consistency, objects listed in lib-m will be included
>>> +	in lib.a, but this will probably not do what you want.
> 
> So maybe we should catch this and error out?

(sorry for the late reply)

That makes sense to me. Check if $(lib-m) is non-empty and throw an
error. George, do you feel like submitting a patch that does this, plus
changing the documentation to clearly state that lib-* is only meant for
built-in code?

Thanks,
Michal
