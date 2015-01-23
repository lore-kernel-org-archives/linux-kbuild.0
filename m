Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:35684 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754316AbbAWJzX (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 23 Jan 2015 04:55:23 -0500
Message-ID: <54C21A88.70505@suse.cz>
Date: Fri, 23 Jan 2015 10:55:20 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCHv2 1/1] deb-pkg: Add device tree blobs to the package
References: <20150114123201.434698327@rtp-net.org>	<20150114123658.185884720@rtp-net.org>	<1421239885.19708.82.camel@decadent.org.uk>	<87lhkyictc.fsf@lebrac.rtp-net.org>	<1421769898.31046.194.camel@decadent.org.uk> <54C0FDDD.10805@suse.cz>	<1421936376.31046.211.camel@decadent.org.uk>	<54C11776.2070808@suse.cz> <87d266iz8q.fsf@lebrac.rtp-net.org>
In-Reply-To: <87d266iz8q.fsf@lebrac.rtp-net.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Arnaud Patard (Rtp)" <arnaud.patard@rtp-net.org>
Cc: Ben Hutchings <ben@decadent.org.uk>, linux-kbuild@vger.kernel.org, maximilian attems <max@stro.at>

On 2015-01-22 16:58, Arnaud Patard (Rtp) wrote:
> Michal Marek <mmarek@suse.cz> writes:
> 
>> On 2015-01-22 15:19, Ben Hutchings wrote:
>>> On Thu, 2015-01-22 at 14:40 +0100, Michal Marek wrote:
>>>> On 2015-01-20 17:04, Ben Hutchings wrote:
>>>>> On Tue, 2015-01-20 at 00:13 +0100, Arnaud Patard wrote:
>>>>>> Ben Hutchings <ben@decadent.org.uk> writes:
>>>>>>> Only arm and arm64 support that target.  You should maybe run something
>>>>>>> like 'make -n dtbs_install >/dev/null 2>&1' first to check that the
>>>>>>> target is defined.
>>>>>>
>>>>>> There's a 'set -e' on top of the script so using make -n will likely
>>>>>> result in the script failing, which wouldn't be so nice imho.
>>>>> [...]
>>>>>
>>>>> That's why you use it with the if statement:
>>>>>
>>>>> # Only some architectures with OF support have this target
>>>>> if make -n dtbs_install >/dev/null 2>&1; then
>>>>
>>>> The problem is that kbuild does not support make -n and some of the
>>>> commands are always executed. So the command will silently build the
>>>> blobs and just not install them.
>>>
>>> If the dtbs_install target is defined, they should already have been
>>> built at this point.  If the target is not defined, why would it do
>>> anything?
>>
>> The point is that make -n does not work with kbuild. It might work for
>> this specific case, but there is no guarantee that it will continue to
>> do so.
>>
> 
> Ok, so a patch with make -n will be refused, right ?

I'm not trying to veto such patch, I just wanted to point out that make
-n is not the best idea to do with kbuild.


> Let's go to your first options then. I feel not really motivated by
> parsing 'make help' output.

Whatever. You can also have a static list of archs supporting
dtbs_install, like we (still) have in scripts/headers.sh. It would be
guaranteed to works as designed, but obviously not future-proof.

Michal
