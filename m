Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:37295 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756742Ab3GEU36 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 5 Jul 2013 16:29:58 -0400
Message-ID: <51D72CBE.7070502@suse.cz>
Date: Fri, 05 Jul 2013 22:29:50 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH 3/3] kbuild: add generation of kernel-devel
References: <20130624143658.10761.3787.stgit@phlsvslse11.ph.intel.com> <20130624143833.10761.94871.stgit@phlsvslse11.ph.intel.com> <51D5919B.7010208@suse.cz> <32E1700B9017364D9B60AED9960492BC2115D782@FMSMSX107.amr.corp.intel.com>
In-Reply-To: <32E1700B9017364D9B60AED9960492BC2115D782@FMSMSX107.amr.corp.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Marciniszyn, Mike" <mike.marciniszyn@intel.com>
Cc: Doug Ledford <dledford@redhat.com>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "mmarcini@yahoo.com" <mmarcini@yahoo.com>

Dne 5.7.2013 15:04, Marciniszyn, Mike napsal(a):
>> For consistency and compatibility with older tar versions, please use
>> $RCS_TAR_EXCLUDE instead of --exclude-vcs. Also, you only need .config,
>> scripts/, include/ and the Makefiles to build external modules. But that's an
>> optimization that can be done in a later patch.
>>
> 
> I can't find any reference to the above string in kernel Makefiles or tar info?
> 
> Do you have more details?

It's $RCS_TAR_IGNORE, sorry.


>>> +echo "%post devel"
>>> +echo "cd /lib/modules/$KERNELRELEASE"
>>> +echo "ln -sf /usr/src/kernels/$KERNELRELEASE build"
>>> +echo "ln -sf /usr/src/kernels/$KERNELRELEASE source"
>>> +echo ""
>>> +echo "%postun devel"
>>> +echo "cd /lib/modules/$KERNELRELEASE"
>>> +echo "rm -f build source"
>>
>> These symlinks should be part of the RPM payload.
> 
> I guess the %post* sections would then be not needed...

Yes.

Michal

