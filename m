Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from vms173015pub.verizon.net ([206.46.173.15]:34104 "EHLO
	vms173015pub.verizon.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751930Ab2LKCTf (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 10 Dec 2012 21:19:35 -0500
Received: from mail-bk0-f46.google.com ([unknown] [209.85.214.46])
 by vms173015.mailsrvcs.net
 (Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16 2009))
 with ESMTPA id <0MEU00M1NEBPHD10@vms173015.mailsrvcs.net> for
 linux-kbuild@vger.kernel.org; Mon, 10 Dec 2012 19:19:02 -0600 (CST)
Received: by mail-bk0-f46.google.com with SMTP id q16so1366038bkw.19 for
 <linux-kbuild@vger.kernel.org>; Mon, 10 Dec 2012 17:19:00 -0800 (PST)
MIME-version: 1.0
In-reply-to: <87d2yiepkp.fsf@rustcorp.com.au>
References: <1353269117-39917-1-git-send-email-pefoley2@verizon.net>
 <1353269117-39917-2-git-send-email-pefoley2@verizon.net>
 <20121209165425.GA29331@pobox.suse.cz> <87d2yiepkp.fsf@rustcorp.com.au>
From: Peter Foley <pefoley2@verizon.net>
Date: Mon, 10 Dec 2012 20:18:40 -0500
Message-id: <CAOFdcFP_mzGDkaNyve_Djmy+B-_8u1C62Wt4LizhPTGJv9wBMg@mail.gmail.com>
Subject: Re: [PATCH 2/5] kbuild: silence rule for extra_certificates
Content-type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: Michal Marek <mmarek@suse.cz>, David Howells <dhowells@redhat.com>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

On Sun, Dec 9, 2012 at 7:08 PM, Rusty Russell <rusty@rustcorp.com.au> wrote:
> Michal Marek <mmarek@suse.cz> writes:
>> Added David and Rusty.
>>
>> On Sun, Nov 18, 2012 at 03:05:14PM -0500, pefoley2@verizon.net wrote:
>>> From: Peter Foley <pefoley2@verizon.net>
>>>
>>> Silence the touch extra_certificates command
>>>
>>> Signed-off-by: Peter Foley <pefoley2@verizon.net>
>>
>> I think we should tell the user that the default empty extra
>> certificates list is being used, in case the user used a wrong filename
>> or similar. How about this?
>
> I prefer this one... Peter?
>
> Thanks,
> Rusty.
>

Looks good to me.

Thanks,

Peter
