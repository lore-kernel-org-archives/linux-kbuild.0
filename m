Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from wf-out-1314.google.com ([209.85.200.170]:43522 "EHLO
	wf-out-1314.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751096AbZFFFkj (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 6 Jun 2009 01:40:39 -0400
Received: by wf-out-1314.google.com with SMTP id 26so860534wfd.4
        for <linux-kbuild@vger.kernel.org>; Fri, 05 Jun 2009 22:40:41 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20090606051823.GA16127@synapse.neuralscape.com>
References: <55c333c0906050631y6ca1b676q94dd8ec324c9ba7@mail.gmail.com>
	 <20090606051823.GA16127@synapse.neuralscape.com>
Date: Sat, 6 Jun 2009 08:40:39 +0300
Message-ID: <55c333c0906052240p71168d37q7c1a0b71fbe1f59f@mail.gmail.com>
Subject: Re: Building a 32 bit on a 64 bit machine.
From: Kevin Wilson <wkevils@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Karen Shaeffer <shaeffer@neuralscape.com>
Cc: linux-kbuild@vger.kernel.org

Hello,
   I know that using cross compiler is needed when you want to compile
for different platforms (for example, to build a module for ARM or PPC on intel
machine).
I did not mention it, but the machine I am building on is an Intel
x86_64 machine, and I want to build on it a 32 bit module - also for
Intel machine.
So I believe there should be a way to do it with some gcc flag.

Any ideas ?

Rgs,
Kevin

On Sat, Jun 6, 2009 at 8:18 AM, Karen Shaeffer<shaeffer@neuralscape.com> wrote:
> On Fri, Jun 05, 2009 at 04:31:50PM +0300, Kevin Wilson wrote:
>> Hello,
>> I want to build a module I developed for 32 bit on a 64 bit machine.
>> It is on a machine running Fedora.
>>
>> Rgs,
>> Kevin
>
> Hi Kevin,
> You need a cross compile tool chain. You can learn about that
> here:
> http://cross-lfs.org/view/1.1.0/x86_64/introduction/chapter.html
>
> You'll also need to port your module to 64 bits.
>
> Good luck with it,
> Karen
> --
>  Karen Shaeffer
>  Neuralscape, Palo Alto, Ca. 94306
>  shaeffer@neuralscape.com  http://www.neuralscape.com
>
