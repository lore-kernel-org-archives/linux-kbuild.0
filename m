Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-eopbgr720078.outbound.protection.outlook.com ([40.107.72.78]:11232
        "EHLO NAM05-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726430AbfJOIrE (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 15 Oct 2019 04:47:04 -0400
Subject: Re: [PATCH] microblaze: Include generic support for MSI irqdomains
References: <aa6dd855474451ff4f2e82691d1f590f3a85ba68.1570530881.git.michal.simek@xilinx.com>
 <20191008154604.GA7903@infradead.org>
 <c558db03-1199-275d-3e42-612c71cbf736@xilinx.com>
 <20191015074717.GB8715@infradead.org>
From: Michal Simek <michal.simek@xilinx.com>
Message-ID: <7cedfc62-b9ba-d1f2-e14f-93a64ad07fbc@xilinx.com>
Date: Tue, 15 Oct 2019 10:46:45 +0200
MIME-Version: 1.0
In-Reply-To: <20191015074717.GB8715@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Christoph Hellwig <hch@infradead.org>, Michal Simek <michal.simek@xilinx.com>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-kernel@vger.kernel.org, monstr@monstr.eu, git@xilinx.com, Kate Stewart <kstewart@linuxfoundation.org>, Kuldeep Dave <kuldeep.dave@xilinx.com>, Albert Ou <aou@eecs.berkeley.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Palmer Dabbelt <palmer@sifive.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Firoz Khan <firoz.khan@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, linux-kbuild@vger.kernel.org

On 15. 10. 19 9:47, Christoph Hellwig wrote:
> On Thu, Oct 10, 2019 at 12:47:31PM +0200, Michal Simek wrote:
>> On 08. 10. 19 17:46, Christoph Hellwig wrote:
>>> On Tue, Oct 08, 2019 at 12:34:47PM +0200, Michal Simek wrote:
>>>> index e5c9170a07fc..83417105c00a 100644
>>>> --- a/arch/microblaze/include/asm/Kbuild
>>>> +++ b/arch/microblaze/include/asm/Kbuild
>>>> @@ -25,6 +25,7 @@ generic-y += local64.h
>>>>  generic-y += mcs_spinlock.h
>>>>  generic-y += mm-arch-hooks.h
>>>>  generic-y += mmiowb.h
>>>> +generic-y += msi.h
>>>
>>> Please just mark it as mandatory-y in the asm-generic makefile
>>> instead of requiring a sniplet for every architecture.
>>>
>>
>> But is it really mandatory for all architectures?
> 
> What the mandatory-y keyword means is that every architecture that
> doesn't provide its own header gets the default one, which seems
> applicable here.  Maybe the keyword is a bit misnamed and should be
> default-y or something like that..
> 
> But in this case I think we have a clear case of x86 vs the rest, which
> is unlikely to change in a major way.
> 

Bjorn: If you are ok with this I will make the patch.

Thanks,
Michal
