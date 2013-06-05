Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga14.intel.com ([143.182.124.37]:1227 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753890Ab3FEKRc convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 5 Jun 2013 06:17:32 -0400
From: "Marciniszyn, Mike" <mike.marciniszyn@intel.com>
Subject: RE: [RFC PATCH v3] kbuild: fix error when building from src rpm
Date: Wed, 5 Jun 2013 10:17:19 +0000
Message-ID: <32E1700B9017364D9B60AED9960492BC21149807@FMSMSX107.amr.corp.intel.com>
References: <32E1700B9017364D9B60AED9960492BC2114956E@FMSMSX107.amr.corp.intel.com>
 <51AF0AA6.8010008@suse.cz>
In-Reply-To: <51AF0AA6.8010008@suse.cz>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, Doug Ledford <dledford@redhat.com>

I sent a different version today that used %defines for each arch, but this idea is better and doesn't create a maintenance issue.  The scope would be kbuild wide so I assume that the cc list needs to expand?

Also, I will also want to add a new package to create a kernel-devel package and will be submitting patch for that shortly.

Thanks,
Mike


> -----Original Message-----
> From: Michal Marek [mailto:mmarek@suse.cz]
> Sent: Wednesday, June 05, 2013 5:54 AM
> To: Marciniszyn, Mike
> Cc: linux-kbuild@vger.kernel.org; Doug Ledford
> Subject: Re: [RFC PATCH v3] kbuild: fix error when building from src rpm
> 
> On 4.6.2013 22:12, Marciniszyn, Mike wrote:
> > Sorry for the confusion with the patch.
> >
> > The latest version I've changed to an RFC because of some testing
> > issues I've encountered.
> >
> > The /sbin/installkernel doesn't behave very nicely when INSTALL_PATH
> > is modified on RH6.4.
> [snip]
> > I'm seeing when spec file tries to do its own install...
> >
> > I'm open to suggestions for making this part of the spec file portable
> > and the src RPM usable.
> 
> You could introduce a new Makefile target, say image_name, that would
> simply print the image name after including the arch Makefile. Then in the
> spec file, you would simply do
> 
> KBUILD_IMAGE=$(make -s image_name)
> 
> I think that this target would be a useful addition to the already existing
> kernelversion and kernelrelease targets. And BTW, we could use make -s
> kernelrelease in the specfile as well, instead of hardcoding the value there.
> 
> Michal
