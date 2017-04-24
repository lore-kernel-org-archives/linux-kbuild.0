Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:56910 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S977737AbdDXUlD (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 24 Apr 2017 16:41:03 -0400
MIME-Version: 1.0
In-Reply-To: <58FE3A1B.9000503@gmail.com>
References: <1493012595-696-1-git-send-email-frowand.list@gmail.com>
 <1493012595-696-3-git-send-email-frowand.list@gmail.com> <CAL_JsqK3-MgkqBo6mGbs9dmo8Lwwx9dYW4SKyGjUDt_7wSecnA@mail.gmail.com>
 <58FE3A1B.9000503@gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 24 Apr 2017 15:40:36 -0500
Message-ID: <CAL_JsqKkzpCB6sA+fhQpaJvEGFeSw8gj3RcNL31PkWMXvMCUsg@mail.gmail.com>
Subject: Re: [PATCH 2/2] of: Add unit tests for applying overlays.
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Frank Rowand <frowand.list@gmail.com>
Cc: Stephen Boyd <stephen.boyd@linaro.org>, Michal Marek <mmarek@suse.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Mon, Apr 24, 2017 at 12:47 PM, Frank Rowand <frowand.list@gmail.com> wrote:
> On 04/24/17 10:16, Rob Herring wrote:
>> On Mon, Apr 24, 2017 at 12:43 AM,  <frowand.list@gmail.com> wrote:
>>> From: Frank Rowand <frank.rowand@sony.com>
>>>
>>> Existing overlay unit tests examine individual pieces of the overlay
>>> code.  The new tests target the entire process of applying an overlay.
>>>
>>> Signed-off-by: Frank Rowand <frank.rowand@sony.com>

[...]

>>> @@ -1256,11 +1258,54 @@ bool __init early_init_dt_scan(void *params)
>>>   */
>>>  void __init unflatten_device_tree(void)
>>>  {
>>> +#ifdef CONFIG_OF_UNITTEST
>>> +       extern uint8_t __dtb_ot_base_begin[];
>>> +       extern uint8_t __dtb_ot_base_end[];
>>> +       struct device_node *ot_base_root;
>>> +       void *ot_base;
>>> +       u32 data_size;
>>> +       u32 size;
>>> +#endif
>>> +
>>>         __unflatten_device_tree(initial_boot_params, NULL, &of_root,
>>>                                 early_init_dt_alloc_memory_arch, false);
>>>
>>>         /* Get pointer to "/chosen" and "/aliases" nodes for use everywhere */
>>>         of_alias_scan(early_init_dt_alloc_memory_arch);
>>
>> Just make __unflatten_device_tree accessible to the unit test code and
>> move all this to it. Then you don't need the ifdefery.
>
> Good idea.  I'll do that.
>
>
>> Does this need to be immediately after unflattening the base tree?
>
> My goal is to make the creation of the test data in the tree follow
> the normal process as much as possible, so that real code is tested
> instead of testing test code.
>
> This flattened device tree contains the base information that the
> test overlays are applied against.

Okay. If you need it here, then you can put this all into a unittest
function and call it from here.


>>> +#ifdef CONFIG_OF_OVERLAY
>>> +/*
>>> + * The purpose of of_unittest_overlay_test_data_add is to add an
>>> + * overlay in the normal fashion.  This is a test of the whole
>>> + * picture, instead of testing individual elements.
>>> + *
>>> + * A secondary purpose is to be able to verify that the contents of
>>> + * /proc/device-tree/ contains the updated structure and values from
>>> + * the overlay.  That must be verified separately in user space.
>>> + *
>>> + * Return 0 on unexpected error.
>>> + */
>>> +static int __init overlay_test_data_add(int onum)
>>
>> There's a need for a general function to apply built-in overlays
>> beyond just unittests. See
>> drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c. It's pretty close to the
>> same set of calls.
>
> Yes, agreed.
>
> My plan in the next release cycle is to first clean up drivers/of/overlay.c.
> No functional changes, just cosmetic such as aligning function names with
> what they actually do.
>
> Then make some (hopefully) minor correctness changes, such as locking
> correctly around phandle adjustments.
>
> Then create the general function to apply built-in overlays and convert
> all (two) separate implementations to use the common function.  I did
> not want to delay adding the unit tests to wait for this step.

Okay. Whatever order you want to do it is fine.

Rob
