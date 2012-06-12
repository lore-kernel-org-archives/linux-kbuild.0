Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lpp01m010-f46.google.com ([209.85.215.46]:62718 "EHLO
	mail-lpp01m010-f46.google.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752335Ab2FLPMZ convert rfc822-to-8bit
	(ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 12 Jun 2012 11:12:25 -0400
Received: by mail-lpp01m010-f46.google.com with SMTP id d3so3588965lah.19
        for <linux-kbuild@vger.kernel.org>; Tue, 12 Jun 2012 08:12:25 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20120612125940.GA18853@localhost>
References: <20120612055154.GA12725@localhost> <20120612125016.GA4361@breakpoint.cc>
 <20120612125940.GA18853@localhost>
From: Bjorn Helgaas <bhelgaas@google.com>
Date: Tue, 12 Jun 2012 09:12:04 -0600
Message-ID: <CAErSpo6_dRqrnCOJ3aykVXGQD6kBOXGk5PBAvFpHPKz0bnZXrg@mail.gmail.com>
Subject: Re: WARNING: arch/x86/kernel/built-in.o(.pci_fixup_final+0x1c):
 Section mismatch in reference from the variable __pci_fixup_PCI_VENDOR_ID_AMDPCI_DEVICE_ID_AMD_15H_NB_F5quirk_amd_nb_node
 to the function .init.text:quirk_amd_nb_node()
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Fengguang Wu <wfg@linux.intel.com>
Cc: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>, linux-kbuild@vger.kernel.org

On Tue, Jun 12, 2012 at 6:59 AM, Fengguang Wu <wfg@linux.intel.com> wrote:
> On Tue, Jun 12, 2012 at 02:50:16PM +0200, Sebastian Andrzej Siewior wrote:
>> On Tue, Jun 12, 2012 at 01:51:54PM +0800, wfg@linux.intel.com wrote:
>> > FYI: there are new compile warnings show up in
>> >
>> > tree:   git://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git next
>> > head:   0c358c16f8154ef47df749e60186f3c835869b0b
>> > commit: d4974983cc76a0bff5e82987c761cda4ba08be66 [51/60] scripts/modpost: check for bad refernces in .pci.fixups area
>> > config: i386-allmodconfig (attached as .config)
>> >
>> > All related error/warning messages are:
>> >
>> >
>> >
>> > WARNING: arch/x86/kernel/built-in.o(.pci_fixup_final+0x1c): Section mismatch in reference from the variable __pci_fixup_PCI_VENDOR_ID_AMDPCI_DEVICE_ID_AMD_15H_NB_F5quirk_amd_nb_node to the function .init.text:quirk_amd_nb_node()
>> > The variable __pci_fixup_PCI_VENDOR_ID_AMDPCI_DEVICE_ID_AMD_15H_NB_F5quirk_amd_nb_node references
>> > a function __init quirk_amd_nb_node().
>> <snip>
>>
>> This should be fixed by
>>   http://git.kernel.org/?p=linux/kernel/git/helgaas/pci.git;a=commit;h=763268610f596d66686f8a13bc8f0c0504782dd1
>>
>> that means try the complete tree instead. The alternativ would to push this
>> patch as the last one in series. However there is no damage in bisect
>> except this splat so......
>
> Yeah I do commit-by-commit build tests to make the kernel more
> bisectable and complain if any step won't compile.

Wow, that's awesome :)

I reordered the patches in my topic branch, and I plan to rebase my
"next" branch today, so that should take care of this.

Bjorn
