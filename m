Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:41376 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932190Ab1EYUbZ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 25 May 2011 16:31:25 -0400
Message-ID: <4DDD675B.6030405@suse.cz>
Date: Wed, 25 May 2011 22:32:27 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH v2] x86: Do not set the root_dev field in bzImage
References: <20110411150820.GA22004@sepie.suse.cz> <1302607824-24699-1-git-send-email-mmarek@suse.cz> <4DCAA99B.1070208@suse.cz>
In-Reply-To: <4DCAA99B.1070208@suse.cz>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org, x86@kernel.org
Cc: linux-kbuild@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Paul Bolle <pebolle@tiscali.nl>

Dne 11.5.2011 17:22, Michal Marek napsal(a):
> On 12.4.2011 13:30, Michal Marek wrote:
>> This has been obsoleted by the root= commandline for several years.
>> People who still depend on this will surely have a copy of the rdev
>> command around, the rest of the world gets rid of another piece of
>> buildhost-dependent data in the build. Thanks to Paul Bolle for the
>> build.c cleanup.
>>
>> Cc: Thomas Gleixner<tglx@linutronix.de>
>> Cc: Ingo Molnar<mingo@redhat.com>
>> Cc: "H. Peter Anvin"<hpa@zytor.com>
>> Cc: x86@kernel.org
>> Cc: Paul Bolle<pebolle@tiscali.nl>
>> Signed-off-by: Michal Marek<mmarek@suse.cz>
> 
> Hi,
> 
> Is this patch OK for the tip tree?

Hi,

I don't see the patch in today's linux-next. Can I get an Acked-by: to
apply it to kbuild-2.6.git or can someone apply it to the tip tree?
Thanks a lot.

Michal
