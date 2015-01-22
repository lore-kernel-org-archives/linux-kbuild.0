Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lebrac.rtp-net.org ([195.154.106.105]:47421 "EHLO
	lebrac.rtp-net.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752530AbbAVP6o (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 22 Jan 2015 10:58:44 -0500
From: Arnaud Patard (Rtp) <arnaud.patard@rtp-net.org>
Subject: Re: [PATCHv2 1/1] deb-pkg: Add device tree blobs to the package
References: <20150114123201.434698327@rtp-net.org>
	<20150114123658.185884720@rtp-net.org>
	<1421239885.19708.82.camel@decadent.org.uk>
	<87lhkyictc.fsf@lebrac.rtp-net.org>
	<1421769898.31046.194.camel@decadent.org.uk> <54C0FDDD.10805@suse.cz>
	<1421936376.31046.211.camel@decadent.org.uk>
	<54C11776.2070808@suse.cz>
Date: Thu, 22 Jan 2015 16:58:13 +0100
In-Reply-To: <54C11776.2070808@suse.cz> (Michal Marek's message of "Thu, 22
	Jan 2015 16:29:58 +0100")
Message-ID: <87d266iz8q.fsf@lebrac.rtp-net.org>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Ben Hutchings <ben@decadent.org.uk>, linux-kbuild@vger.kernel.org, maximilian attems <max@stro.at>

Michal Marek <mmarek@suse.cz> writes:

> On 2015-01-22 15:19, Ben Hutchings wrote:
>> On Thu, 2015-01-22 at 14:40 +0100, Michal Marek wrote:
>>> On 2015-01-20 17:04, Ben Hutchings wrote:
>>>> On Tue, 2015-01-20 at 00:13 +0100, Arnaud Patard wrote:
>>>>> Ben Hutchings <ben@decadent.org.uk> writes:
>>>>>> Only arm and arm64 support that target.  You should maybe run something
>>>>>> like 'make -n dtbs_install >/dev/null 2>&1' first to check that the
>>>>>> target is defined.
>>>>>
>>>>> There's a 'set -e' on top of the script so using make -n will likely
>>>>> result in the script failing, which wouldn't be so nice imho.
>>>> [...]
>>>>
>>>> That's why you use it with the if statement:
>>>>
>>>> # Only some architectures with OF support have this target
>>>> if make -n dtbs_install >/dev/null 2>&1; then
>>>
>>> The problem is that kbuild does not support make -n and some of the
>>> commands are always executed. So the command will silently build the
>>> blobs and just not install them.
>> 
>> If the dtbs_install target is defined, they should already have been
>> built at this point.  If the target is not defined, why would it do
>> anything?
>
> The point is that make -n does not work with kbuild. It might work for
> this specific case, but there is no guarantee that it will continue to
> do so.
>

Ok, so a patch with make -n will be refused, right ?

>
>>> if grep -q dtbs_install "arch/$SRCARCH/Makefile"; then
>>>   ...
>>>
>>> and hope that there won't be any comment causing a false positive.
>>> Another option is to grep 'make help' output.
>> 
>> Ugh.
>
> I know that both options are ugly :).

Let's go to your first options then. I feel not really motivated by
parsing 'make help' output.

Arnaud
