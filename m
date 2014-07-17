Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:47866 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932908AbaGQPWW (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 17 Jul 2014 11:22:22 -0400
Message-ID: <53C7EA2A.6050301@suse.cz>
Date: Thu, 17 Jul 2014 17:22:18 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/6] kbuild: use target compiler for user binaries
 in samples/
References: <20140713183636.GA17241@ravnborg.org>	<20140714102936.73f43591@canb.auug.org.au> <20140714103357.33d3bdc7@canb.auug.org.au>
In-Reply-To: <20140714103357.33d3bdc7@canb.auug.org.au>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Sam Ravnborg <sam@ravnborg.org>
Cc: kbuild <linux-kbuild@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>, David Herrmann <dh.herrmann@googlemail.com>, Jiri Kosina <jkosina@suse.cz>

On 2014-07-14 02:33, Stephen Rothwell wrote:
> Hi Sam,
> 
> On Mon, 14 Jul 2014 10:29:36 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> On Sun, 13 Jul 2014 20:36:37 +0200 Sam Ravnborg <sam@ravnborg.org> wrote:
>>>
>>> NOTE: This will likely break the build if the toolchain used do
>>> not include a libc. Let's see how much noise this creates.
>>
>> Then I will drop them from linux-next.  Until someone supplies lots of
>> cross compilers with libc support, the samples can not (must not) be
>> built by default.
> 
> Just to be clear: for my current build infrastructure, this means
> powerpc and x86_64 hosted cross compilers.

So we basically can have zero, one or both of
A) target toolchain with libc support
B) host toolchain with recent enough kernel headers

Just can idea - in case we have B, but not A, would it make sense to
build $(uapiprogs-y) with the host compiler, but without the
-Iusr/include flag? The question is whether to add a kconfig knob for
this, or some automatic detection for libc support of the target
toolchain. I'll come up with a patch later.

Michal
