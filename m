Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:34237 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751468Ab3GHOp0 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 8 Jul 2013 10:45:26 -0400
Message-ID: <51DAD082.7080700@suse.cz>
Date: Mon, 08 Jul 2013 16:45:22 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH 3/3] kbuild: add generation of kernel-devel
References: <20130624143658.10761.3787.stgit@phlsvslse11.ph.intel.com> <20130624143833.10761.94871.stgit@phlsvslse11.ph.intel.com> <51D5919B.7010208@suse.cz> <32E1700B9017364D9B60AED9960492BC2115DC69@FMSMSX107.amr.corp.intel.com> <51DAACB9.5080103@suse.cz> <32E1700B9017364D9B60AED9960492BC2115DD48@FMSMSX107.amr.corp.intel.com> <51DABF5C.3080502@redhat.com> <32E1700B9017364D9B60AED9960492BC2115DD99@FMSMSX107.amr.corp.intel.com>
In-Reply-To: <32E1700B9017364D9B60AED9960492BC2115DD99@FMSMSX107.amr.corp.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Marciniszyn, Mike" <mike.marciniszyn@intel.com>
Cc: Doug Ledford <dledford@redhat.com>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "mmarcini@yahoo.com" <mmarcini@yahoo.com>

On 8.7.2013 15:39, Marciniszyn, Mike wrote:
>>
>> rpm 4.0.3 is *ancient*.  An %exclude is perfectly acceptable and definitely
>> preferable to a broken payload.
>>
> 
> The top of the mkspec shell script has this comment:
> #       Output a simple RPM spec file that uses no fancy features requiring
> #       RPM v4. This is intended to work with any RPM distro.
> 
> Are there old distros that still care about this?

If it's that old, I don't think we need to care. At least not for
building the RPM, because the compiler on such old systems is probably
not going to be able to compile the kernel. I wasn't sure if %exclude
wasn't added in the last five years or so.

Michal
