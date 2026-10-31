Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793480536;
	b=GPTmbCZaEZpqgQd+kyUpLdTe7PNnDnHYJ7Xq/BLgj4/vabVjd1gAjIOLte1Y3BYb1Tl2
	 HdGHwWPvxJLi2JrwYS0hz8fqjyTOwLNWS0qWV2IiJNooL1DZmnYZRoSe3klZv0XfvjStL
	 NdPgtDdCozzbN+LWbns8G+FhI2fxkhlJTodqiq+Gyekdk7vEnP1JYT+FHfjZ3GQYSzblg
	 qewQW976AN6sd1qfuzOirGajk7eZ5D/g6Jf/3cNSrMjmtBXs5fWa5DQD/XTMk60mcPnHN
	 H0F4qluwNwjwiUAkcShkqAeEF4oxhk6f7tmvilab1Z6GdqCyeNqMx8hmvKTrcqdg5dA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793480536;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=2gAXVVDmfa7GtuEze0zwPKdw4DistuIPUYHpc5689fE=;
	b=x7+8soMJ1hWgEjr5a87Mx1jucUbXEWLbrCPtiqsFbxhNmPfGHhdzB2y5VZIsOAA480nk
	 0cc5USbymTMHGGZNMkvpigxyYYQzWYX4ZISNWTmFhInb2y9YJytkffQ0XqBNm/wKIkxv+
	 S2HaiEHn/lXixgbpMr3P1MLuDRvZ432FA/RQNOkdokqGO6+eZ1+Amxa+ZrIMPNIqKyGRZ
	 U6L2nKLdQJCQ99neTS4mU/R95Cj1FPY2UvavFN6UEgQzIqzmHqvrD1o3gPRuH7FNDHpJt
	 Zv/e1gtssMD5C2QC7UqEBsZREI2Exh8h+bhcO59hBMyHJChS6uYu1ogIkA99uwQv7tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b+vLLgjj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D200606A31F
	for <linux-kbuild@vger.kernel.org>; Sat, 31 Oct 2026 21:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b+vLLgjj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43BF11F0093A;
	Sat, 31 Oct 2026 21:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793480534;
	bh=2gAXVVDmfa7GtuEze0zwPKdw4DistuIPUYHpc5689fE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b+vLLgjjOVyfi6YFl9KvuhVXre25PMBf4V9dGg8OqVXnwVfwqI6z4PPWBvNhAuJ9f
	 QwHiR8r2ZtTbceog1LJxkGJ6nmEC9YlxWLqgLE6CCBysyrA/QfF72P2BotsV54C3pb
	 EdnUoWiS9ZK2yBsrU4N5lhpgwVxDAoWZXPhZrS6DaxsmnXSyZYtW1oaz3HyMADxOf6
	 z0lUcprIfOyfg5AYsFJD1SC87s59Ls3q5Ei9GhFYE9P7e8sKowm8eN0gbcRVEOZ1Nm
	 +D4APvhW61Y7lAJ2ybbk9rEy+OrPeTwbEAFZD8rl09qRIRJzmhrdC7JNO9qVFzOSt/
	 /iz5pdEwzeKSA==
Message-ID: <sashiko-outbox-192143@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 13/23] net: hpe: sl: add media and cable handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Doug Ledford" <doug.ledford@hpe.com>, "Slingshot Open Source Team" <slingshot-os-team@groups.ext.hpe.com>, "Nathan
 Chancellor" <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>, "Richard
 Cochran" <richardcochran@gmail.com>, "Andrew Lunn" <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, "Eric Dumazet" <edumazet@kernel.org>, "Jakub
 Kicinski" <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Sumit
 Semwal" <sumit.semwal@linaro.org>, =?utf-8?b?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, "Guenter
 Roeck" <linux@roeck-us.net>
Cc: linux-kbuild@vger.kernel.org, "Mamila Santosh" <santosh-kumar.mamila@hpe.com>
In-Reply-To: <20261030-cxi-netdev-submission-v1-13-8c2c391cc283@hpe.com>
References: <20261030-cxi-netdev-submission-v1-0-8c2c391cc283@hpe.com>
 <20261030-cxi-netdev-submission-v1-13-8c2c391cc283@hpe.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 31 Oct 2026 21:02:13 +0000
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 12 potential issue=
(s) to consider:
- [High] net: hpe: sl: unchecked cable_db_idx and s8 -1 fw_ver format in sl=
_media_eeprom.c
- [High] net: hpe: sl: off-by-one memset in lgrp string getters leaks stack=
 byte
- [Medium] net: hpe: sl: broken 800GAUI/400GAUI AppSel tracking blocks cabl=
e upshift
- [Medium] net: hpe: sl: false shift state in sl_media_data_jack_cable_hw_s=
hift_state_get()
- [Medium] net: hpe: sl: uninitialized port_count in sl_media_lgrp_cable_te=
mp_flags_clr()
- [Medium] net: hpe: sl: state corruption and error handling bugs in sl_med=
ia_jack_cable_insert()
- [Medium] net: hpe: sl: sl_media_lgrp_media_has_error() ignores headshell =
fault bit
- [Medium] net: hpe: sl: missing data_lock around serdes_settings and eepro=
m pages
- [Low] net: hpe: sl: 32-byte scan overreads 16-byte EEPROM vendor field in=
 sl_media_eeprom_vendor_get()
- [Low] net: hpe: sl: truncation ellipsis overwrites prior token in sl_medi=
a_jack_attr_error_map_str()
- [Low] net: hpe: sl: initialize __free() variables at declaration in sl_me=
dia_jack.c
- [Low] net: hpe: sl: duplicate static cable_db table across translation un=
its
--

commit cc0bbe902777ab4ddc9dbd22dcc52b5c6f8460fa
Author: Doug Ledford <doug.ledford@hpe.com>

net: hpe: sl: add media and cable handling

This commit adds cable and media handling for the HPE Slingshot driver,
including EEPROM parsing, the cable database, per-jack data management, and
emulated jack support.

> diff --git a/drivers/net/ethernet/hpe/sl/media/base/sl_media_eeprom.c b/d=
rivers/net/ethernet/hpe/sl/media/base/sl_media_eeprom.c
> new file mode 100644
> index 0000000000000..80113ec4860d3
> --- /dev/null
> +++ b/drivers/net/ethernet/hpe/sl/media/base/sl_media_eeprom.c
> @@ -0,0 +1,611 @@
[ ... ]
> +#include "sl_media_eeprom.h"
> +#include "sl_media_lgrp.h"
> +#include "sl_media_jack.h"
> +#include "base/sl_media_log.h"
> +#include "data/sl_media_data_cable_db.h"

[Severity: Low]
This isn't a bug, but data/sl_media_data_cable_db.h defines a 327-entry
(~21 KB) non-const static array:

  static struct sl_media_cable_attr cable_db[] =3D { ... };

Including data/sl_media_data_cable_db.h and indexing cable_db[] in both
sl_media_eeprom.c and sl_media_data_cable_db_ops.c (as well as pulling it in
via sl_ctrl_ldev.h) instantiates separate mutable copies of the table across
translation units. Could cable_db be defined once as const in a single .c
file with its declaration or size exposed in the header?

> +
> +#define LOG_NAME SL_MEDIA_EEPROM_LOG_NAME
> +
> +static void sl_media_eeprom_appsel_info_store(struct sl_media_jack *medi=
a_jack, u8 host_interface,
> +					      unsigned long *speeds_map, u8 appsel_num, u8 lane_count)
> +{
> +	switch (host_interface) {
[ ... ]
> +	case SL_MEDIA_SS2_HOST_INTERFACE_400GAUI_4_S_C2M:
> +		*speeds_map |=3D SL_MEDIA_SPEEDS_SUPPORT_CK_400G;
> +		if (media_jack->appsel_num_400_gaui) /* we prefer 4_l_c2m over 4_s_c2m=
 for default ck400G speed */
> +			break;
> +		media_jack->appsel_num_400_gaui =3D appsel_num;
> +		media_jack->lane_count_400_gaui =3D lane_count;
> +		media_jack->host_interface_400_gaui =3D host_interface;
> +		break;
> +	case SL_MEDIA_SS1_HOST_INTERFACE_400GAUI_4_L_C2M:
> +		*speeds_map |=3D SL_MEDIA_SPEEDS_SUPPORT_CK_400G;
> +		media_jack->appsel_num_400_gaui =3D appsel_num;
> +		media_jack->lane_count_400_gaui =3D lane_count;
> +		media_jack->host_interface_400_gaui =3D host_interface;
> +		fallthrough;
[ ... ]
> +	case SL_MEDIA_SS2_HOST_INTERFACE_800GAUI_8_S_C2M:
> +		*speeds_map |=3D SL_MEDIA_SPEEDS_SUPPORT_CK_400G;
> +		*speeds_map |=3D SL_MEDIA_SPEEDS_SUPPORT_CK_800G;
> +		if (!media_jack->host_interface_400_gaui) {
> +			media_jack->appsel_num_400_gaui =3D appsel_num;
> +			media_jack->host_interface_400_gaui =3D host_interface;
> +		}
> +		break;

[Severity: Medium]
Can an active cable advertising SL_MEDIA_SS2_HOST_INTERFACE_800GAUI_8_S_C2M
ever upshift back to 400G after downshifting to 200G?

When SL_MEDIA_SS2_HOST_INTERFACE_800GAUI_8_S_C2M is parsed first in
sl_media_eeprom_appsel_info_store(), it sets media_jack->appsel_num_400_gaui
and media_jack->host_interface_400_gaui, leaving
media_jack->lane_count_400_gaui as 0. If a subsequent AppSel entry is
SL_MEDIA_SS2_HOST_INTERFACE_400GAUI_4_S_C2M, the check:

  if (media_jack->appsel_num_400_gaui)
      break;

skips recording the 400GAUI_4_S_C2M descriptor because appsel_num_400_gaui =
is
already non-zero.

Then in sl_media_jack_cable_shift_checks() in sl_media_jack.c,
SL_MEDIA_JACK_CABLE_DOWNSHIFT only checks that
media_jack->host_interface_400_gaui !=3D 0, which succeeds, whereas
SL_MEDIA_JACK_CABLE_UPSHIFT requires:

  if (((media_lgrp->media_jack->host_interface_400_gaui !=3D SL_MEDIA_SS2_H=
OST_INTERFACE_400GAUI_4_S_C2M) &&
       (media_lgrp->media_jack->host_interface_400_gaui !=3D SL_MEDIA_SS1_H=
OST_INTERFACE_400GAUI_4_L_C2M)) ||
      (media_lgrp->media_jack->lane_count_400_gaui !=3D 0x44))

which fails on both host_interface_400_gaui and lane_count_400_gaui, leaving
the cable unable to upshift back to 400G.

[ ... ]
> +#define CMIS_VENDOR_OFFSET      129
> +#define SFF8436_VENDOR_OFFSET   148
> +#define VENDOR_NAME_MAX_LEN     32
> +struct vendor {
> +	char name[VENDOR_NAME_MAX_LEN];
> +	u32  type;
> +};
[ ... ]
> +static int sl_media_eeprom_vendor_get(struct sl_media_jack *media_jack, =
u8 format, u32 *vendor)
> +{
> +	const char *vendor_ptr;
> +	int         x;
> +
> +	if (format =3D=3D SL_MEDIA_MGMT_IF_CMIS)
> +		vendor_ptr =3D &(media_jack->eeprom_page0[CMIS_VENDOR_OFFSET]);
> +	else
> +		vendor_ptr =3D &(media_jack->eeprom_page0[SFF8436_VENDOR_OFFSET]);
> +
> +	for (x =3D 0; x < ARRAY_SIZE(vendor_list); ++x) {
> +		if (strnstr(vendor_ptr, vendor_list[x].name, VENDOR_NAME_MAX_LEN) =3D=
=3D NULL)
> +			continue;
> +		*vendor =3D vendor_list[x].type;
> +		sl_media_log_dbg(media_jack, LOG_NAME,
> +				 "vendor get (vendor =3D %u %s)", *vendor, sl_media_vendor_str(*vend=
or));
> +		return 0;
> +	}
> +
> +	*vendor =3D 0;

[Severity: Low]
In both CMIS (bytes 129..144) and SFF-8436/8636 (bytes 148..163), the EEPROM
vendor name field is 16 bytes of space-padded ASCII without a NUL terminato=
r.
Passing VENDOR_NAME_MAX_LEN (32) to strnstr() in sl_media_eeprom_vendor_get=
()
scans 16 bytes past the end of the vendor field into the adjacent OUI and
vendor part number fields in eeprom_page0.

Also, when no entry in vendor_list matches, should *vendor be set to
SL_MEDIA_VENDOR_UNKNOWN rather than 0 (which sl_media_vendor_str() reports =
as
"invalid")?

[ ... ]
> +bool sl_media_eeprom_is_fw_version_supported(struct sl_media_jack *media=
_jack, struct sl_media_attr *media_attr)
> +{
> +	sl_media_log_dbg(media_jack, LOG_NAME,
> +			 "is fw version supported (type =3D 0x%X %s, shape =3D %u %s, end =3D=
 %u %s, idx =3D %d)",
> +			 media_attr->type, sl_media_type_str(media_attr->type),
> +			 media_attr->shape, sl_media_shape_str(media_attr->shape),
> +			 media_jack->cable_end, sl_media_cable_end_str(media_jack->cable_end),
> +			 media_jack->cable_db_idx);
> +	sl_media_log_dbg(media_jack, LOG_NAME,
> +			 "is fw version supported (fw_ver =3D %02X.%02X, db_fw_ver =3D %02X.%=
02X, db_split_fw_ver =3D %02X.%02X)",
> +			 media_attr->fw_ver[0], media_attr->fw_ver[1],
> +			 cable_db[media_jack->cable_db_idx].fw_ver.major,
> +			 cable_db[media_jack->cable_db_idx].fw_ver.minor,
> +			 cable_db[media_jack->cable_db_idx].fw_ver.split_major,
> +			 cable_db[media_jack->cable_db_idx].fw_ver.split_minor);
> +
> +	if (media_attr->shape =3D=3D SL_MEDIA_SHAPE_SPLITTER && media_jack->cab=
le_end !=3D SL_MEDIA_CABLE_END_DD)
> +		return ((media_attr->fw_ver[0] > cable_db[media_jack->cable_db_idx].fw=
_ver.split_major) ||
> +			((media_attr->fw_ver[0] =3D=3D cable_db[media_jack->cable_db_idx].fw_=
ver.split_major) &&
> +			(media_attr->fw_ver[1] >=3D cable_db[media_jack->cable_db_idx].fw_ver=
.split_minor)));
> +
> +	return ((media_attr->fw_ver[0] > cable_db[media_jack->cable_db_idx].fw_=
ver.major) ||
> +		((media_attr->fw_ver[0] =3D=3D cable_db[media_jack->cable_db_idx].fw_v=
er.major) &&
> +		(media_attr->fw_ver[1] >=3D cable_db[media_jack->cable_db_idx].fw_ver.=
minor)));
> +}
> +
> +int sl_media_eeprom_target_fw_ver_str_get(struct sl_media_jack *media_ja=
ck, char *target_fw_str, size_t target_fw_size)
> +{
[ ... ]
> +	if (media_jack->cable_info[0].media_attr.shape =3D=3D SL_MEDIA_SHAPE_SP=
LITTER &&
> +	    media_jack->cable_end !=3D SL_MEDIA_CABLE_END_DD) {
> +		snprintf(target_fw_str, target_fw_size, "%02X.%02X\n",
> +			 cable_db[media_jack->cable_db_idx].fw_ver.split_major,
> +			 cable_db[media_jack->cable_db_idx].fw_ver.split_minor);
> +		return 0;
> +	}
> +
> +	snprintf(target_fw_str, target_fw_size, "%02X.%02X\n",
> +		 cable_db[media_jack->cable_db_idx].fw_ver.major,
> +		 cable_db[media_jack->cable_db_idx].fw_ver.minor);
> +
> +	return 0;
> +}

[Severity: High]
Can sl_media_eeprom_target_fw_ver_str_get() and
sl_media_eeprom_is_fw_version_supported() read out-of-bounds at cable_db[-1]
or format signed -1 firmware versions as "FFFFFFFF.FFFFFFFF"?

First, media_jack->cable_db_idx is initialized and cleared to -1 in
sl_media_data_jack_new() and sl_media_data_jack_cable_state_clr(). Unlike
sl_media_data_cable_db_ops_serdes_settings_get(), which checks:

  if (media_jack->cable_db_idx < 0 || media_jack->cable_db_idx >=3D ARRAY_S=
IZE(cable_db))

neither sl_media_eeprom_target_fw_ver_str_get() nor
sl_media_eeprom_is_fw_version_supported() validates media_jack->cable_db_idx
before indexing cable_db[media_jack->cable_db_idx], and
sl_media_eeprom_target_fw_ver_str_get() does not hold media_jack->data_lock.
If target_firmware_version_hex_show() calls
sl_media_eeprom_target_fw_ver_str_get() while a fake active cable is set,
concurrently with cable insert/remove, or after a duplicate
sl_media_jack_cable_insert() call resets cable_db_idx to -1, this will index
cable_db[-1].

Second, in struct sl_media_cable_attr, fw_ver.major, fw_ver.minor,
fw_ver.split_major, and fw_ver.split_minor are signed s8 fields set to -1 in
cable_db for active cables that have no target firmware version (for exampl=
e,
several SL_MEDIA_TYPE_AEC and non-ss200 SL_MEDIA_TYPE_POC entries). When
passed to snprintf() with "%02X.%02X\n", -1 is sign-extended to 0xFFFFFFFF
and printed as "FFFFFFFF.FFFFFFFF\n".

> diff --git a/drivers/net/ethernet/hpe/sl/media/data/nic/sl_media_data_jac=
k.c b/drivers/net/ethernet/hpe/sl/media/data/nic/sl_media_data_jack.c
> new file mode 100644
> index 0000000000000..9d46b3f13de2c
> --- /dev/null
> +++ b/drivers/net/ethernet/hpe/sl/media/data/nic/sl_media_data_jack.c
> @@ -0,0 +1,496 @@
[ ... ]
> +int sl_media_data_jack_cable_hw_shift_state_get(struct sl_media_jack *me=
dia_jack)
> +{
> +	int rtn;
> +	int i;
> +	u8  downshift_lower_lane_config;
> +	u8  upshift_lower_lane_config;
> +	u8  read_data[4];
> +
> +	sl_media_log_dbg(media_jack, LOG_NAME, "data jack cable hw shift state =
get");
> +
> +	downshift_lower_lane_config =3D (media_jack->appsel_num_200_gaui << 4) =
| DATA_PATH_LOWER_LANE_CONFIG;
> +	upshift_lower_lane_config =3D (media_jack->appsel_num_400_gaui << 4) | =
DATA_PATH_LOWER_LANE_CONFIG;
> +
> +	for (i =3D 0; i < 4; ++i) {
> +		rtn =3D sl_media_io_read8(media_jack, 0x10, 145 + i, &read_data[i]);
> +		if (rtn) {
> +			sl_media_log_err_trace(media_jack, LOG_NAME,
> +					       "SCS0 configuration - config lanes 1-4 - read failed [%d]", =
rtn);
> +			return SL_MEDIA_JACK_CABLE_HW_SHIFT_IO_ERROR;
> +		}
> +	}
> +
> +	if ((read_data[0] =3D=3D downshift_lower_lane_config) &&
> +	    (read_data[1] =3D=3D downshift_lower_lane_config) &&
> +	    (read_data[2] =3D=3D downshift_lower_lane_config) &&
> +	    (read_data[3] =3D=3D downshift_lower_lane_config)) {
> +		sl_media_log_dbg(media_jack, LOG_NAME, "cable is downshifted");
> +		return SL_MEDIA_JACK_CABLE_HW_SHIFT_STATE_DOWNSHIFTED;
> +	} else if ((read_data[0] =3D=3D upshift_lower_lane_config) &&
> +		   (read_data[1] =3D=3D upshift_lower_lane_config) &&
> +		   (read_data[2] =3D=3D upshift_lower_lane_config) &&
> +		   (read_data[3] =3D=3D upshift_lower_lane_config)) {
> +		sl_media_log_dbg(media_jack, LOG_NAME, "cable is upshifted");
> +		return SL_MEDIA_JACK_CABLE_HW_SHIFT_STATE_UPSHIFTED;
> +	}
> +
> +	sl_media_log_dbg(media_jack, LOG_NAME, "cable is in unknown shift state=
");
> +	return SL_MEDIA_JACK_CABLE_HW_SHIFT_STATE_UNKNOWN;
> +}

[Severity: Medium]
What happens in sl_media_data_jack_cable_hw_shift_state_get() when an active
cable does not advertise a 200GAUI-4 or 400GAUI-4 AppSel entry?

Because DATA_PATH_LOWER_LANE_CONFIG is 0x00, if media_jack->appsel_num_200_=
gaui
(or appsel_num_400_gaui) is 0, downshift_lower_lane_config (or
upshift_lower_lane_config) evaluates to 0x00. When SCS0 bytes 145..148 on p=
age
0x10 read as 0x00 (unconfigured after soft reset), read_data[0..3] matches
0x00 and reports SL_MEDIA_JACK_CABLE_HW_SHIFT_STATE_DOWNSHIFTED (or
UPSHIFTED).

During sl_media_jack_cable_insert(), this marks the cable as downshifted,
causing sl_core_hw_serdes_link_up_settings() to disable SerDes scrambling a=
nd
sl_media_jack_cable_downshift() to return early before running
sl_media_jack_cable_shift_checks(). Should
sl_media_data_jack_cable_hw_shift_state_get() check that
appsel_num_200_gaui / appsel_num_400_gaui are non-zero before matching?

> diff --git a/drivers/net/ethernet/hpe/sl/media/data/sl_media_data_jack.c =
b/drivers/net/ethernet/hpe/sl/media/data/sl_media_data_jack.c
> new file mode 100644
> index 0000000000000..17631509afa22
> --- /dev/null
> +++ b/drivers/net/ethernet/hpe/sl/media/data/sl_media_data_jack.c
> @@ -0,0 +1,344 @@
[ ... ]
> +void sl_media_data_cable_serdes_settings_clr(struct sl_media_jack *media=
_jack)
> +{
> +	sl_media_log_dbg(media_jack, LOG_NAME, "serdes settings clr");
> +
> +	memset(&(media_jack->serdes_settings), 0, sizeof(struct sl_media_serdes=
_settings));
> +}
> +
> +void sl_media_data_jack_eeprom_clr(struct sl_media_jack *media_jack)
> +{
> +	sl_media_log_dbg(media_jack, LOG_NAME, "eeprom clr");
> +
> +	memset(media_jack->eeprom_page0, 0, SL_MEDIA_EEPROM_PAGE_SIZE);
> +	memset(media_jack->eeprom_page1, 0, SL_MEDIA_EEPROM_PAGE_SIZE);
> +}

[Severity: Medium]
Should media_jack->serdes_settings, eeprom_page0, and eeprom_page1 be
protected by media_jack->data_lock?

In sl_media_eeprom.c, sl_media_eeprom_media_interface_get() and
sl_media_eeprom_supported_flags_advertised_get() read eeprom_page0 and
eeprom_page1 under spin_lock(&media_jack->data_lock), and all other getters=
 in
sl_media_lgrp.c acquire media_jack->data_lock. However,
sl_media_data_jack_eeprom_clr(), sl_media_data_cable_serdes_settings_clr(),
sl_media_data_cable_db_ops_serdes_settings_get(), and
sl_media_lgrp_media_serdes_settings_get() read and write these fields witho=
ut
holding media_jack->data_lock, which can result in torn reads of
struct sl_media_serdes_settings or eeprom_page0 if link bring-up work or sy=
sfs
reads run concurrently with cable insert/remove.

> diff --git a/drivers/net/ethernet/hpe/sl/media/nic/sl_media_jack.c b/driv=
ers/net/ethernet/hpe/sl/media/nic/sl_media_jack.c
> new file mode 100644
> index 0000000000000..33f1a2a20ab78
> --- /dev/null
> +++ b/drivers/net/ethernet/hpe/sl/media/nic/sl_media_jack.c
> @@ -0,0 +1,315 @@
[ ... ]
> +static void sl_media_jack_cable_attr_errors_update(struct sl_media_jack =
*media_jack, u32 errors)
> +{
> +	sl_media_log_dbg(media_jack, LOG_NAME, "cable attr errors update");
> +
> +	/*
> +	 * only first element is valid in cable_info since single lgrp on nic
> +	 */
> +	media_jack->cable_info[0].media_attr.errors |=3D errors;
> +}
[ ... ]
> +int sl_media_jack_cable_insert(u8 ldev_num, u8 lgrp_num, u8 jack_num,
> +			       u8 *eeprom_page0, u8 *eeprom_page1, u32 flags)
> +{
> +	int                   rtn;
> +	struct sl_media_attr  media_attr;
> +	struct sl_media_jack *media_jack;
> +
> +	media_jack =3D sl_media_data_jack_get(ldev_num, jack_num);
> +	if (!media_jack) {
> +		sl_media_log_err(NULL, LOG_NAME, "media_data_jack_get failed");
> +		return -EFAULT;
> +	}
> +
> +	sl_media_log_dbg(media_jack, LOG_NAME, "cable insert");
> +
> +	/* Start clean so nothing from the previous cable is inherited */
> +	sl_media_data_jack_cable_state_clr(media_jack);
> +
> +	sl_media_jack_fault_cause_set(media_jack, SL_MEDIA_FAULT_CAUSE_NONE);
> +
> +	memset(&media_attr, 0, sizeof(struct sl_media_attr));
> +
> +	media_attr.magic    =3D SL_MEDIA_ATTR_MAGIC;
> +	media_attr.ver      =3D SL_MEDIA_ATTR_VER;
> +	media_attr.size     =3D sizeof(struct sl_media_attr);
> +	media_attr.errors   =3D 0;
> +	media_attr.info     =3D 0;
> +
> +	if (flags & SL_MEDIA_TYPE_BACKPLANE) {
[ ... ]
> +	} else {
> +		memcpy(media_jack->eeprom_page0, eeprom_page0, SL_MEDIA_EEPROM_PAGE_SI=
ZE);
> +
> +		sl_media_data_jack_eeprom_page1_get(media_jack, eeprom_page1);
> +
> +		rtn =3D sl_media_eeprom_format_get(media_jack, &(media_attr.format));
> +		if (rtn) {
> +			sl_media_log_warn_trace(media_jack, LOG_NAME, "eeprom format unsuppor=
ted");
> +			memset(&media_attr, 0, sizeof(struct sl_media_attr));
> +			media_attr.errors |=3D SL_MEDIA_ERROR_CABLE_FORMAT_UNSUPPORTED;
> +			media_attr.errors |=3D SL_MEDIA_ERROR_TRYABLE;
> +			rtn =3D sl_media_jack_cable_attr_set(media_jack, ldev_num, lgrp_num, =
&media_attr);
> +			if (rtn)
> +				sl_media_log_err_trace(media_jack, LOG_NAME, "cable attr set failed =
[%d]", rtn);
> +			sl_media_data_jack_cable_attr_send(media_jack);
> +			return 0;
> +		}
[ ... ]
> +	}
> +
> +	rtn =3D sl_media_jack_cable_attr_set(media_jack, ldev_num, lgrp_num, &m=
edia_attr);
> +	if (rtn) {
> +		sl_media_log_err_trace(media_jack, LOG_NAME, "cable attr set failed [%=
d]", rtn);
> +		return 0;
> +	}
> +
> +	if (media_jack->is_cable_unsupported)
> +		flags |=3D SL_MEDIA_TYPE_UNSUPPORTED;
> +	if (media_attr.vendor =3D=3D SL_MEDIA_VENDOR_MULTILANE)
> +		flags |=3D SL_MEDIA_TYPE_LOOPBACK;
> +	rtn =3D sl_media_data_cable_db_ops_serdes_settings_get(media_jack, medi=
a_attr.type, flags);
> +	if (rtn) {
> +		sl_media_log_err_trace(media_jack, LOG_NAME, "serdes settings get fail=
ed [%d]", rtn);
> +		sl_media_jack_fault_cause_set(media_jack, SL_MEDIA_FAULT_CAUSE_SERDES_=
SETTINGS_GET);
> +		sl_media_data_jack_cable_attr_send(media_jack);
> +		return 0;
> +	}
> +
> +	if (SL_MEDIA_LGRP_MEDIA_TYPE_IS_ACTIVE(media_attr.type)) {
> +		rtn =3D sl_media_data_jack_cable_soft_reset(media_jack);
> +		if (rtn) {
> +			sl_media_log_err_trace(media_jack, LOG_NAME, "cable soft reset failed=
 [%d]", rtn);
> +			sl_media_jack_state_set(media_jack, SL_MEDIA_JACK_CABLE_ERROR);
> +			sl_media_jack_cable_attr_errors_update(media_jack, SL_MEDIA_ERROR_CAB=
LE_HEADSHELL_FAULT);
> +			sl_media_data_jack_cable_attr_send(media_jack);
> +			return rtn;
> +		}
> +
> +		/* must be last in the sequence because it needs time to load firmware=
 */
> +		rtn =3D sl_media_jack_cable_high_power_set(ldev_num, jack_num);
> +		if (rtn) {
> +			sl_media_log_err_trace(media_jack, LOG_NAME, "cable high power set fa=
iled [%d]", rtn);
> +			sl_media_jack_state_set(media_jack, SL_MEDIA_JACK_CABLE_ERROR);
> +			sl_media_jack_cable_attr_errors_update(media_jack, SL_MEDIA_ERROR_CAB=
LE_HEADSHELL_FAULT);
> +			sl_media_data_jack_cable_attr_send(media_jack);
> +			return 0;
> +		}
> +	}
> +
> +	rtn =3D sl_sysfs_media_speeds_create(ldev_num, lgrp_num);
> +	if (rtn) {
> +		sl_media_log_err_trace(media_jack, LOG_NAME, "media speeds create fail=
ed [%d]", rtn);
> +		sl_media_data_jack_cable_attr_send(media_jack);
> +		return rtn;
> +	}

[Severity: Medium]
There appear to be several state-handling issues in
sl_media_jack_cable_insert():

1. When sl_media_eeprom_format_get() fails, memset(&media_attr, 0, ...) wip=
es
   out media_attr.magic, media_attr.ver, and media_attr.size that were set
   earlier, and returns 0 without setting serdes_settings or updating
   media_jack->state from SL_MEDIA_JACK_CABLE_REMOVED (even though
   SL_MEDIA_ERROR_TRYABLE is set).

2. sl_media_data_jack_cable_state_clr(media_jack) is called at the start of
   sl_media_jack_cable_insert(), and eeprom_page0/page1, cable_db_idx, and
   appsel_* are overwritten before sl_media_jack_cable_attr_set() checks
   whether real_cable_status =3D=3D CABLE_MEDIA_ATTR_ADDED. If a cable is a=
lready
   inserted, the existing cable's state on media_jack is clobbered and the
   -EEXIST error from sl_media_jack_cable_attr_set() is swallowed by return=
ing
   0.

3. Conversely, after sl_media_jack_cable_attr_set() sets real_cable_status =
to
   CABLE_MEDIA_ATTR_ADDED, if sl_media_data_jack_cable_soft_reset() or
   sl_sysfs_media_speeds_create() fails, sl_media_jack_cable_insert() retur=
ns
   a non-zero error while leaving real_cable_status as CABLE_MEDIA_ATTR_ADD=
ED,
   which causes subsequent sl_media_jack_cable_insert() calls to fail with
   -EEXIST.

4. sl_media_jack_cable_attr_errors_update() modifies
   media_jack->cable_info[0].media_attr.errors without holding
   media_jack->data_lock, and does not update stashed_media_attr.errors when
   real_cable_status is CABLE_MEDIA_ATTR_STASHED.

Could sl_media_jack_cable_insert() check for an existing cable before clear=
ing
jack state, preserve magic/ver/size on format error, and keep
real_cable_status consistent on error returns?

> diff --git a/drivers/net/ethernet/hpe/sl/media/sl_media_jack.c b/drivers/=
net/ethernet/hpe/sl/media/sl_media_jack.c
> new file mode 100644
> index 0000000000000..14be1d19c097e
> --- /dev/null
> +++ b/drivers/net/ethernet/hpe/sl/media/sl_media_jack.c
> @@ -0,0 +1,1067 @@
[ ... ]
> +int sl_media_jack_cable_downshift(u8 ldev_num, u8 lgrp_num, u8 link_num)
> +{
> +	int                   rtn;
> +	struct sl_media_lgrp *media_lgrp;
> +	struct sl_core_link *core_link __free(sl_core_link_put) =3D NULL;
> +	struct sl_media_attr  media_attr;
> +
> +	media_lgrp =3D sl_media_lgrp_get(ldev_num, lgrp_num);
> +	core_link =3D sl_core_link_get(ldev_num, lgrp_num, link_num);
> +	if (!core_link)
> +		return -ENODEV;
[ ... ]
> +int sl_media_jack_cable_upshift(u8 ldev_num, u8 lgrp_num, u8 link_num)
> +{
> +	int                   rtn;
> +	struct sl_media_lgrp *media_lgrp;
> +	struct sl_core_link *core_link __free(sl_core_link_put) =3D NULL;
> +	struct sl_media_attr  media_attr;
> +
> +	media_lgrp =3D sl_media_lgrp_get(ldev_num, lgrp_num);
> +	core_link =3D sl_core_link_get(ldev_num, lgrp_num, link_num);
> +	if (!core_link)
> +		return -ENODEV;

[Severity: Low]
This isn't a bug, but per the kernel cleanup.h conventions, could core_link
in sl_media_jack_cable_downshift() and sl_media_jack_cable_upshift() be
defined and initialized in a single statement rather than declared as "=3D =
NULL"
and assigned later?

[ ... ]
> +int sl_media_jack_attr_error_map_str(unsigned long error_map, char *erro=
r_str, unsigned int error_str_size)
> +{
[ ... ]
> +		if (str_pos + rtn >=3D error_str_size) {
> +			error_str[str_pos - 2] =3D '.';
> +			error_str[str_pos - 3] =3D '.';
> +			error_str[str_pos - 4] =3D '.';
> +			break;
> +		}
> +		str_pos +=3D rtn;
> +	}
> +
> +out:
> +	error_str[str_pos - 1] =3D '\0';
> +
> +	return 0;
> +}

[Severity: Low]
When str_pos + rtn >=3D error_str_size in sl_media_jack_attr_error_map_str(=
),
does writing to error_str[str_pos - 2..str_pos - 4] and NUL-terminating at
error_str[str_pos - 1] overwrite the end of the preceding token instead of
placing the ellipsis at the end of error_str (unlike
sl_link_down_cause_map_masked_str() in sl_link.c, which sets
str_pos =3D cause_str_size - 1 first)?

> diff --git a/drivers/net/ethernet/hpe/sl/media/sl_media_lgrp.c b/drivers/=
net/ethernet/hpe/sl/media/sl_media_lgrp.c
> new file mode 100644
> index 0000000000000..b15805a822702
> --- /dev/null
> +++ b/drivers/net/ethernet/hpe/sl/media/sl_media_lgrp.c
> @@ -0,0 +1,498 @@
[ ... ]
> +bool sl_media_lgrp_media_has_error(struct sl_media_lgrp *media_lgrp)
> +{
> +	struct sl_media_attr media_attr;
> +
> +	sl_media_lgrp_media_attr_get(media_lgrp->media_ldev->num, media_lgrp->n=
um, &media_attr);
> +
> +	sl_media_log_dbg(media_lgrp, SL_MEDIA_LGRP_LOG_NAME,
> +			 "media has error (media_attr.errors =3D 0x%X)", media_attr.errors);
> +
> +	return ((media_attr.errors & (SL_MEDIA_ERROR_CABLE_FORMAT_UNSUPPORTED |
> +				      SL_MEDIA_ERROR_CABLE_FW_UNSUPPORTED)) !=3D 0);
> +}

[Severity: Medium]
Should sl_media_lgrp_media_has_error() also check for
SL_MEDIA_ERROR_CABLE_HEADSHELL_FAULT?

In sl_media_jack_cable_insert(), when sl_media_jack_cable_high_power_set()
fails, it sets media_jack->state to SL_MEDIA_JACK_CABLE_ERROR, sets
SL_MEDIA_ERROR_CABLE_HEADSHELL_FAULT in media_attr.errors, and returns 0.
Because sl_media_lgrp_media_has_error() does not test
SL_MEDIA_ERROR_CABLE_HEADSHELL_FAULT, sl_core_hw_link_media_check() treats a
cable with a headshell fault as having no media error during link bring-up.

[ ... ]
> +void sl_media_lgrp_cable_temp_flags_clr(u8 ldev_num, u8 lgrp_num)
> +{
> +	u8                   i;
> +	struct sl_media_lgrp *media_lgrp;
> +
> +	media_lgrp =3D sl_media_lgrp_get(ldev_num, lgrp_num);
> +
> +	sl_media_log_dbg(media_lgrp, SL_MEDIA_LGRP_LOG_NAME, "cable temp flags =
clr");
> +
> +	for (i =3D 0; i < media_lgrp->media_jack->port_count; ++i) {
> +		if (sl_media_lgrp_media_type_is_active(ldev_num, lgrp_num)) {
> +			sl_media_lgrp_hot_client_ready_set(ldev_num, lgrp_num, false);
> +			sl_media_jack_cable_hot_notif_sent_set(media_lgrp->media_jack,
> +							       &media_lgrp->media_jack->cable_info[i], false);
> +			sl_media_lgrp_warm_client_ready_set(ldev_num, lgrp_num, false);
> +			sl_media_jack_cable_warm_notif_sent_set(media_lgrp->media_jack,
> +								&media_lgrp->media_jack->cable_info[i], false);
> +			sl_media_lgrp_cold_client_ready_set(ldev_num, lgrp_num, false);
> +			sl_media_jack_cable_cold_notif_sent_set(media_lgrp->media_jack,
> +								&media_lgrp->media_jack->cable_info[i], false);
> +		}
> +	}
> +}

[Severity: Medium]
Does the loop in sl_media_lgrp_cable_temp_flags_clr() ever execute?

Neither sl_media_data_jack_new() nor sl_media_data_jack_scan() initializes
media_jack->port_count, so it remains 0 and none of the client_ready or
notif_sent flags are cleared when sl_ctrl_lgrp_notif_callback_unreg() calls
sl_media_lgrp_cable_temp_flags_clr(). Also, if an active cable is removed
before the client unregisters its notification callback, gating the cleanup=
 on
sl_media_lgrp_media_type_is_active() will leave hot_client_ready,
warm_client_ready, and cold_client_ready set.

[ ... ]
> +int sl_media_lgrp_vendor_pn_str_get(struct sl_media_lgrp *media_lgrp, ch=
ar *vendor_pn_str)
> +{
> +	spin_lock(&media_lgrp->media_jack->data_lock);
> +	switch (media_lgrp->cable_info->real_cable_status) {
> +	case CABLE_MEDIA_ATTR_ADDED:
> +		strscpy_pad(vendor_pn_str,
> +			    media_lgrp->cable_info->media_attr.vendor_pn_str, SL_MEDIA_VENDOR=
_PN_SIZE);
> +		break;
> +	case CABLE_MEDIA_ATTR_STASHED:
> +		strscpy_pad(vendor_pn_str,
> +			    media_lgrp->cable_info->stashed_media_attr.vendor_pn_str, SL_MEDI=
A_VENDOR_PN_SIZE);
> +		break;
> +	default:
> +		memset(vendor_pn_str, '0', SL_MEDIA_VENDOR_PN_SIZE - 2);
> +		vendor_pn_str[SL_MEDIA_VENDOR_PN_SIZE - 1] =3D '\0';
> +	}
> +	spin_unlock(&media_lgrp->media_jack->data_lock);
> +
> +	return 0;
> +}
[ ... ]
> +int sl_media_lgrp_hpe_pn_str_get(struct sl_media_lgrp *media_lgrp, char =
*hpe_pn_str)
> +{
> +	spin_lock(&media_lgrp->media_jack->data_lock);
> +	switch (media_lgrp->cable_info->real_cable_status) {
> +	case CABLE_MEDIA_ATTR_ADDED:
> +		strscpy_pad(hpe_pn_str,
> +			    media_lgrp->cable_info->media_attr.hpe_pn_str, SL_MEDIA_HPE_PN_SI=
ZE);
> +		break;
> +	case CABLE_MEDIA_ATTR_STASHED:
> +		strscpy_pad(hpe_pn_str,
> +			    media_lgrp->cable_info->stashed_media_attr.hpe_pn_str, SL_MEDIA_H=
PE_PN_SIZE);
> +		break;
> +	default:
> +		memset(hpe_pn_str, '0', SL_MEDIA_HPE_PN_SIZE - 2);
> +		hpe_pn_str[SL_MEDIA_HPE_PN_SIZE - 1] =3D '\0';
> +	}
> +	spin_unlock(&media_lgrp->media_jack->data_lock);
> +
> +	return 0;
> +}
[ ... ]
> +int sl_media_lgrp_date_code_str_get(struct sl_media_lgrp *media_lgrp, ch=
ar *date_code_str)
> +{
> +	spin_lock(&media_lgrp->media_jack->data_lock);
> +	switch (media_lgrp->cable_info->real_cable_status) {
> +	case CABLE_MEDIA_ATTR_ADDED:
> +		strscpy_pad(date_code_str,
> +			    media_lgrp->cable_info->media_attr.date_code_str, SL_MEDIA_DATE_C=
ODE_SIZE);
> +		break;
> +	case CABLE_MEDIA_ATTR_STASHED:
> +		strscpy_pad(date_code_str,
> +			    media_lgrp->cable_info->stashed_media_attr.date_code_str, SL_MEDI=
A_DATE_CODE_SIZE);
> +		break;
> +	default:
> +		memset(date_code_str, '0', SL_MEDIA_DATE_CODE_SIZE - 2);
> +		date_code_str[SL_MEDIA_DATE_CODE_SIZE - 1] =3D '\0';
> +	}
> +	spin_unlock(&media_lgrp->media_jack->data_lock);
> +
> +	return 0;
> +}

[Severity: High]
In the default branches of sl_media_lgrp_vendor_pn_str_get(),
sl_media_lgrp_hpe_pn_str_get(), and sl_media_lgrp_date_code_str_get(), call=
ing
memset(..., '0', SIZE - 2) fills indices 0 through SIZE - 3 and then sets
index SIZE - 1 to '\0', leaving the byte at index SIZE - 2 uninitialized.

When vendor_pn_show(), hpe_pn_show(), or date_code_show() in sl_sysfs_media=
.c
passes an uninitialized stack buffer and prints the string with sysfs_emit(=
),
doesn't this leak an uninitialized stack byte at index SIZE - 2 to userspace
(unlike sl_media_lgrp_serial_num_str_get(), which uses
SL_MEDIA_SERIAL_NUM_SIZE - 1)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030-cxi-netdev=
-submission-v1-0-8c2c391cc283@hpe.com?part=3D13
