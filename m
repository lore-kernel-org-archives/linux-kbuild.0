Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:54227 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750801AbaFJKEJ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 10 Jun 2014 06:04:09 -0400
Message-ID: <5396D816.5010208@suse.cz>
Date: Tue, 10 Jun 2014 12:04:06 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH 0/7] scripts: objdiff: various clean-up, fix and new features
References: <1401448315-800-1-git-send-email-yamada.m@jp.panasonic.com> <20140606153851.GM8664@titan.lakedaemon.net> <20140609112104.95AF.AA925319@jp.panasonic.com>
In-Reply-To: <20140609112104.95AF.AA925319@jp.panasonic.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.m@jp.panasonic.com>, Jason Cooper <jason@lakedaemon.net>
Cc: linux-kbuild@vger.kernel.org

On 2014-06-09 04:21, Masahiro Yamada wrote:
> Hi Jason,
> 
> On Fri, 6 Jun 2014 11:38:51 -0400
> Jason Cooper <jason@lakedaemon.net> wrote:
> 
>> Masahiro,
>>
>> On Fri, May 30, 2014 at 08:11:48PM +0900, Masahiro Yamada wrote:
>>> Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
>>> Cc: Jason Cooper <jason@lakedaemon.net>
>>>
>>> Masahiro Yamada (7):
>>>   scripts: objdiff: get the path to .tmp_objdiff more simply
>>>   scripts: objdiff: direct error messages to stderr
>>>   scripts: objdiff: remove unnecessary code
>>>   scripts: objdiff: improve path flexibility for record command
>>>   scripts: objdiff: change the extension of disassembly from .o to .dis
>>>   scripts: objdiff: fix a comment
>>>   scripts: objdiff: support directories for the augument of record
>>>     command
>>>
>>>  scripts/objdiff | 74 +++++++++++++++++++++++++++++++++++----------------------
>>>  1 file changed, 46 insertions(+), 28 deletions(-)
>>
>> Other than the few minor things I noted on the individual patches,
>>
>> Acked-by: Jason Cooper <jason@lakedaemon.net>
>>
>> Great patch series!
>>
>> thx,
>>
>> Jason.
> 
> Thanks for your review!
> 
> I've sent v2 with minor fixes:
>   - s/reltive/relative/
>   - s/clearer/cleaner/

And I just applied v2 to kbuild.git#misc.

Michal

