Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:37329 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S964963Ab3HIPfs (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 9 Aug 2013 11:35:48 -0400
Message-ID: <52050C4B.2060606@suse.cz>
Date: Fri, 09 Aug 2013 17:35:39 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] kbuild: Allow scripts/* to be cross compiled
References: <1376046432-12588-1-git-send-email-broonie@kernel.org> <20130809123251.GB5794@merkur.ravnborg.org> <20130809150031.GE6427@sirena.org.uk> <20130809151346.GA6021@merkur.ravnborg.org> <20130809152748.GF6427@sirena.org.uk>
In-Reply-To: <20130809152748.GF6427@sirena.org.uk>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>, linaro-kernel@lists.linaro.org, linux-kbuild@vger.kernel.org, John Rigby <john.rigby@linaro.org>

On 9.8.2013 17:27, Mark Brown wrote:
> On Fri, Aug 09, 2013 at 05:13:46PM +0200, Sam Ravnborg wrote:
>> On Fri, Aug 09, 2013 at 04:00:31PM +0100, Mark Brown wrote:
> 
>>> OK...  I'd have thought that cross compliation was enough of a rationale
>>> to be honest.
> 
>> The way I understand cross compilation is that for example you
>> build for arm - on your x86 box.
>> This is supported today.
> 
>> So you need to explain your interpretation of cross compilation
>> and why this patch is needed.
>> Because I do not get it.
> 
> I thought that was covered by:
> 
>     Cross compiling the binaries in scripts/* is not possible
>     because various makefiles assume that $(obj)/whatever is
>     executable on the build host.
> 
> ie, we can cross build the kernel but not fixdep, conf or mk_elfconfig
> since those are assumed to be runnable for the kernel build, meaning
> they can't be deployed onto a target system without hoop jumping.

OK, but what what do you need cross compile them and deploy on the
target? Their job is to build the kernel. So if you are going to build
the kernel on the target, you can also build the tools there, can't you?
Or are you using the tools from something else than building the kernel?

I think that we are missing some detail of your use case and it does not
make sense without that detail.

Michal
