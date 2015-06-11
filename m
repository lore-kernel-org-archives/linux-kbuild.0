Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.emea.novell.com ([130.57.118.101]:34149 "EHLO
	mail.emea.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752361AbbFKMlb convert rfc822-to-8bit (ORCPT
	<rfc822;groupwise-linux-kbuild@vger.kernel.org:4:1>);
	Thu, 11 Jun 2015 08:41:31 -0400
Message-Id: <55799E180200007800083A99@mail.emea.novell.com>
Date: Thu, 11 Jun 2015 13:41:28 +0100
From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 2/3] kconfig: don't silently ignore unhandled
 characters
References: <54BE5DB00200007800057062@mail.emea.novell.com>
 <557980BE.6030601@suse.cz>
In-Reply-To: <557980BE.6030601@suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: akpm@linux-foundation.org, pebolle@tiscali.nl, linux-kbuild@vger.kernel.org

>>> On 11.06.15 at 14:36, <mmarek@suse.cz> wrote:
> On 2015-01-20 13:52, Jan Beulich wrote:
>> At the very least we should tell people that what they wrote is not
>> what the utility understands.
>> 
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> Acked-by: Paul Bolle <pebolle@tiscali.nl>
>> ---
>> v3: Split off sound/soc/intel/Kconfig change.
>> v2: printf() -> fprintf(stderr, ) upon Paul Bolle's request. Replace
>>     two instances of double backslash line continuations with single
>>     ones in sound/soc/intel/Kconfig.
> 
> Sorry, I completely missed v3 of this series. I applied this patch to
> kbuild.git#kconfig now.

Thanks. What about patch 3 (which earlier on you said something
like "nice" in reply, making me assume it would be taken too) then?

Jan

