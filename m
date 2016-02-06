Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:34259 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750748AbcBFBRt (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 5 Feb 2016 20:17:49 -0500
Date: Sat, 6 Feb 2016 09:17:42 +0800
From: Fengguang Wu <fengguang.wu@intel.com>
Subject: Re: Adding Xen to the kbuild bot?
Message-ID: <20160206011742.GA13627@wfg-t540p.sh.intel.com>
References: <CALCETrUh1jq7Di0gTO0R3wN51x=vmd5wU4ODmE0kXK13MhQDnA@mail.gmail.com>
 <20160205031116.GB30154@wfg-t540p.sh.intel.com>
 <CALCETrVssJ2oCqT9eKzoXQ0VWz1O1XB=Gt97djrgPYTfZYt_ug@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALCETrVssJ2oCqT9eKzoXQ0VWz1O1XB=Gt97djrgPYTfZYt_ug@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andy Lutomirski <luto@amacapital.net>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, Ian Campbell <ian.campbell@citrix.com>, LKP <lkp@01.org>, "Hu, Robert" <robert.hu@intel.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>

On Fri, Feb 05, 2016 at 12:10:56PM -0800, Andy Lutomirski wrote:
> On Feb 4, 2016 7:11 PM, "Fengguang Wu" <fengguang.wu@intel.com> wrote:
> >
> > Hi Andy,
> >
> > CC more people on Xen testing -- in case OSStest already (or plans to)
> > cover such test case.
> >
> > On Tue, Feb 02, 2016 at 07:31:30PM -0800, Andy Lutomirski wrote:
> > > Hi all-
> > >
> > > Would it make sense to add some basic Xen PV testing to the kbuild bot?
> >
> > Do you mean to run basic Xen testing on the various kernel trees that
> > 0day robot covers? That is, to catch kernel regressions when running
> > under Xen.
> >
> 
> Yes, exactly.  I've personally broken Linux as a Xen guest at least twice.
> 
> > If the intention is to catch Xen regressions, the OSStest
> > infrastructure may be a better option:
> >
> >         git://xenbits.xen.org/osstest.git
> 
> No, I think that 0day should pick one Xen version and stick with it
> for a while rather than trying to track the latest version.

OK, got it. So it's suitable to run in 0day.

> > > qemu can boot Xen like this:
> > >
> > > qemu-system-x86_64 -kernel path/to/xen-4.5.2 -initrd 'path/to/bzImage
> > > kernelarg otherkernelarg=value" -append 'xenarg other_xen_arg'
> > >
> > > This should work with any kernel image for x86 or x86_64 with CONFIG_XEN=y.
> >
> > Got it. If you have simple working test scripts to illustrate test
> > details, it'd be a great help for integrating into OSStest or 0day.
> 
> I have a script that will boot to a command prompt, but I don't know
> if that's the right way to do it.  I'm not really sure how 0day works
> under the hood, but treating Xen as a different configuration or arch
> instead of treating it as a different test case might make more sense.

We can check the script first, then determine the most suitable way to
integrate it into 0day. My guess is, it might be suitable to run as a
new kind of VM host, like this

https://git.kernel.org/cgit/linux/kernel/git/wfg/lkp-tests.git/tree/hosts/vm-kbuild-1G

model: qemu-system-x86_64 -enable-kvm -cpu Haswell,+smep,+smap
nr_vm: 12
nr_cpu: 2
memory: 1G
disk_type: virtio-scsi
rootfs: debian-x86_64.cgz
hdd_partitions: /dev/sda /dev/sdb /dev/sdc /dev/sdd
swap_partitions: /dev/sde

Thanks,
Fengguang
