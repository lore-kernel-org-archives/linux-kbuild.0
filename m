Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:12411 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750723AbcBEDLV (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 4 Feb 2016 22:11:21 -0500
Date: Fri, 5 Feb 2016 11:11:16 +0800
From: Fengguang Wu <fengguang.wu@intel.com>
Subject: Re: Adding Xen to the kbuild bot?
Message-ID: <20160205031116.GB30154@wfg-t540p.sh.intel.com>
References: <CALCETrUh1jq7Di0gTO0R3wN51x=vmd5wU4ODmE0kXK13MhQDnA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALCETrUh1jq7Di0gTO0R3wN51x=vmd5wU4ODmE0kXK13MhQDnA@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andy Lutomirski <luto@kernel.org>
Cc: LKP <lkp@01.org>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Hu, Robert" <robert.hu@intel.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Ian Campbell <ian.campbell@citrix.com>

Hi Andy,

CC more people on Xen testing -- in case OSStest already (or plans to)
cover such test case.

On Tue, Feb 02, 2016 at 07:31:30PM -0800, Andy Lutomirski wrote:
> Hi all-
> 
> Would it make sense to add some basic Xen PV testing to the kbuild bot?

Do you mean to run basic Xen testing on the various kernel trees that
0day robot covers? That is, to catch kernel regressions when running
under Xen.

If the intention is to catch Xen regressions, the OSStest
infrastructure may be a better option:

        git://xenbits.xen.org/osstest.git

> qemu can boot Xen like this:
> 
> qemu-system-x86_64 -kernel path/to/xen-4.5.2 -initrd 'path/to/bzImage
> kernelarg otherkernelarg=value" -append 'xenarg other_xen_arg'
> 
> This should work with any kernel image for x86 or x86_64 with CONFIG_XEN=y.

Got it. If you have simple working test scripts to illustrate test
details, it'd be a great help for integrating into OSStest or 0day.

> Linux has never been been able to do virtio under Xen, which will
> screw up your scripts, but I'm cautiously optimistic that virtio will
> work as expected on a Xen guest starting with Linux 4.6.  If you want
> to play around, it should work in this tree:
> 
> https://git.kernel.org/cgit/linux/kernel/git/luto/linux.git/log/?h=virtio_dma
> 
> I'm hoping to get that queued up for real in the next couple of days.

Thanks,
Fengguang
