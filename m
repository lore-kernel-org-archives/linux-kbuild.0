Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:57113 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751565Ab2ANWvc (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 14 Jan 2012 17:51:32 -0500
Message-ID: <4F1206F1.5090405@suse.cz>
Date: Sat, 14 Jan 2012 23:51:29 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] Kbuild: Use dtc's -d (dependency) option
References: <1326134295-15547-1-git-send-email-swarren@nvidia.com>  <1326134295-15547-2-git-send-email-swarren@nvidia.com> <1326310587.2535.291.camel@deneb.redhat.com>
In-Reply-To: <1326310587.2535.291.camel@deneb.redhat.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mark Salter <msalter@redhat.com>, Stephen Warren <swarren@nvidia.com>
Cc: Jon Loeliger <jdl@jdl.com>, David Gibson <david@gibson.dropbear.id.au>, Russell King <linux@arm.linux.org.uk>, Aurelien Jacquiot <a-jacquiot@ti.com>, Michal Simek <monstr@monstr.eu>, Jonas Bonn <jonas@southpole.se>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-c6x-dev@linux-c6x.org, microblaze-uclinux@itee.uq.edu.au, linux@openrisc.net, linuxppc-dev@lists.ozlabs.org, Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>

On 11.1.2012 20:36, Mark Salter wrote:
> On Mon, 2012-01-09 at 11:38 -0700, Stephen Warren wrote:
>> This hooks dtc into Kbuild's dependency system.
>>
>> Thus, for example, "make dtbs" will rebuild tegra-harmony.dtb if only
>> tegra20.dtsi has changed yet tegra-harmony.dts has not. The previous
>> lack of this feature recently caused me to have very confusing "git
>> bisect" results.
>>
>> For ARM, it's obvious what to add to $(targets). I'm not familiar enough
>> with other architectures to know what to add there. Powerpc appears to
>> already add various .dtb files into $(targets), but the other archs may
>> need something added to $(targets) to work.
>>
>> Signed-off-by: Stephen Warren <swarren@nvidia.com>
>>
> 
> Acked-by: Mark Salter <msalter@redhat.com>
> 
> For the arch/c6x bit.

As the C6X port has been merged in this merge window, I can't easily
apply this patch to my kbuild branch and at the same time please Linus
by basing the pull request on a tagged release. So I'm going to drop the
arch/c6x part to keep the kbuild branch "pretty" and let either Mark or
Stephen send the patch to Linus directly, once he has merged the kbuild
branch. Would that work?

Thanks,
Michal
