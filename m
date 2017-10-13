Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:56144 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753140AbdJMXJA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 13 Oct 2017 19:09:00 -0400
Subject: Re: [PATCH v4 2/2] of: Add unit tests for applying overlays
References: <1493165394-29367-1-git-send-email-frowand.list@gmail.com>
 <1493165394-29367-3-git-send-email-frowand.list@gmail.com>
 <CAL_JsqKZ5JcunaY9K5MEjyS-sxargKtJq11x+DVMwHs8WrnH+Q@mail.gmail.com>
From: Frank Rowand <frowand.list@gmail.com>
Message-ID: <59E1477D.6060700@gmail.com>
Date: Fri, 13 Oct 2017 16:08:45 -0700
MIME-Version: 1.0
In-Reply-To: <CAL_JsqKZ5JcunaY9K5MEjyS-sxargKtJq11x+DVMwHs8WrnH+Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Rob Herring <robh+dt@kernel.org>
Cc: Stephen Boyd <stephen.boyd@linaro.org>, Michal Marek <mmarek@suse.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi Rob,

On 07/25/17 13:36, Rob Herring wrote:
> On Tue, Apr 25, 2017 at 7:09 PM,  <frowand.list@gmail.com> wrote:
>> From: Frank Rowand <frank.rowand@sony.com>
>>
>> Existing overlay unit tests examine individual pieces of the overlay
>> code.  The new tests target the entire process of applying an overlay.
>>
>> Signed-off-by: Frank Rowand <frank.rowand@sony.com>
>> ---
> 
> [...]
> 
>> @@ -1261,6 +1263,8 @@ void __init unflatten_device_tree(void)
>>
>>         /* Get pointer to "/chosen" and "/aliases" nodes for use everywhere */
>>         of_alias_scan(early_init_dt_alloc_memory_arch);
>> +
>> +       unittest_unflatten_overlay_base();
> 
> This breaks on systems that don't boot with FDT and call
> unflatten_device_tree, namely x86 and UML (UML needs a few hacks to
> work) which was a feature of the unittest. Considering applying
> overlays on x86 is something we'll want to support, the unittest
> should support that case.
> 
> Rob

What is the symptom of the breakage?  Or what is causing breakage?

-Frank

