Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:46104 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751752Ab2FLM7p (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 12 Jun 2012 08:59:45 -0400
Date: Tue, 12 Jun 2012 20:59:40 +0800
From: Fengguang Wu <wfg@linux.intel.com>
Subject: Re: WARNING: arch/x86/kernel/built-in.o(.pci_fixup_final+0x1c):
 Section mismatch in reference from the variable
 __pci_fixup_PCI_VENDOR_ID_AMDPCI_DEVICE_ID_AMD_15H_NB_F5quirk_amd_nb_node to
 the function .init.text:quirk_amd_nb_node()
Message-ID: <20120612125940.GA18853@localhost>
References: <20120612055154.GA12725@localhost>
 <20120612125016.GA4361@breakpoint.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20120612125016.GA4361@breakpoint.cc>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
Cc: linux-kbuild@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>

On Tue, Jun 12, 2012 at 02:50:16PM +0200, Sebastian Andrzej Siewior wrote:
> On Tue, Jun 12, 2012 at 01:51:54PM +0800, wfg@linux.intel.com wrote:
> > FYI: there are new compile warnings show up in
> > 
> > tree:   git://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git next
> > head:   0c358c16f8154ef47df749e60186f3c835869b0b
> > commit: d4974983cc76a0bff5e82987c761cda4ba08be66 [51/60] scripts/modpost: check for bad refernces in .pci.fixups area
> > config: i386-allmodconfig (attached as .config)
> > 
> > All related error/warning messages are:
> > 
> > 
> > 
> > WARNING: arch/x86/kernel/built-in.o(.pci_fixup_final+0x1c): Section mismatch in reference from the variable __pci_fixup_PCI_VENDOR_ID_AMDPCI_DEVICE_ID_AMD_15H_NB_F5quirk_amd_nb_node to the function .init.text:quirk_amd_nb_node()
> > The variable __pci_fixup_PCI_VENDOR_ID_AMDPCI_DEVICE_ID_AMD_15H_NB_F5quirk_amd_nb_node references
> > a function __init quirk_amd_nb_node().
> <snip>
> 
> This should be fixed by
>   http://git.kernel.org/?p=linux/kernel/git/helgaas/pci.git;a=commit;h=763268610f596d66686f8a13bc8f0c0504782dd1
> 
> that means try the complete tree instead. The alternativ would to push this
> patch as the last one in series. However there is no damage in bisect
> except this splat so......

Yeah I do commit-by-commit build tests to make the kernel more
bisectable and complain if any step won't compile.

However here it seems just warnings, so no problem for me :-)

Thanks,
Fengguang
