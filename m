Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mailout3.w2.samsung.com ([211.189.100.13]:46390 "EHLO
	usmailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750784AbaHFNlf (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 6 Aug 2014 09:41:35 -0400
Message-id: <53E2308B.3060203@samsung.com>
Date: Wed, 06 Aug 2014 07:41:31 -0600
From: Shuah Khan <shuah.kh@samsung.com>
Reply-to: shuah.kh@samsung.com
MIME-version: 1.0
Subject: Re: [PATCH] kbuild: devtest - new make target for build all and run
 tests
References: <1405716274-24420-1-git-send-email-shuah.kh@samsung.com>
 <20140718232958.GA22487@ravnborg.org> <53C9B814.4020809@samsung.com>
In-reply-to: <53C9B814.4020809@samsung.com>
Content-type: text/plain; charset=ISO-8859-1; format=flowed
Content-transfer-encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.cz
Cc: Sam Ravnborg <sam@ravnborg.org>, gregkh@linuxfoundation.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On 07/18/2014 06:13 PM, Shuah Khan wrote:
> On 07/18/2014 05:29 PM, Sam Ravnborg wrote:
>> On Fri, Jul 18, 2014 at 02:44:34PM -0600, Shuah Khan wrote:
>>> Add a new devtest make target to enable developer testing. This
>>> new target does full build (make all) and then runs selftests.
>>>
>>> Signed-off-by: Shuah Khan <shuah.kh@samsung.com>
>>> ---
>>>   Makefile | 11 +++++++++++
>>>   1 file changed, 11 insertions(+)
>>>
>>> diff --git a/Makefile b/Makefile
>>> index f3c543d..1ef3128 100644
>>> --- a/Makefile
>>> +++ b/Makefile
>>> @@ -1034,6 +1034,14 @@ headers_check: headers_install
>>>       $(Q)$(MAKE) $(hdr-inst)=arch/$(hdr-arch)/include/uapi/asm
>>> $(hdr-dst) HDRCHECK=1
>>>

Hi Michal,

Are you planning to include this patch in your 3.17 kbuild pull?
Keeping my fingers crossed. :)

-- Shuah


-- 
Shuah Khan
Senior Linux Kernel Developer - Open Source Group
Samsung Research America(Silicon Valley)
shuah.kh@samsung.com | (970) 672-0658
