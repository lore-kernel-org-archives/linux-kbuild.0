Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pa0-f43.google.com ([209.85.220.43]:36658 "EHLO
	mail-pa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S2992449AbbEPCQz (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 15 May 2015 22:16:55 -0400
Message-ID: <5556A893.9060204@gmail.com>
Date: Fri, 15 May 2015 19:16:51 -0700
From: Frank Rowand <frowand.list@gmail.com>
Reply-To: frowand.list@gmail.com
MIME-Version: 1.0
Subject: Re: [PATCH/RFC] kbuild: Create a rule for building device tree overlay
 objects
References: <1431431816-24612-1-git-send-email-geert+renesas@glider.be> <D4386733-8722-478F-8BB6-FB86597D9E37@gmail.com> <555693AA.1000105@gmail.com>
In-Reply-To: <555693AA.1000105@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: frowand.list@gmail.com
Cc: Pantelis Antoniou <pantelis.antoniou@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-kbuild@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org

On 5/15/2015 5:47 PM, Frank Rowand wrote:
> On 5/12/2015 7:33 AM, Pantelis Antoniou wrote:
>> Hi Geert,
>>
>>> On May 12, 2015, at 14:56 , Geert Uytterhoeven <geert+renesas@glider.be> wrote:
>>>
>>> This allows to handle device tree overlays like plain device trees.
>>>
>>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>> ---
>>> Questions:
>>>  - Do we want dtso files under arch/<arch>/boot/dts/, too?
>>>  - Do we want to move the dts files outside the kernel repository
>>>    first?
>>>
>>
>> Oh that’s a nice hornet’s nest you’ve kicked here.
>>
>> arch/<arch>/boot/dts should not be the place, cause overlays are not related with boot per se.
>> As they are right now are board (family) specific.
> 
> Aren't overlays meant to describe child boards (capes, shields, whatever) that may
> vary from system to system, but are not expected to be hot-plugged while the OS
> is up?  Or is hot-plug a design goal?

To reply to myself, there is a current discussion about whether to use overlays to
help with a powerpc pci desire to add and delete subtrees:

   http://www.spinics.net/lists/linux-pci/msg40740.html

That sound like hot-plug to me...

> 
> If no hot-plug, then to me an overlay is just as related to boot as the base dts.
> It is a mere implementation detail that overlays are "loaded" from userspace
> instead of by the booting kernel (I don't really know the details of using
> overlays, so please correct me if I am wrong about how the kernel becomes aware
> of an overlay).
> 
>>
>> I think we should try to keep an external kernel repo with them for now until we
>> figure out where to put them.
>>
>>> scripts/Makefile.lib | 3 +++
>>> 1 file changed, 3 insertions(+)
>>>
>>> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
>>> index 79e86613712f2230..4b14eef1d4b2ce8f 100644
>>> --- a/scripts/Makefile.lib
>>> +++ b/scripts/Makefile.lib
>>> @@ -292,6 +292,9 @@ cmd_dtc = mkdir -p $(dir ${dtc-tmp}) ; \
>>> $(obj)/%.dtb: $(src)/%.dts FORCE
>>> 	$(call if_changed_dep,dtc)
>>>
>>> +$(obj)/%.dtbo: $(src)/%.dtso FORCE
>>> +	$(call if_changed_dep,dtc)
>>> +
>>> dtc-tmp = $(subst $(comma),_,$(dot-target).dts.tmp)
>>>
>>> # Bzip2
>>> -- 
>>> 1.9.1
>>
>> Regards
>>
>> — Pantelis
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe devicetree" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
> 
> 

