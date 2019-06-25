Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:32906 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726707AbfFYNYa (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 25 Jun 2019 09:24:30 -0400
Subject: Re: [PATCH v4 00/10] klp-convert livepatch build tooling
References: <20190509143859.9050-1-joe.lawrence@redhat.com>
 <alpine.LSU.2.21.1906131451560.22698@pobox.suse.cz>
 <b1a627a4-3702-9689-6c03-0c2123c06a2d@redhat.com>
 <c9021573-11c6-b576-0aa6-97754c98a06e@redhat.com>
 <20190614083435.uq3mk6mprbatysol@pathway.suse.cz>
 <alpine.LSU.2.21.1906251324450.12085@pobox.suse.cz>
From: Joe Lawrence <joe.lawrence@redhat.com>
Message-ID: <76da6ab0-5540-d9ff-c5ea-6dc31a39c744@redhat.com>
Date: Tue, 25 Jun 2019 09:24:20 -0400
MIME-Version: 1.0
In-Reply-To: <alpine.LSU.2.21.1906251324450.12085@pobox.suse.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>
Cc: linux-kernel@vger.kernel.org, live-patching@vger.kernel.org, linux-kbuild@vger.kernel.org

On 6/25/19 7:36 AM, Miroslav Benes wrote:
> 
 > [ ... snip ... ]
 >
> So I made a couple of experiments and found that GCC is somehow involved.
> If klp-convert (from scripts/livepatch/) is compiled with our GCC 4.8.5
> from SLE12, the output is incorrect. If I compile it with GCC 7.4.0 from
> openSUSE Leap 15.1, the output is correct.
> 
> If I revert commit d59cadc0a8f8 ("[squash] klp-convert: make
> convert_rela() list-safe") (from Joe's expanded github tree), the problem
> disappears.
> 
> I haven't spotted any problem in the code and I cannot explain a
> dependency on GCC version. Any ideas?
> 

Thanks for revisiting and debugging this.  Narrowing it down to my "fix" 
to convert_rela() should be helpful.

In my case, I was probably testing with RHEL-8, which has gcc 8.2 vs 
RHEL-7 which has gcc 4.8.  I'll have to make sure to try with a few 
different versions for the next round.

-- Joe
