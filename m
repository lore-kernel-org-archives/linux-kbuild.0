Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:58553 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754470Ab3KKSgJ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 11 Nov 2013 13:36:09 -0500
Message-ID: <528124A4.2040302@linux.intel.com>
Date: Mon, 11 Nov 2013 10:40:36 -0800
From: David Cohen <david.a.cohen@linux.intel.com>
MIME-Version: 1.0
Subject: Re: make oldnoconfig fix?
References: <52811DDD.3030609@linux.intel.com> <CAMP44s3MkOM99ao3z8h1zbg7mGq6wD7_2ZLiA7UgC+KufhjjPQ@mail.gmail.com>
In-Reply-To: <CAMP44s3MkOM99ao3z8h1zbg7mGq6wD7_2ZLiA7UgC+KufhjjPQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Felipe Contreras <felipe.contreras@gmail.com>
Cc: linux-kbuild@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Michal Marek <mmarek@suse.cz>, yann.morin.1998@free.fr, Steven Rostedt <rostedt@goodmis.org>

Hi Felipe,

On 11/11/2013 10:20 AM, Felipe Contreras wrote:
> Hi David,
>
> On Mon, Nov 11, 2013 at 12:11 PM, David Cohen
> <david.a.cohen@linux.intel.com> wrote:
>
>> Is there a plan to fix 'make oldnoconfig' option?
>> I currently have need to it :)
>
> I actually rely on this, but didn't know there was this option, this
> is what I've been doing since a long time:
>
>    % echo '' | make oldconfig
>
> But it's very hacky and I see tons of errors reported, but it does
> what I expect.

Thanks for the tip. I'll give it a try.

Br, David
