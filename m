Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from terminus.zytor.com ([198.137.202.10]:38938 "EHLO mail.zytor.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750924Ab3BOXqP (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 15 Feb 2013 18:46:15 -0500
Message-ID: <511EC849.6030400@zytor.com>
Date: Fri, 15 Feb 2013 15:44:09 -0800
From: "H. Peter Anvin" <hpa@zytor.com>
MIME-Version: 1.0
Subject: Re: [RFC][PATCH] kernel: Replace timeconst.pl with a bc script
References: <1360883635-25268-1-git-send-email-hpa@zytor.com> <511EC7AA.1040606@suse.cz>
In-Reply-To: <511EC7AA.1040606@suse.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, mingo@kernel.org, tglx@linutronix.de, Andrew Morton <akpm@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>

On 02/15/2013 03:41 PM, Michal Marek wrote:
> I can merge it into the kbuild tree if wanted. I only have one nipick:
>
>> +/* Division by reciprocal multiplication. */
>> +define fmul(b,n,d) {
>> +       return (2^b*n+d-1)/d;
>> +}
>
> For readability reasons, I suggest to use the same formatting of
> expressions and argument lists like in C:
>
> define fmul(b, n, d) {
>         return (2^b * n + d - 1) / d;
> }
>
> Otherwise, you can add
>

Do you actually think that is more readable?  Personally, I think it 
made it harder to read just because it takes up more space than one can 
quickly glance at.

	-hpa
-- 
H. Peter Anvin, Intel Open Source Technology Center
I work for Intel.  I don't speak on their behalf.

