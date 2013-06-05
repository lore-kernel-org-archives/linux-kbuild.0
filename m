Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:51117 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752530Ab3FEJxq (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 5 Jun 2013 05:53:46 -0400
Message-ID: <51AF0AA6.8010008@suse.cz>
Date: Wed, 05 Jun 2013 11:53:42 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [RFC PATCH v3] kbuild: fix error when building from src rpm
References: <32E1700B9017364D9B60AED9960492BC2114956E@FMSMSX107.amr.corp.intel.com>
In-Reply-To: <32E1700B9017364D9B60AED9960492BC2114956E@FMSMSX107.amr.corp.intel.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Marciniszyn, Mike" <mike.marciniszyn@intel.com>
Cc: "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, Doug Ledford <dledford@redhat.com>

On 4.6.2013 22:12, Marciniszyn, Mike wrote:
> Sorry for the confusion with the patch.
> 
> The latest version I've changed to an RFC because of some testing
> issues I've encountered.
> 
> The /sbin/installkernel doesn't behave very nicely when INSTALL_PATH
> is modified on RH6.4.
[snip]
> I'm seeing when spec file tries to do its own install...
> 
> I'm open to suggestions for making this part of the spec file
> portable and the src RPM usable.

You could introduce a new Makefile target, say image_name, that would
simply print the image name after including the arch Makefile. Then in
the spec file, you would simply do

KBUILD_IMAGE=$(make -s image_name)

I think that this target would be a useful addition to the already
existing kernelversion and kernelrelease targets. And BTW, we could use
make -s kernelrelease in the specfile as well, instead of hardcoding the
value there.

Michal
