Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:50664 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754576Ab3BPWEL (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 16 Feb 2013 17:04:11 -0500
Message-ID: <5120024B.7070800@suse.cz>
Date: Sat, 16 Feb 2013 23:03:55 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [RFC][PATCH] kernel: Replace timeconst.pl with a bc script
References: <1360883635-25268-1-git-send-email-hpa@zytor.com> <511EC7AA.1040606@suse.cz> <511EC849.6030400@zytor.com>
In-Reply-To: <511EC849.6030400@zytor.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-kbuild@vger.kernel.org, mingo@kernel.org, tglx@linutronix.de, Andrew Morton <akpm@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>

Dne 16.2.2013 00:44, H. Peter Anvin napsal(a):
> On 02/15/2013 03:41 PM, Michal Marek wrote:
>> I can merge it into the kbuild tree if wanted. I only have one nipick:
>>
>>> +/* Division by reciprocal multiplication. */
>>> +define fmul(b,n,d) {
>>> +       return (2^b*n+d-1)/d;
>>> +}
>>
>> For readability reasons, I suggest to use the same formatting of
>> expressions and argument lists like in C:
>>
>> define fmul(b, n, d) {
>>         return (2^b * n + d - 1) / d;
>> }
>>
>> Otherwise, you can add
>>
> 
> Do you actually think that is more readable?  Personally, I think it
> made it harder to read just because it takes up more space than one can
> quickly glance at.

I personally find the wider version more readable, but I don't care that
much.

Michal
