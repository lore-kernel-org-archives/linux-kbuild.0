Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:48655 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753333AbcGVMGW (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 22 Jul 2016 08:06:22 -0400
Subject: Re: [PATCH] scripts: Fix size mismatch of kexec_purgatory_size
References: <BE389624-FFFE-42F1-A89F-5E5598190D4A@amazon.com>
 <20160706084538.GA11783@dhcp-128-65.nay.redhat.com>
From: Michal Marek <mmarek@suse.com>
Message-ID: <57920C3C.1060701@suse.com>
Date: Fri, 22 Jul 2016 14:06:20 +0200
MIME-Version: 1.0
In-Reply-To: <20160706084538.GA11783@dhcp-128-65.nay.redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dave Young <dyoung@redhat.com>, "Tautschnig, Michael" <tautschn@amazon.co.uk>
Cc: "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "kexec@lists.infradead.org" <kexec@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Vivek Goyal <vgoyal@redhat.com>

On 2016-07-06 10:45, Dave Young wrote:
> On 07/04/16 at 01:55pm, Tautschnig, Michael wrote:
>> bin2c is used to create a valid C file out of a binary file where two
>> symbols will be globally defined: <name> and <name>_size. <name> is
>> passed as the first parameter of the host binary.
>>
>> Building using goto-cc reported that the purgatory binary code (the only
>> current user of this utility) declares kexec_purgatory_size as 'size_t'
>> where bin2c generate <name>_size to be 'int' so in a 64-bit host where
>> sizeof(size_t) > sizeof(int) this type mismatch will always yield the
>> wrong value for big-endian architectures while for little-endian it will
>> be wrong if the object laid in memory directly after
>> kexec_purgatory_size contains non-zero value at the time of reading.
>>
>> This commit changes <name>_size to be size_t instead.
>>
>> Note:
>>
>> Another way to fix the problem is to change the type of
>> kexec_purgatory_size to be 'int' as there's this check in code:
>> (kexec_purgatory_size <= 0)
>>
>> Signed-off-by: Michael Tautschnig <tautschn@amazon.com>
>> Cc: Michal Marek <mmarek@suse.com>
>> Cc: Vivek Goyal <vgoyal@redhat.com>
[...]
> Acked-by: Dave Young <dyoung@redhat.com>

Applied to kbuild.git#kbuild.

Michal
