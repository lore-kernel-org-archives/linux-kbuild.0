Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:33750 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S972791AbdDXRrf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 24 Apr 2017 13:47:35 -0400
Subject: Re: [PATCH 2/2] of: Add unit tests for applying overlays.
References: <1493012595-696-1-git-send-email-frowand.list@gmail.com>
 <1493012595-696-3-git-send-email-frowand.list@gmail.com>
 <CAL_JsqK3-MgkqBo6mGbs9dmo8Lwwx9dYW4SKyGjUDt_7wSecnA@mail.gmail.com>
From: Frank Rowand <frowand.list@gmail.com>
Message-ID: <58FE3A1B.9000503@gmail.com>
Date: Mon, 24 Apr 2017 10:47:07 -0700
MIME-Version: 1.0
In-Reply-To: <CAL_JsqK3-MgkqBo6mGbs9dmo8Lwwx9dYW4SKyGjUDt_7wSecnA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Rob Herring <robh+dt@kernel.org>
Cc: Stephen Boyd <stephen.boyd@linaro.org>, Michal Marek <mmarek@suse.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On 04/24/17 10:16, Rob Herring wrote:
> On Mon, Apr 24, 2017 at 12:43 AM,  <frowand.list@gmail.com> wrote:
>> From: Frank Rowand <frank.rowand@sony.com>
>>
>> Existing overlay unit tests examine individual pieces of the overlay
>> code.  The new tests target the entire process of applying an overlay.
>>
>> Signed-off-by: Frank Rowand <frank.rowand@sony.com>
>> ---
>>
>> There are checkpatch warnings.  I have reviewed them and feel they
>> can be ignored.
>>
>>  drivers/of/fdt.c                            |  45 +++++
>>  drivers/of/of_private.h                     |   2 +
>>  drivers/of/unittest-data/Makefile           |  17 +-
>>  drivers/of/unittest-data/ot.dts             |  53 ++++++
>>  drivers/of/unittest-data/ot_bad_phandle.dts |  20 +++
>>  drivers/of/unittest-data/ot_base.dts        |  71 ++++++++
>>  drivers/of/unittest.c                       | 264 ++++++++++++++++++++++++++++
>>  7 files changed, 469 insertions(+), 3 deletions(-)
>>  create mode 100644 drivers/of/unittest-data/ot.dts
>>  create mode 100644 drivers/of/unittest-data/ot_bad_phandle.dts
>>  create mode 100644 drivers/of/unittest-data/ot_base.dts
> 
> ot? Overlay Test? That's not very obvious if so.

Yes, and yes.  I'll make more explicit.


> 
>> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
>> index e5ce4b59e162..54120ab8f322 100644
>> --- a/drivers/of/fdt.c
>> +++ b/drivers/of/fdt.c
>> @@ -31,6 +31,8 @@
>>  #include <asm/setup.h>  /* for COMMAND_LINE_SIZE */
>>  #include <asm/page.h>
>>
>> +#include "of_private.h"
>> +
>>  /*
>>   * of_fdt_limit_memory - limit the number of regions in the /memory node
>>   * @limit: maximum entries
>> @@ -1256,11 +1258,54 @@ bool __init early_init_dt_scan(void *params)
>>   */
>>  void __init unflatten_device_tree(void)
>>  {
>> +#ifdef CONFIG_OF_UNITTEST
>> +       extern uint8_t __dtb_ot_base_begin[];
>> +       extern uint8_t __dtb_ot_base_end[];
>> +       struct device_node *ot_base_root;
>> +       void *ot_base;
>> +       u32 data_size;
>> +       u32 size;
>> +#endif
>> +
>>         __unflatten_device_tree(initial_boot_params, NULL, &of_root,
>>                                 early_init_dt_alloc_memory_arch, false);
>>
>>         /* Get pointer to "/chosen" and "/aliases" nodes for use everywhere */
>>         of_alias_scan(early_init_dt_alloc_memory_arch);
> 
> Just make __unflatten_device_tree accessible to the unit test code and
> move all this to it. Then you don't need the ifdefery.

Good idea.  I'll do that.


> Does this need to be immediately after unflattening the base tree?

My goal is to make the creation of the test data in the tree follow
the normal process as much as possible, so that real code is tested
instead of testing test code.

This flattened device tree contains the base information that the
test overlays are applied against.


>> +
>> +#ifdef CONFIG_OF_UNITTEST
>> +       /*
>> +        * Base device tree for the overlay unittest.
>> +        * Do as much as possible the same way as done for the normal FDT.
>> +        * Have to stop before resolving phandles, because that uses kmalloc.
>> +        */
>> +
>> +       data_size = __dtb_ot_base_end - __dtb_ot_base_begin;
>> +       if (!data_size) {
>> +               pr_err("No __dtb_ot_base_begin to attach\n");
>> +               return;
>> +       }
>> +
>> +       size = fdt_totalsize(__dtb_ot_base_begin);
>> +       if (size != data_size) {
>> +               pr_err("__dtb_ot_base_begin header totalsize != actual size");
>> +               return;
>> +       }
>> +
>> +       ot_base = early_init_dt_alloc_memory_arch(size,
>> +                                            roundup_pow_of_two(FDT_V17_SIZE));
>> +       if (!ot_base) {
>> +               pr_err("alloc of ot_base failed");
>> +               return;
>> +       }
>> +
>> +       memcpy(ot_base, __dtb_ot_base_begin, size);
>> +
>> +       __unflatten_device_tree(ot_base, NULL, &ot_base_root,
>> +                               early_init_dt_alloc_memory_arch, true);
>> +
>> +       unittest_set_ot_base_root(ot_base_root);
>> +#endif
>>  }
>>
>>  /**
>> diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
>> index f4f6793d2f04..02d54da078ac 100644
>> --- a/drivers/of/of_private.h
>> +++ b/drivers/of/of_private.h
>> @@ -55,6 +55,8 @@ static inline int of_property_notify(int action, struct device_node *np,
>>  }
>>  #endif /* CONFIG_OF_DYNAMIC */
>>
>> +extern void unittest_set_ot_base_root(struct device_node *dn);
>> +
>>  /**
>>   * General utilities for working with live trees.
>>   *
>> diff --git a/drivers/of/unittest-data/Makefile b/drivers/of/unittest-data/Makefile
>> index 1ac5cc01d627..6879befe29d2 100644
>> --- a/drivers/of/unittest-data/Makefile
>> +++ b/drivers/of/unittest-data/Makefile
>> @@ -1,7 +1,18 @@
>>  obj-y += testcases.dtb.o
>> +obj-y += ot.dtb.o
>> +obj-y += ot_bad_phandle.dtb.o
>> +obj-y += ot_base.dtb.o
>>
>>  targets += testcases.dtb testcases.dtb.S
>> +targets += ot.dtb ot.dtb.S
>> +targets += ot_bad_phandle.dtb ot_bad_phandle.dtb.S
>> +targets += ot_base.dtb ot_base.dtb.S
>>
>> -.SECONDARY: \
>> -       $(obj)/testcases.dtb.S \
>> -       $(obj)/testcases.dtb
>> +.PRECIOUS: \
>> +       $(obj)/%.dtb.S \
>> +       $(obj)/%.dtb
>> +
>> +# enable creation of __symbols__ node
>> +DTC_FLAGS_ot := -@
>> +DTC_FLAGS_ot_base := -@
>> +DTC_FLAGS_ot_bad_phandle := -@
>> diff --git a/drivers/of/unittest-data/ot.dts b/drivers/of/unittest-data/ot.dts
>> new file mode 100644
>> index 000000000000..37e105622b7a
>> --- /dev/null
>> +++ b/drivers/of/unittest-data/ot.dts
>> @@ -0,0 +1,53 @@
>> +/dts-v1/;
>> +/plugin/;
>> +
>> +/ {
>> +
>> +       fragment@0 {
>> +               target = <&electric_1>;
>> +
>> +               __overlay__ {
>> +                       status = "ok";
>> +
>> +                       hvac_2: hvac_large_1 {
> 
> We should follow best practice here and not use '_' for node names. I
> wonder what warnings dtc throws with W=2 for the unittests. Don't
> think I tried that when adding them.

Oops.  Will fix.


>> +                               compatible = "ot,hvac-large";
>> +                               heat-range = < 40 75 >;
>> +                               cool-range = < 65 80 >;
>> +                       };
>> +               };
>> +       };
>> +
>> +       fragment@1 {
>> +               target = <&rides_1>;
>> +
>> +               __overlay__ {
>> +                       #address-cells = <1>;
>> +                       #size-cells = <1>;
>> +                       status = "ok";
>> +
>> +                       ride@200 {
>> +                               compatible = "ot,ferris-wheel";
>> +                               reg = < 0x00000200 0x100 >;
>> +                               hvac-provider = < &hvac_2 >;
>> +                               hvac-thermostat = < 27 32 > ;
>> +                               hvac-zones = < 12 5 >;
>> +                               hvac-zone-names = "operator", "snack-bar";
>> +                               spin-controller = < &spin_ctrl_1 3 >;
>> +                               spin-rph = < 30 >;
>> +                               gondolas = < 16 >;
>> +                               gondola-capacity = < 6 >;
>> +                       };
>> +               };
>> +       };
>> +
>> +       fragment@2 {
>> +               target = <&lights_2>;
>> +
>> +               __overlay__ {
>> +                       status = "ok";
>> +                       color = "purple", "white", "red", "green";
>> +                       rate = < 3 256 >;
>> +               };
>> +       };
>> +
>> +};
>> diff --git a/drivers/of/unittest-data/ot_bad_phandle.dts b/drivers/of/unittest-data/ot_bad_phandle.dts
>> new file mode 100644
>> index 000000000000..234d5f1dcfe4
>> --- /dev/null
>> +++ b/drivers/of/unittest-data/ot_bad_phandle.dts
>> @@ -0,0 +1,20 @@
>> +/dts-v1/;
>> +/plugin/;
>> +
>> +/ {
>> +
>> +       fragment@0 {
>> +               target = <&electric_1>;
>> +
>> +               __overlay__ {
>> +
>> +                       // This label should cause an error when the overlay
>> +                       // is applied.  There is already a phandle value
>> +                       // in the base tree for motor_1.
>> +                       spin_ctrl_1_conflict: motor_1 {
>> +                               accelerate = < 3 >;
>> +                               decelerate = < 5 >;
>> +                       };
>> +               };
>> +       };
>> +};
>> diff --git a/drivers/of/unittest-data/ot_base.dts b/drivers/of/unittest-data/ot_base.dts
>> new file mode 100644
>> index 000000000000..0a4fbe598b02
>> --- /dev/null
>> +++ b/drivers/of/unittest-data/ot_base.dts
>> @@ -0,0 +1,71 @@
>> +/dts-v1/;
>> +/plugin/;
>> +
>> +/ {
>> +       testcase-data-2 {
>> +               #address-cells = <1>;
>> +               #size-cells = <1>;
>> +
>> +               electric_1: substation@100 {
>> +                       compatible = "ot,big-volts-control";
>> +                       reg = < 0x00000100 0x100 >;
>> +                       status = "disabled";
>> +
>> +                       hvac_1: hvac_medium_1 {
>> +                               compatible = "ot,hvac-medium";
>> +                               heat-range = < 50 75 >;
>> +                               cool-range = < 60 80 >;
>> +                       };
>> +
>> +                       spin_ctrl_1: motor_1 {
>> +                               compatible = "ot,ferris-wheel-motor";
>> +                               spin = "clockwise";
>> +                       };
>> +
>> +                       spin_ctrl_2: motor_8 {
>> +                               compatible = "ot,roller-coaster-motor";
>> +                       };
>> +               };
>> +
>> +               rides_1: fairway_1 {
>> +                       #address-cells = <1>;
>> +                       #size-cells = <1>;
>> +                       compatible = "ot,rides";
>> +                       status = "disabled";
>> +                       orientation = < 127 >;
>> +
>> +                       ride@100 {
>> +                               compatible = "ot,roller-coaster";
>> +                               reg = < 0x00000100 0x100 >;
>> +                               hvac-provider = < &hvac_1 >;
>> +                               hvac-thermostat = < 29 > ;
>> +                               hvac-zones = < 14 >;
>> +                               hvac-zone-names = "operator";
>> +                               spin-controller = < &spin_ctrl_2 5 &spin_ctrl_2 7 >;
>> +                               spin-controller-names = "track_1", "track_2";
>> +                               queues = < 2 >;
>> +                       };
>> +               };
>> +
>> +               lights_1: lights@30000 {
>> +                       compatible = "ot,work-lights";
>> +                       reg = < 0x00030000 0x1000 >;
>> +                       status = "disabled";
>> +               };
>> +
>> +               lights_2: lights@40000 {
>> +                       compatible = "ot,show-lights";
>> +                       reg = < 0x00040000 0x1000 >;
>> +                       status = "disabled";
>> +                       rate = < 13 138 >;
>> +               };
>> +
>> +               retail_1: vending@50000 {
>> +                       reg = < 0x00050000 0x1000 >;
>> +                       compatible = "ot,tickets";
>> +                       status = "disabled";
>> +               };
>> +
>> +       };
>> +};
>> +
>> diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
>> index 62db55b97c10..599eb10e9b40 100644
>> --- a/drivers/of/unittest.c
>> +++ b/drivers/of/unittest.c
>> @@ -8,6 +8,7 @@
>>  #include <linux/err.h>
>>  #include <linux/errno.h>
>>  #include <linux/hashtable.h>
>> +#include <linux/libfdt.h>
>>  #include <linux/of.h>
>>  #include <linux/of_fdt.h>
>>  #include <linux/of_irq.h>
>> @@ -42,6 +43,13 @@
>>         failed; \
>>  })
>>
>> +static struct device_node *ot_base_root;
>> +
>> +void unittest_set_ot_base_root(struct device_node *dn)
>> +{
>> +       ot_base_root = dn;
>> +}
>> +
>>  static void __init of_unittest_find_node_by_name(void)
>>  {
>>         struct device_node *np;
>> @@ -1925,6 +1933,259 @@ static void __init of_unittest_overlay(void)
>>  static inline void __init of_unittest_overlay(void) { }
>>  #endif
>>
>> +#define OVERLAY_INFO_EXTERN(name) \
>> +       extern uint8_t __dtb_##name##_begin[]; \
>> +       extern uint8_t __dtb_##name##_end[]
>> +
>> +#define OVERLAY_INFO(name, expected) \
>> +{      .dtb_begin       = __dtb_##name##_begin, \
>> +       .dtb_end         = __dtb_##name##_end, \
>> +       .expected_result = expected, \
>> +}
>> +
>> +struct overlay_info {
>> +       uint8_t            *dtb_begin;
>> +       uint8_t            *dtb_end;
>> +       void               *data;
>> +       struct device_node *np_overlay;
>> +       int                expected_result;
>> +       int                overlay_id;
>> +};
>> +
>> +OVERLAY_INFO_EXTERN(ot);
>> +OVERLAY_INFO_EXTERN(ot_bad_phandle);
>> +
>> +struct overlay_info overlays[] = {
>> +       OVERLAY_INFO(ot, 0),
>> +       OVERLAY_INFO(ot_bad_phandle, -EINVAL),
>> +       {}
>> +};
>> +
>> +#ifdef CONFIG_OF_OVERLAY
>> +/*
>> + * The purpose of of_unittest_overlay_test_data_add is to add an
>> + * overlay in the normal fashion.  This is a test of the whole
>> + * picture, instead of testing individual elements.
>> + *
>> + * A secondary purpose is to be able to verify that the contents of
>> + * /proc/device-tree/ contains the updated structure and values from
>> + * the overlay.  That must be verified separately in user space.
>> + *
>> + * Return 0 on unexpected error.
>> + */
>> +static int __init overlay_test_data_add(int onum)
> 
> There's a need for a general function to apply built-in overlays
> beyond just unittests. See
> drivers/gpu/drm/tilcdc/tilcdc_slave_compat.c. It's pretty close to the
> same set of calls.

Yes, agreed.

My plan in the next release cycle is to first clean up drivers/of/overlay.c.
No functional changes, just cosmetic such as aligning function names with
what they actually do.

Then make some (hopefully) minor correctness changes, such as locking
correctly around phandle adjustments.

Then create the general function to apply built-in overlays and convert
all (two) separate implementations to use the common function.  I did
not want to delay adding the unit tests to wait for this step.

> Rob
> 

