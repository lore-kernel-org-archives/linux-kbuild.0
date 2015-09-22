Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:39265 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756488AbbIVKOY (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 22 Sep 2015 06:14:24 -0400
Subject: Re: [PATCH] Add virt directory to the top Makefile
References: <1442911649-149474-1-git-send-email-feng.wu@intel.com>
 <56011D54.10305@suse.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <560129F9.7000209@redhat.com>
Date: Tue, 22 Sep 2015 12:14:17 +0200
MIME-Version: 1.0
In-Reply-To: <56011D54.10305@suse.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>, Feng Wu <feng.wu@intel.com>, alex.williamson@redhat.com
Cc: eric.auger@linaro.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org



On 22/09/2015 11:20, Michal Marek wrote:
> On 2015-09-22 10:47, Feng Wu wrote:
>> We need to build files in virt/lib/, which are now used by
>> KVM and VFIO, so add virt directory to the top Makefile.
>>
>> Signed-off-by: Feng Wu <feng.wu@intel.com>
>> ---
>>  Makefile              | 8 +++++---
>>  arch/x86/kvm/Makefile | 3 ---
>>  virt/Makefile         | 1 +
>>  3 files changed, 6 insertions(+), 6 deletions(-)
>>  create mode 100644 virt/Makefile
> 
> I assume this will go through the kvm tree, is that correct?

Yes.  Feng, can you send a v2 of this patch for Michal to ack?


Paolo

> 
> 
>>  vmlinux-dirs	:= $(patsubst %/,%,$(filter %/, $(init-y) $(init-m) \
>>  		     $(core-y) $(core-m) $(drivers-y) $(drivers-m) \
>> -		     $(net-y) $(net-m) $(libs-y) $(libs-m)))
>> +		     $(net-y) $(net-m) $(libs-y) $(libs-m) $(virt-y)))
> 
> This allows to drop the explicit 'virt' entry in the KBUILD_ALLDIRS
> assignment a few lines below.
> 
> 
>> diff --git a/virt/Makefile b/virt/Makefile
>> new file mode 100644
>> index 0000000..335dc0b
>> --- /dev/null
>> +++ b/virt/Makefile
>> @@ -0,0 +1 @@
>> +obj-y	+= ./lib/
> 
> Remove the ./
> 
> Michal
> 
