Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793480533;
	b=M/P+HZoR5nyvKDBB4B1Vr9cxm03hOqIvT/dkzS8tL6qXygH2jBzHQwJU87Au5+tUqcr9
	 1/Ug3r9qrhc7gSBXOrUs2bA8nvONasx9xpd88AAqeCiBZ44af6c2XD5eiBtG4/O9/sSLM
	 rJ90qMzbL4+BBI5AImbWTro3MPecb8GVixLgn8vFXbMdsiENA3sLCkx2z7pmYXgavkTbV
	 vzUFPWl0lc2yBW/mjuKDf0trSrkifAug/22vM9bDV/eSIxa99/I4hmHst++zcsD0m9Nkc
	 Gd0whgylOUugnhRnnl6ThyAiIUV8LsqlkvxPLONpUiL84fHa7HcM7MfLP7Z0Z2h9qAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793480533;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=blcS2ufOqoUhfU8nLzGWjuN4j/BNymuSNU0bZE0coJQ=;
	b=rYf/nVW5W33VrxfUUBAl6sHf6iK7eEdFFYlD/nbMPAApHzhC0pOp+u90vxWHfXaGLeYy
	 E4tNFUMm0v2ld631XNKIch3WGwx4OepFoYwYCw+o0jahwPKLDzHuzC44L16wDScF22jIo
	 RYyW+rT8GGGiT43RZTs1pDtP9PORWQqddRWA9Lik9kTx2QArnkmOlTZLvxWjGVtuHUGu9
	 tzJ/+iwr0bqAGEsrJ5c5isru7gt0g6AcE01QZe4geWvA5t1aic75+hEwaLqfFf80FVdgt
	 aqbScHnu+1RP24wiwawUMUVG0HPhWmiygU+7NBD21m9S0uxqFw7kuOCW1w5rE5KQgXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UOdSI8Tm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B6D606A31C
	for <linux-kbuild@vger.kernel.org>; Sat, 31 Oct 2026 21:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UOdSI8Tm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7CF31F00919;
	Sat, 31 Oct 2026 21:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793480532;
	bh=blcS2ufOqoUhfU8nLzGWjuN4j/BNymuSNU0bZE0coJQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UOdSI8TmOUNvaAdjMdS2Jee/xFtmUM/sG2ZXHIdyvEAG1QNLUk1t10WtVZkXlXFQr
	 8JSjomD/pOig2vJsv4J1GH9Oajf96bmL2niXYTs7BvAcDOREC+KZkd81gMs+GUWEvr
	 /NzEfaSEj09osrG6i4/BoBpWRWiW4DyRYsMgZQFENXxY+p4mn2+/0QeqVTKCEt3BHU
	 hcn17BgbDXklfB0XuiH1dWosdkoiErA4Xj8FWiuPv4XrBP6yvjLRvw+0/0HJVt/yiD
	 +D/USu/4U4VF4zSurIdh1/G/Nc7F7Z1+pw+Eqz7Yv70zfjZydqj6942dR8mVl9cN/k
	 t8+FdVHGDJP1A==
Message-ID: <sashiko-outbox-192141@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 10/23] net: hpe: sl: add the module entry points
Reply-To: sashiko-reviews@lists.linux.dev
To: "Doug Ledford" <doug.ledford@hpe.com>, "Slingshot Open Source Team" <slingshot-os-team@groups.ext.hpe.com>, "Nathan
 Chancellor" <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>, "Richard
 Cochran" <richardcochran@gmail.com>, "Andrew Lunn" <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, "Eric Dumazet" <edumazet@kernel.org>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Sumit
 Semwal" <sumit.semwal@linaro.org>, =?utf-8?b?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, "Guenter
 Roeck" <linux@roeck-us.net>
Cc: linux-kbuild@vger.kernel.org, "Sandeep Bhoot" <sandeep.bhoot@hpe.com>
In-Reply-To: <20261030-cxi-netdev-submission-v1-10-8c2c391cc283@hpe.com>
References: <20261030-cxi-netdev-submission-v1-0-8c2c391cc283@hpe.com>
 <20261030-cxi-netdev-submission-v1-10-8c2c391cc283@hpe.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 31 Oct 2026 21:02:11 +0000
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [Medium] net: hpe: sl: 64-bit cause_map truncation in sl_link_down_cause_=
map_masked_str()
- [Medium] net: hpe: sl: missing unsupported-cable case in sl_link_down_cau=
se_map_masked_str()
- [Low] net: hpe: sl: undocumented module parameter serdes_core_io_trace_lg=
rp_map
- [Low] net: hpe: sl: SL_GIT_HASH_STR stringifies undefined GIT_HASH macro
- [Low] net: hpe: sl: missing option cases in sl_lgrp_config_opt_str() and =
sl_link_config_opt_str()
- [Low] net: hpe: sl: dead stub file sl_media_nic.c and uninitialized size =
fields
--

commit 44ba5c7fee3ca456d297e2330ae6adcfa7c957ae
Author: Doug Ledford <doug.ledford@hpe.com>

net: hpe: sl: add the module entry points

This commit adds the module entry points and the logical device, link group,
link, MAC, LLR, FEC, and media objects that make up the SL API used by the
NIC driver.

> diff --git a/drivers/net/ethernet/hpe/sl/sl_lgrp.c b/drivers/net/ethernet=
/hpe/sl/sl_lgrp.c
> new file mode 100644
> index 0000000000000..bb2dc68f4198a
> --- /dev/null
> +++ b/drivers/net/ethernet/hpe/sl/sl_lgrp.c
[ ... ]
> +const char *sl_lgrp_config_opt_str(u32 option)
> +{
> +	switch (option) {
> +	case SL_LGRP_CONFIG_OPT_SERDES_LOOPBACK_ENABLE:
> +		return "loopback-serdes-enable";
> +	default:
> +		return "unknown";
> +	}
> +}
> +EXPORT_SYMBOL(sl_lgrp_config_opt_str);

[Severity: Low]
In drivers/net/ethernet/hpe/sl/sl_lgrp.c, sl_lgrp_config_opt_str() only
handles SL_LGRP_CONFIG_OPT_SERDES_LOOPBACK_ENABLE, while
include/linux/hpe/sl/sl_lgrp.h also defines SL_LGRP_CONFIG_OPT_FABRIC,
SL_LGRP_CONFIG_OPT_R1, and SL_LGRP_CONFIG_OPT_8BYTE_PREAMBLE.

Similarly, in drivers/net/ethernet/hpe/sl/sl_link.c, sl_link_config_opt_str=
()
omits cases for SL_LINK_CONFIG_OPT_ALD_ENABLE,
SL_LINK_CONFIG_OPT_LOS_LOL_UP_FAIL_HIDE, and
SL_LINK_CONFIG_OPT_PML_REC_ENABLE defined in include/linux/hpe/sl/sl_link.h.

Should sl_lgrp_config_opt_str() and sl_link_config_opt_str() include cases
for those remaining configuration option flags so callers do not get
"unknown" for valid options?

[ ... ]
> diff --git a/drivers/net/ethernet/hpe/sl/sl_link.c b/drivers/net/ethernet=
/hpe/sl/sl_link.c
> new file mode 100644
> index 0000000000000..c66e48a627481
> --- /dev/null
> +++ b/drivers/net/ethernet/hpe/sl/sl_link.c
[ ... ]
> +#define SL_LINK_DOWN_INFO_MASK (     \
> +	SL_LINK_DOWN_RETRYABLE      |\
> +	SL_LINK_DOWN_ORIGIN_ASYNC   |\
> +	SL_LINK_DOWN_ORIGIN_LINK_UP)
> +
> +static int sl_link_down_cause_map_masked_str(unsigned long cause_map, ch=
ar *cause_str, unsigned int cause_str_size,
> +					     u64 mask)
> +{
> +	int rtn;
> +	int str_pos;
> +	int which;
> +
> +	if (!cause_str)
> +		return -EINVAL;
> +
> +	if (cause_str_size < SL_LINK_DOWN_CAUSE_STR_SIZE_MIN)
> +		return -EINVAL;
> +
> +	cause_map &=3D mask;
> +
> +	if (cause_map =3D=3D SL_LINK_DOWN_CAUSE_NONE) {
> +		scnprintf(cause_str, cause_str_size, "none");
> +		return 0;
> +	}
> +
> +	str_pos =3D 0;
> +
> +	for_each_set_bit(which, &cause_map, sizeof(cause_map) * BITS_PER_BYTE) {
> +
> +		switch (BIT(which)) {

[Severity: Medium]
In drivers/net/ethernet/hpe/sl/sl_link.c, sl_link_down_cause_map_str() and
sl_link_down_cause_map_with_info_str() pass a u64 cause_map to
sl_link_down_cause_map_masked_str(), which narrows cause_map to unsigned lo=
ng
and switches on BIT(which).

In include/linux/hpe/sl/sl_link.h, the upper cause and info flags are also
defined with BIT():

  #define SL_LINK_DOWN_CAUSE_TX_LOL            BIT(32)
  #define SL_LINK_DOWN_CAUSE_RX_LOL            BIT(33)
  #define SL_LINK_DOWN_CAUSE_TX_LOS            BIT(34)
  #define SL_LINK_DOWN_CAUSE_RX_LOS            BIT(35)

  #define SL_LINK_DOWN_RETRYABLE               BIT(61)
  #define SL_LINK_DOWN_ORIGIN_ASYNC            BIT(62)
  #define SL_LINK_DOWN_ORIGIN_LINK_UP          BIT(63)

On 32-bit architectures where unsigned long is 32 bits wide, will this
truncate the upper 32 bits of cause_map and overflow BIT(which) and the
switch case labels at bit 32 and above? Should those definitions and the
switch in sl_link_down_cause_map_masked_str() use u64 and BIT_ULL() instead?

> +		case SL_LINK_DOWN_CAUSE_UCW:
> +			rtn =3D snprintf(cause_str + str_pos, cause_str_size - str_pos, "ucw =
");
> +			break;
[ ... ]
> +		case SL_LINK_DOWN_CAUSE_TIMEOUT:
> +			rtn =3D snprintf(cause_str + str_pos, cause_str_size - str_pos, "time=
out ");
> +			break;
> +		case SL_LINK_DOWN_CAUSE_CANCELED:
> +			rtn =3D snprintf(cause_str + str_pos, cause_str_size - str_pos, "canc=
eled ");
> +			break;
> +		case SL_LINK_DOWN_CAUSE_COMMAND:
> +			rtn =3D snprintf(cause_str + str_pos, cause_str_size - str_pos, "comm=
and ");
> +			break;

[Severity: Medium]
In include/linux/hpe/sl/sl_link.h, SL_LINK_DOWN_CAUSE_UNSUPPORTED_CABLE is
defined as BIT(12) between SL_LINK_DOWN_CAUSE_CANCELED (BIT(11)) and
SL_LINK_DOWN_CAUSE_COMMAND (BIT(13)), and is set via
SL_LINK_DOWN_CAUSE_UNSUPPORTED_CABLE_MAP in
drivers/net/ethernet/hpe/sl/core/sl_core_link.h.

However, sl_link_down_cause_map_masked_str() in
drivers/net/ethernet/hpe/sl/sl_link.c does not have a case for
SL_LINK_DOWN_CAUSE_UNSUPPORTED_CABLE, causing it to fall through to default
and format the cause as "unknown ".

Also, SL_LINK_DOWN_CAUSE_STR_SIZE_MIN is defined as 4, which is smaller than
sizeof("none") and smaller than any single cause string before the truncati=
on
logic writes "..." at cause_str[str_pos - 3].

Was a case for SL_LINK_DOWN_CAUSE_UNSUPPORTED_CABLE missed in
sl_link_down_cause_map_masked_str()?

[ ... ]
> diff --git a/drivers/net/ethernet/hpe/sl/sl_media_nic.c b/drivers/net/eth=
ernet/hpe/sl/sl_media_nic.c
> new file mode 100644
> index 0000000000000..23af513e6bd90
> --- /dev/null
> +++ b/drivers/net/ethernet/hpe/sl/sl_media_nic.c
> @@ -0,0 +1,23 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright 2025 Hewlett Packard Enterprise Development LP */
> +
> +#include <linux/module.h>
> +#include <linux/types.h>
> +
> +#include <linux/hpe/sl/sl_lgrp.h>
> +
> +#include "sl_lgrp.h"
> +
> +int sl_media_cable_insert(struct sl_lgrp *lgrp, u8 *eeprom_page0, u8 *ee=
prom_page1, u32 flags)
> +{
> +	/* placeholder for future functionality */
> +	return 0;
> +}
> +EXPORT_SYMBOL(sl_media_cable_insert);
> +
> +int sl_media_cable_remove(struct sl_lgrp *lgrp)
> +{
> +	/* placeholder for future functionality */
> +	return 0;
> +}
> +EXPORT_SYMBOL(sl_media_cable_remove);

[Severity: Low]
This isn't a runtime bug, but drivers/net/ethernet/hpe/sl/sl_media_nic.c
defines and exports no-op stubs for sl_media_cable_insert() and
sl_media_cable_remove(), while drivers/net/ethernet/hpe/sl/nic/sl_media.c
provides the actual implementations and EXPORT_SYMBOL() definitions for both
functions, and drivers/net/ethernet/hpe/sl/Makefile only builds
nic/sl_media.o.

In addition, struct sl_lgrp and struct sl_link declare a u32 size field
alongside magic and ver just like struct sl_ldev, and sl_ldev_init() in
drivers/net/ethernet/hpe/sl/sl_ldev.c sets ldevs[ldev_num].size, whereas
sl_lgrp_init() in drivers/net/ethernet/hpe/sl/sl_lgrp.c and sl_link_init() =
in
drivers/net/ethernet/hpe/sl/sl_link.c leave size uninitialized.

Should drivers/net/ethernet/hpe/sl/sl_media_nic.c be dropped and the size
fields initialized (or removed if unused) for consistency?

> diff --git a/drivers/net/ethernet/hpe/sl/sl_module.c b/drivers/net/ethern=
et/hpe/sl/sl_module.c
> new file mode 100644
> index 0000000000000..b63efedf94ff5
> --- /dev/null
> +++ b/drivers/net/ethernet/hpe/sl/sl_module.c
[ ... ]
> +static unsigned long serdes_core_io_trace_lgrp_map;
> +module_param(serdes_core_io_trace_lgrp_map, ulong, 0644);
> +MODULE_PARM_DESC(serdes_core_io_trace_lgrp_map, "serdes core io trace en=
able link group map");

[Severity: Low]
In drivers/net/ethernet/hpe/sl/sl_module.c, serdes_core_io_trace_lgrp_map is
registered as a module parameter via module_param(), making it configurable
at boot and runtime, but Documentation/admin-guide/kernel-parameters.txt is
not updated in this patch.

Should serdes_core_io_trace_lgrp_map be documented in
Documentation/admin-guide/kernel-parameters.txt?

> +
> +u64 sl_serdes_core_io_trace_lgrp_map_get(void)
> +{
> +	return serdes_core_io_trace_lgrp_map;
> +}
> +
> +#define SL_DEVICE_NAME "sl"
> +
> +#define tostr(x)             #x
> +#define version_str(a, b, c) tostr(a.b.c)
> +#define SL_VERSION_STR       version_str(SL_VERSION_MAJOR, SL_VERSION_MI=
NOR, SL_VERSION_INC)
> +#define hash_str(h)          tostr(h)
> +#define SL_GIT_HASH_STR      hash_str(GIT_HASH)
> +
> +void sl_version_get(int *major, int *minor, int *inc)
> +{
> +	if (major)
> +		*major =3D SL_VERSION_MAJOR;
> +	if (minor)
> +		*minor =3D SL_VERSION_MINOR;
> +	if (inc)
> +		*inc =3D SL_VERSION_INC;
> +}
> +EXPORT_SYMBOL(sl_version_get);
> +
> +char *sl_version_str_get(void)
> +{
> +	return SL_VERSION_STR;
> +}
> +
> +char *sl_git_hash_str_get(void)
> +{
> +	return (strlen(SL_GIT_HASH_STR) =3D=3D 0) ? "unavailable" : SL_GIT_HASH=
_STR;
> +}
> +EXPORT_SYMBOL(sl_git_hash_str_get);

[Severity: Low]
In drivers/net/ethernet/hpe/sl/sl_module.c, GIT_HASH is not defined in any
header or Makefile, so SL_GIT_HASH_STR expands hash_str(GIT_HASH) into the
string literal "GIT_HASH".

As a result, strlen(SL_GIT_HASH_STR) =3D=3D 0 in sl_git_hash_str_get() is n=
ever
true, sl_git_hash_str_get() returns "GIT_HASH" instead of "unavailable", and
sl_init() logs "hash GIT_HASH".

Is SL_GIT_HASH_STR / sl_git_hash_str_get() needed in an in-tree kernel buil=
d,
or should GIT_HASH default to an empty string when not defined?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030-cxi-netdev=
-submission-v1-0-8c2c391cc283@hpe.com?part=3D10
