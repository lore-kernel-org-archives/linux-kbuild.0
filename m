Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-bn1on0076.outbound.protection.outlook.com ([157.56.110.76]:17040
	"EHLO na01-bn1-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1753114AbbC3M4P (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 30 Mar 2015 08:56:15 -0400
Date: Mon, 30 Mar 2015 14:39:58 +0200
From: Michal Simek <michal.simek@xilinx.com>
MIME-Version: 1.0
Subject: Re: [PATCH v2] kbuild: Create directory for target DTB
References: <c09612262f2758e70dd4d700f2d32692601f8287.1426682342.git.michal.simek@xilinx.com>
 <20150318132004.GC10863@arm.com> <20150329205731.GB13301@localhost>
In-Reply-To: <20150329205731.GB13301@localhost>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Message-ID: <4d6f5fe3-435d-45e5-be88-2e6a60b19b23@BL2FFO11OLC001.protection.gbl>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Olof Johansson <olof@lixom.net>, Will Deacon <will.deacon@arm.com>
Cc: Michal Simek <michal.simek@xilinx.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "monstr@monstr.eu" <monstr@monstr.eu>, Zach Pfeffer <zachp@xilinx.com>, Nathan Rossi <nrossi@xilinx.com>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <Catalin.Marinas@arm.com>, Nathan Rossi <nathan.rossi@xilinx.com>, Michal Marek <mmarek@suse.cz>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, arm@kernel.org

On 03/29/2015 10:57 PM, Olof Johansson wrote:
> On Wed, Mar 18, 2015 at 01:20:04PM +0000, Will Deacon wrote:
>> On Wed, Mar 18, 2015 at 12:39:07PM +0000, Michal Simek wrote:
>>> From: Nathan Rossi <nathan.rossi@xilinx.com>
>>>
>>> When building specific DTBs out of the kernel tree the vendor subdirs
>>> (boot/dts/<vendor>) are not created, ensure that they are before
>>> building the DTB.
>>>
>>> Signed-off-by: Nathan Rossi <nathan.rossi@xilinx.com>
>>> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
>>> ---
>>>
>>> Changes in v2:
>>> - Use $(dir ${dtc-tmp}) instead of `dirname ${dtc-tmp}`
>>>   Reported-by: Will Deacon <will.deacon@arm.com>
>>
>> Looks ok to me, but no idea which tree this should go through. Maybe
>> arm-soc?
>>
>>   Acked-by: Will Deacon <will.deacon@arm.com>
> 
> Sure. Please resend with appropriate acks to arm@kernel.org and we can apply it.

Sent.

Thanks,
Michal

